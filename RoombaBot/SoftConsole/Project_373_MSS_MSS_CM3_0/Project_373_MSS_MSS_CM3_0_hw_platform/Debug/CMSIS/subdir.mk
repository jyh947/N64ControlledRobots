################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../CMSIS/brownout_isr.c \
../CMSIS/core_cm3.c \
../CMSIS/system_a2fxxxm3.c 

OBJS += \
./CMSIS/brownout_isr.o \
./CMSIS/core_cm3.o \
./CMSIS/system_a2fxxxm3.o 

C_DEPS += \
./CMSIS/brownout_isr.d \
./CMSIS/core_cm3.d \
./CMSIS/system_a2fxxxm3.d 


# Each subdirectory must supply rules for building sources it contributes
CMSIS/%.o: ../CMSIS/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU C Compiler'
	arm-none-eabi-gcc -mthumb -mcpu=cortex-m3 -DACTEL_STDIO_THRU_UART -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\CMSIS -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\CMSIS\startup_gcc -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\drivers -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\drivers\mss_gpio -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\drivers\mss_nvm -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\drivers\mss_pdma -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\drivers\mss_rtc -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\drivers\mss_timer -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\hal -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\hal\CortexM3 -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\hal\CortexM3\GNU -O0 -ffunction-sections -fdata-sections -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


