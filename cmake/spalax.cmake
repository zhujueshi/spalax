set(SPALAX_CONF "spalax")

get_filename_component(CURRENT_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
SET(CMAKE_MODULE_PATH ${CURRENT_DIR}/../external/stm32-cmake/cmake) 

set(STM32_CHIP "STM32F407VG")
include(gcc_stm32)

set(BUILD_SHARED_LIBS OFF)

ADD_DEFINITIONS(-DCORTEX_USE_FPU=TRUE)
