################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../hal/CortexM3/cortex_nvic.c 

OBJS += \
./hal/CortexM3/cortex_nvic.o 

C_DEPS += \
./hal/CortexM3/cortex_nvic.d 


# Each subdirectory must supply rules for building sources it contributes
hal/CortexM3/%.o: ../hal/CortexM3/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU C Compiler'
	arm-none-eabi-gcc -mthumb -mcpu=cortex-m3 -DACTEL_STDIO_THRU_UART -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\CMSIS -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\CMSIS\startup_gcc -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\drivers -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\drivers\mss_gpio -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\drivers\mss_nvm -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\drivers\mss_pdma -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\drivers\mss_rtc -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\drivers\mss_timer -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\hal -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\hal\CortexM3 -IJ:\Project_373\SoftConsole\Project_373_MSS_MSS_CM3_0\Project_373_MSS_MSS_CM3_0_hw_platform\hal\CortexM3\GNU -O0 -ffunction-sections -fdata-sections -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


