################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/mss_pdma/mss_pdma.c 

OBJS += \
./drivers/mss_pdma/mss_pdma.o 

C_DEPS += \
./drivers/mss_pdma/mss_pdma.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/mss_pdma/%.o: ../drivers/mss_pdma/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU C Compiler'
	arm-none-eabi-gcc -mthumb -mcpu=cortex-m3 -DACTEL_STDIO_THRU_UART -IJ:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform -IJ:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\CMSIS -IJ:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\CMSIS\startup_gcc -IJ:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers -IJ:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers\mss_ace -IJ:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers\mss_gpio -IJ:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers\mss_nvm -IJ:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers\mss_pdma -IJ:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers\mss_rtc -IJ:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers\mss_timer -IJ:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers\mss_uart -IJ:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers_config -IJ:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers_config\mss_ace -IJ:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\hal -IJ:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\hal\CortexM3 -IJ:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\hal\CortexM3\GNU -O1 -ffunction-sections -fdata-sections -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

