#include<stdio.h>
#include<inttypes.h>
#include "drivers/mss_uart/mss_uart.h"

#define PERIPHERAL_BASE 0x40050000
#define	IN1_ADDR 0x40050004
#define IN2_ADDR 0x40050008
#define IN3_ADDR 0x40050010
#define IN4_ADDR 0x40050014

int main()
{
	int *in1=(int *)(IN1_ADDR);
	int *in2=(int *)(IN2_ADDR);
	int *in3=(int *)(IN3_ADDR);
	int *in4=(int *)(IN4_ADDR);


	int pulse_IN1 = 0;
	int pulse_IN2 = 0;
	int pulse_IN3 = 0;
	int pulse_IN4 = 0;

	double speed_1 = 0;
	double speed_2 = 0;


	double MAX = 900;
	double MIN = 100;
	double range = MAX-MIN;

	float data_in_1;
	float data_in_2;
	float max = 50;

	*in1 = 0;
	*in2 = 0;
	*in3 = 0;
	*in4 = 0;

	data_in_1 = 0;
	data_in_2 = 0;

	 MSS_UART_init
	      (
	         &g_mss_uart1,
	         MSS_UART_9600_BAUD,
	         MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT
	 );

	uint8_t rx_buff[2];

	data_in_1 = 0;
	data_in_2 = 0;

	int rx_size = 0;
	//uint8_t err_status;

	while(1){

		*in1 = pulse_IN1;
		*in2 = pulse_IN2;
		*in3 = pulse_IN3;
		*in4 = pulse_IN4;

		//err_status = MSS_UART_get_rx_status(&g_mss_uart1);
		//if(MSS_UART_NO_ERROR == err_status )
		//{
			rx_size = MSS_UART_get_rx( &g_mss_uart1, rx_buff, sizeof(rx_buff) );
		//}
		//else{
			//rx_size = MSS_UART_get_rx( &g_mss_uart1, rx_buff, sizeof(rx_buff) );
		//	printf("Error: %u\r\n", err_status);
		//}
		if (rx_size > 0)
		{
			//printf("rxbuff[0]: %u\r\n", rx_buff[0]);
			//printf("rxbuff[1]: %u\r\n", rx_buff[1]);
			data_in_1 = rx_buff[0];
			data_in_2 = rx_buff[1];
			data_in_1 = data_in_1 - 100;
			data_in_2 = data_in_2 - 100;
			printf("data_in_1: %.6f\r\n", data_in_1);
			printf("data_in_2: %.6f\r\n", data_in_2);

		}

		speed_1 = range * (data_in_1/max);
		speed_2 = range * (data_in_2/max);

		if (data_in_1 < 0){
			pulse_IN1 = 0;
			pulse_IN2 = speed_1 * -1;
		}
		else {
			pulse_IN1 = speed_1;
			pulse_IN2 = 0;

		}
		if(data_in_2 < 0){
			pulse_IN3 = 0;
			pulse_IN4 = speed_2 * -1;
		}
		else{
			pulse_IN3 = speed_2;
			pulse_IN4 = 0;
		}

	}

	return 0;
}
