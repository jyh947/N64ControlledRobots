################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/mss_gpio/mss_gpio.c 

OBJS += \
./drivers/mss_gpio/mss_gpio.o 

C_DEPS += \
./drivers/mss_gpio/mss_gpio.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/mss_gpio/%.o: ../drivers/mss_gpio/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU C Compiler'
	arm-none-eabi-gcc -mthumb -mcpu=cortex-m3 -DACTEL_STDIO_THRU_UART -IF:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform -IF:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\CMSIS -IF:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\CMSIS\startup_gcc -IF:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers -IF:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers\mss_ace -IF:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers\mss_gpio -IF:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers\mss_nvm -IF:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers\mss_pdma -IF:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers\mss_rtc -IF:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers\mss_timer -IF:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers\mss_uart -IF:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers_config -IF:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\drivers_config\mss_ace -IF:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\hal -IF:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\hal\CortexM3 -IF:\N64\SoftConsole\N64_MSS_MSS_CM3_0\N64_MSS_MSS_CM3_0_hw_platform\hal\CortexM3\GNU -O1 -ffunction-sections -fdata-sections -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


