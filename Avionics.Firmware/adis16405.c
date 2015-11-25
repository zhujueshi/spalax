/*
 * ADXL3x5 Driver (ADXL345, ADXL375)
 * M2FC
 * 2014 Adam Greig, Cambridge University Spaceflight
 */

#include <stdlib.h>
#include "ch.h"
#include "chprintf.h"
#include "adis16405.h"

#define ADIS16405_SPID         SPID1
#define ADIS16405_SPI_CS_PORT  GPIOC
#define ADIS16405_SPI_CS_PIN   GPIOC_ACCEL_CS


static BinarySemaphore sensor_semaphore;

static uint16_t adis16405_read_u16(uint8_t addr_in) {
    // All transfers are 16 bits
    // Addresses are 7 bits
    // We therefore address using the following system for reading

    // MSB --- LSB
    // 0 write bit, 7 bit address, 8 bits of 0
    // For example, 0x0A00 would read address 0x0A

    // Clear write bit
    addr_in &= ~(1<<7);
    // Shift into position
    uint16_t addr_out = addr_in << 8;
    uint16_t data_out;

    spiSelect(&ADIS16405_SPID);
    spiSend(&ADIS16405_SPID, 1, (void*)&addr_out);
    spiSend(&ADIS16405_SPID, 1, (void*)&data_out);
    spiUnselect(&ADIS16405_SPID);

    return data_out;
}

static void adis16405_write_u8(uint8_t addr_in, uint8_t val) {
    // All transfers are 16 bits
    // Addresses are 7 bits
    // We therefore address using the following system

    // MSB --- LSB
    // 1 Write bit, 7 bit address, 8 bits of data
    // For example, 0xA11F loads 0x1F into location 0x21

    addr_in |= (1 << 7);
    uint16_t tx = addr_in << 8 | val;

    spiSelect(&ADIS16405_SPID);
    spiSend(&ADIS16405_SPID, 1, (void*)&tx);
    spiUnselect(&ADIS16405_SPID);
}

static void adis16405_burst_read(uint16_t data_out[12]) {
    // Burst mode data collection is a more efficient way of reading the sensor data
    // We write the value 0x3E00
    // Then for the next 12 clock periods the sensor module will write back the sensor data
    // The order is:
    //     SUPPLY_OUT, XGYRO_OUT, YGYRO_OUT, ZGYRO_OUT, XACCL_OUT, YACCL_OUT, ZACCL_OUT
    //     XMAGN_OUT, YMAGN_OUT, ZMAGN_OUT, TEMP_OUT, AUX_ADC

    // All bar the final 2 have 14 bits of data - the final 2 are only 12 bits
    // The MSB (bit 15) is the ND flag - it is 1 if this data hasn't been read before
    // Bit 14 is the EA flag - it is 1 if there is an error flag in the DIAG_STAT register

    uint16_t magic_number = 0x3E00;
    spiSelect(&ADIS16405_SPID);
    spiSend(&ADIS16405_SPID, 1, (void*)&magic_number);
    spiSend(&ADIS16405_SPID, 12, (void*)&data_out);
    spiUnselect(&ADIS16405_SPID);

    for (int i = 0; i < 12; i++) {

        if((data_out[i]>>15) & 1 == 1)
        {
          // TODO Check what should happen if there is an error
          //Do something error flag
        }
        if((data_out[i]>>14) & 1 == 1)
        {
          // Do something data has already been read
        }

        data_out[i] &= ~(1<<15||1<<14);
    }
}

static void adis16405_init(SPIDriver* SPID) {
    (void)SPID;

    // TODO: Initialize sensor - setting control register to appropriate values
    // TODO: Perform self test - possibly split out as separate method
    // Set the registers to the default value and perform
    // Highest rate possible, doesn't matter about power,dynamic range, 75 degrees per sec

    //Check the values below should more be defined
    // Setting the data rate to 75 degrees per sec 0x0402
    adis16405_write_u8(0x38,0x04);
    adis16405_write_u8(0x39,0x01);

    // Setting the data rate to the default of 819.2 samples per second 0x0001
    adis16405_write_u8(0x36,0x01);

    // Setting sleep mode 0x0000 turn sleep mode off
    adis16405_write_u8(0x03,0x00);

    //Self tests - using the internal testing routine - do all self test
    adis16405_write_u8(0xB5,0x04);
    // Infinite loop or use a better method
    while (((adis16405_read_u16(0x34)>>10) & 1) = 0 )

    if(adis16405_read_u16(0x3C) != 0x00)
    {
        // Error check what should be done
    }
}

void adis16405_wakeup(EXTDriver *extp, expchannel_t channel) {
    (void)extp;
    (void)channel;

    chSysLockFromIsr();
    chBSemSignalI(&sensor_semaphore);
    chSysUnlockFromIsr();
}

msg_t adis16405_thread(void *arg) {
    (void)arg;
    const SPIConfig spi_cfg = {
        NULL,
        ADIS16405_SPI_CS_PORT,
        ADIS16405_SPI_CS_PIN,
        // CPOL, CPHA, MSB First, 16-bit frame
        // Clock rate should be <= 1 MHz for burst mode
        // I believe this sets it to 168000000 / 4 / 64 ~= 1MHz
        // TODO: Verify this
        SPI_CR1_BR_2 | SPI_CR1_CPOL | SPI_CR1_CPHA | SPI_CR1_DFF
    };

    chBSemInit(&sensor_semaphore, true);

    chRegSetThreadName("ADIS16405");

    spiStart(&ADIS16405_SPID, &spi_cfg);
    adis16405_init(&ADIS16405_SPID);

    uint16_t raw_data[12];

    uint16_t gyro[3];
    uint16_t accel[3];
    uint16_t magno[3];

    while(TRUE) {
        chSysLock();
        chBSemWaitTimeoutS(&sensor_semaphore, 100);
        chSysUnlock();

        adis16405_burst_read(raw_data);

        //Factor of 0.0125 is for when operating with 75 degrees/sec
        for (int i = 0;i<3;i++)
        gyro[i] = 0.0125*3.141592654*(1/180)*(uint16_t)(raw_data[i+1]);

        //Factor on data sheet 3.33mg
        for (int i = 0;i<3;i++)
        accel[i] = 0.001*9.81*3.33*(uint16_t)(raw_data[i+4]);

        // Magno data in mgauss, prefer it in tesla
        for (int i = 0;i<3;i++)
        magno[i] = 0.5*(uint16_t)(raw_data[i+7]);

        // TODO: Send sensor data off to state estimators
    }
}
