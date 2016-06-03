#include <stdlib.h>
#include <math.h> // for self-test
#include <machine/endian.h>

#include "ch.h"
#include "chprintf.h"
#include "mpu9250.h"
#include "badthinghandler.h"
#include "compilermacros.h"
#include "mpu9250-reg.h"
#include "messaging.h"

#define MPU9250_SPID         SPID1
#define MPU9250_SPI_CS_PORT  GPIOA
#define MPU9250_SPI_CS_PIN   GPIOA_MPU_NSS

static BinarySemaphore mpu9250_semaphore;

//// LOW-LEVEL COMMUNICATION ////

// mpu9250_read_u8 reads a single byte value from an 8-bit MPU9250 register
static uint8_t mpu9250_read_u8(uint8_t addr);

// mpu9250_read_multiple reads a multi-byte register from the MPU9250 into a
// memory buffer. The buffer pointed to by buf should have at least num bytes
// available.
static void mpu9250_read_multiple(uint8_t addr, uint8_t* buf, int num);

// mpu9250_write_u8 writes a single byte into an 8-bit MPU9250 register.
static void mpu9250_write_u8(uint8_t addr, uint8_t val);

//// HIGH-LEVEL OPERATIONS ////

// mpu9250_read_accel_temp_gyro will grab all the sensor data and writes it to out which
// must point to a buffer of at least 10 uint16_t-s. The values written are:
// ACCEL_XOUT, ACCEL_YOUT, ACCEL_ZOUT, TEMP_OUT, GYRO_XOUT, GYRO_YOUT, GYRO_ZOUT
// MAGNO_XOUT, MAGNO_YOUT, MAGNO_ZOUT
static void mpu9250_read_accel_temp_gyro(uint16_t *out);

// mpu9250_self_test_gyro performs a self-test on the gyroscope. It returns true
// iff the self-test passed.
static bool mpu9250_self_test_gyro(void);

// mpu9250_self_test_accel performs a self-test on the accelerometer. It returns
// true iff the self-test passed.
static bool mpu9250_self_test_accel(void);

//// INTERNAL FUNCTIONS ////

// mpu9250_self_test_to_factory_trim takes self-test register values and
// transforms them to the corresponding factory trim values which should match
// the sensor readings. (It is assumed that the full-scale select is 00 ==
// +/-250 deg/sec.) It appears non-trivial to find the application note which
// describes the self-test procedure. This formula was lifted from [1].
//
// [1] https://github.com/kriswiner/MPU-9250/blob/master/MPU9250BasicAHRS.ino
static inline uint16_t mpu9250_self_test_to_factory_trim(uint8_t st_val) {
    return (uint16_t)(2620.f * powf(1.01f, ((float)st_val) - 1.f));
}

static uint8_t mpu9250_read_u8(uint8_t addr) {
    uint8_t read_val;
    mpu9250_read_multiple(addr, &read_val, 1);
    return read_val;
}

static void mpu9250_read_multiple(uint8_t addr, uint8_t* buf, int num) {
    // Set the read bit
    addr |= (1 << 7);

    spiSelect(&MPU9250_SPID);
    spiSend(&MPU9250_SPID, 1, (void*)&addr);
    spiReceive(&MPU9250_SPID, num, (void*)buf);
    spiUnselect(&MPU9250_SPID);
}

static void mpu9250_write_u8(uint8_t addr, uint8_t val) {
    // Clear the read bit
    addr &= ~(1 << 7);

    uint8_t tx_buff[2];
    tx_buff[0] = addr;
    tx_buff[1] = val;

    spiSelect(&MPU9250_SPID);
    spiSend(&MPU9250_SPID, 2, (void*)&tx_buff);
    spiUnselect(&MPU9250_SPID);
}

static void mpu9250_i2c_slave0_write_u8(uint8_t addr, uint8_t val) {
    mpu9250_write_u8(MPU9250_REG_I2C_SLV0_ADDR, AK893_I2C_ADDR);
    chThdSleepMilliseconds(5);
    mpu9250_write_u8(MPU9250_REG_I2C_SLV0_REG, addr);
    chThdSleepMilliseconds(5);
    mpu9250_write_u8(MPU9250_REG_I2C_SLV0_DO, val);
    chThdSleepMilliseconds(5);
    mpu9250_write_u8(MPU9250_REG_I2C_SLV0_CTRL, 0b10100001);
    // Sleep a little to allow the I2C transaction to occur
    chThdSleepMilliseconds(5);
}

static uint8_t mpu9250_i2c_slave0_read_u8(uint8_t addr) {
    mpu9250_write_u8(MPU9250_REG_I2C_SLV0_ADDR, AK893_I2C_ADDR | 0x80);
    chThdSleepMilliseconds(5);
    mpu9250_write_u8(MPU9250_REG_I2C_SLV0_REG, addr);
    chThdSleepMilliseconds(5);
    mpu9250_write_u8(MPU9250_REG_I2C_SLV0_CTRL, 0x81);

    // Sleep a little to allow the I2C transaction to occur
    chThdSleepMilliseconds(5);

    return mpu9250_read_u8(MPU9250_REG_EXT_SENS_DATA_00);
}

static void mpu9250_read_accel_temp_gyro(uint16_t *out) {
    // Cast output to uint8_t buffer
    uint8_t *out_u8 = (uint8_t*)out;

    // Read accel, temp and gyro.
    mpu9250_read_multiple(MPU9250_REG_ACCEL_XOUT_H, out_u8, 14);

    // Convert buffer to host endian-ness
#if BYTE_ORDER != BIG_ENDIAN
    for(int i=0; i<14; i+=2) {
        uint8_t tmp = out_u8[i];
        out_u8[i] = out_u8[i+1];
        out_u8[i+1] = tmp;
    }
#endif
}

static bool mpu9250_i2c_id_check(void) {
    uint8_t whoami = mpu9250_i2c_slave0_read_u8(AK8963_REG_WHO_AM_I);
    return whoami == AK893_WHO_AM_I_RESET_VALUE;
}

static bool mpu9250_spi_id_check(void) {
    uint8_t whoami = mpu9250_read_u8(MPU9250_REG_WHO_AM_I);
    return whoami == MPU9250_WHO_AM_I_RESET_VALUE;
}

static bool mpu9250_self_test_gyro(void) {
    uint8_t old_config;
    uint8_t factory_st_output[3];
    uint16_t base_data[10], self_test_data[10];

    // Read old gyroscope config
    old_config = mpu9250_read_u8(MPU9250_REG_GYRO_CONFIG);

    // Gyro config => range of +/- 250 degrees/sec
    mpu9250_write_u8(MPU9250_REG_GYRO_CONFIG, 0x00);

    // Delay for a short while to let device stabilise
    chThdSleepMilliseconds(50);

    // Read baseline data
    mpu9250_read_accel_temp_gyro(base_data);

    // Set gyro config to self test on all axes with gyro range of +/- 250
    // degrees/s
    mpu9250_write_u8(MPU9250_REG_GYRO_CONFIG, 0xe0);

    // Delay for a short while to let device stabilise
    chThdSleepMilliseconds(50);

    // Read self-test data
    mpu9250_read_accel_temp_gyro(self_test_data);

    // Preserve previous config
    mpu9250_write_u8(MPU9250_REG_GYRO_CONFIG, old_config);

    // Subtract base readings from self-test readings
    for(int i=4; i<7; ++i) { self_test_data[i] -= base_data[i]; }

    // Read factory self-test output for gyro
    mpu9250_read_multiple(MPU9250_REG_SELF_TEST_X_GYRO, factory_st_output, 3);

    // Convert this to expected values for self-test output and check absolute
    // difference from measured. Fail if the difference is greater than 5% of
    // the expected value.
    for(int i=0; i<3; ++i) {
        int16_t expected_val =
            (int16_t) mpu9250_self_test_to_factory_trim(factory_st_output[i]);
        int32_t delta = (int32_t)self_test_data[i+4] - (int32_t)expected_val;
        if(abs(delta) > abs(expected_val)/20) {
            // We fail :(
            return false;
        }
    }

    return true;
}

static bool mpu9250_self_test_accel(void) {
    uint8_t old_config, old_config_2;
    uint8_t factory_st_output[3];
    uint16_t base_data[10], self_test_data[10];

    // Read old config
    old_config = mpu9250_read_u8(MPU9250_REG_ACCEL_CONFIG);
    old_config_2 = mpu9250_read_u8(MPU9250_REG_ACCEL_CONFIG_2);

    // Accel config => +/- 2g
    mpu9250_write_u8(MPU9250_REG_ACCEL_CONFIG, 0x00);
    mpu9250_write_u8(MPU9250_REG_ACCEL_CONFIG_2, 0x00);

    // Delay for a short while to let device stabilise
    chThdSleepMilliseconds(50);

    // Read baseline data
    mpu9250_read_accel_temp_gyro(base_data);

    // Set accel config to self test on all axes with accel range of +/- 2g
    mpu9250_write_u8(MPU9250_REG_ACCEL_CONFIG, 0xe0);

    // Delay for a short while to let device stabilise
    chThdSleepMilliseconds(50);

    // Read self-test data
    mpu9250_read_accel_temp_gyro(self_test_data);

    // Preserve previous config
    mpu9250_write_u8(MPU9250_REG_ACCEL_CONFIG, old_config);
    mpu9250_write_u8(MPU9250_REG_ACCEL_CONFIG_2, old_config_2);

    // Subtract base readings from self-test readings
    for(int i=0; i<3; ++i) { self_test_data[i] -= base_data[i]; }

    // Read factory self-test output for gyro
    mpu9250_read_multiple(MPU9250_REG_SELF_TEST_X_ACCEL, factory_st_output, 3);

    // Convert this to expected values for self-test output and check absolute
    // difference from measured. Fail if the difference is greater than 5% of
    // the expected value.
    for(int i=0; i<3; ++i) {
        int16_t expected_val =
            (int16_t) mpu9250_self_test_to_factory_trim(factory_st_output[i]);
        int32_t delta = (int32_t)self_test_data[i] - (int32_t)expected_val;
        if(abs(delta) > abs(expected_val)/20) {
            // We fail :(
            return false;
        }
    }

    return true;
}

static void mpu9250_init(void) {
    // Register/value pairs to reset/initialise MPU9250
    uint8_t init_sequence[][2] = {
        { MPU9250_REG_PWR_MGMT_1, 0x80 }, // Reset
        { MPU9250_REG_PWR_MGMT_1, 0x01 }, // Select best clock source
        { MPU9250_REG_PWR_MGMT_2, 0x00 }, // Enable gyro & accel
        { MPU9250_REG_USER_CTRL,   0b00110010 }, // SPI only, disable FIFO, Enable the I2C Master Module
        { MPU9250_REG_INT_PIN_CFG, 0b00110000}, // Latch Interrupt and clear on read
        { MPU9250_REG_INT_ENABLE,  0b00000001}, // Enable interrupt on data ready
        { MPU9250_REG_I2C_MST_CTRL, 0b00011000}, // Set I2C clock rate to 400kHz
    };

    // Perform initial reset
    for(size_t i=0; i < sizeof(init_sequence)/sizeof(init_sequence[0]); ++i) {
        mpu9250_write_u8(init_sequence[i][0], init_sequence[i][1]);
        chThdSleepMilliseconds(10);
    }

    // Reset Magnetometer
    mpu9250_i2c_slave0_write_u8(AK8963_REG_CNTL2, 0x01);

    // Continuous 16-bit measurement
    mpu9250_i2c_slave0_write_u8(AK8963_REG_CNTL1, 0x12);
}

void mpu9250_wakeup(EXTDriver *extp, expchannel_t channel) {
    (void)extp;
    (void)channel;

    chSysLockFromIsr();
    chBSemSignalI(&mpu9250_semaphore);
    chSysUnlockFromIsr();
}

MESSAGING_PRODUCER(messaging_producer, telemetry_source_mpu9250, telemetry_source_mask_mpu9250, (sizeof(telemetry_header_t) + sizeof(mpu9250_data_t)) * 40)

msg_t mpu9250_thread(COMPILER_UNUSED_ARG(void *arg)) {
    const SPIConfig spi_cfg = {
        NULL,
        MPU9250_SPI_CS_PORT,
        MPU9250_SPI_CS_PIN,
        // CPOL, CPHA, MSB First, 8-bit frame
        // Clock rate should be <= 1 MHz for burst mode
        // I believe this sets it to 168000000 / 4 / 64 ~= 1MHz
        // TODO: Verify this
        SPI_CR1_BR_1 | SPI_CR1_BR_0 | SPI_CR1_CPOL | SPI_CR1_CPHA
    };

    chBSemInit(&mpu9250_semaphore, true);

    chRegSetThreadName("MPU9250");

    spiStart(&MPU9250_SPID, &spi_cfg);

    COMPONENT_STATE_UPDATE(avionics_component_mpu9250, state_initializing);

    // Wait for startup
    while (!mpu9250_spi_id_check()) {
        chThdSleepMilliseconds(50);
    }

    // Log that we have passed the id check
    COMPONENT_STATE_UPDATE(avionics_component_mpu9250, state_initializing);

    mpu9250_init();

    // Log that we have passed init
    COMPONENT_STATE_UPDATE(avionics_component_mpu9250, state_initializing);

    while (!mpu9250_i2c_id_check()) {
        chThdSleepMilliseconds(50);
    }
    // Log that we have passed I2C ID Check
    COMPONENT_STATE_UPDATE(avionics_component_mpu9250, state_initializing);


    // Perform a self-test of the MPU9250
    while(!mpu9250_self_test_gyro()) {
        chThdSleepMilliseconds(50);
    }

    // Log that we have passed the gyro self test
    COMPONENT_STATE_UPDATE(avionics_component_mpu9250, state_initializing);

    while(!mpu9250_self_test_accel()) {
        chThdSleepMilliseconds(50);
    }

    COMPONENT_STATE_UPDATE(avionics_component_mpu9250, state_ok);

    messaging_producer_init(&messaging_producer);


    mpu9250_data_t data;
    int count = mpu9250_send_over_usb_count;
    while(TRUE) {
        chSysLock();
        chBSemWaitTimeoutS(&mpu9250_semaphore, 100);
        chSysUnlock();

        mpu9250_read_accel_temp_gyro((uint16_t*)&data);
        message_metadata_t flags = 0;

        if (count == mpu9250_send_over_usb_count)
            count = 0;
        else {
            flags |= message_flags_dont_send_over_usb;
            count++;
        }

        messaging_producer_send(&messaging_producer, 0, flags, (const uint8_t*)&data, 20);
        chThdYield(); // Ensure other threads actually get a chance to run
    }
}
