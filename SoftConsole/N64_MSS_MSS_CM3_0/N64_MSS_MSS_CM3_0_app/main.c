#include <stdio.h>
#include <inttypes.h>
#include "drivers/mss_uart/mss_uart.h"

int main()
{
	int A;
	int B;
	int Z;
	int Start;
	int Up;
	int Down;
	int Left;
	int Right;
	int L;
	int R;
	int C_Up;
	int C_Down;
	int C_Left;
	int C_Right;
	int X_axis;
	int Y_axis;
	int input;
	while( 1 )
	{
		input = *(int *)(0x40050000);
		//printf("Output: %x\r\n", input);
		if(input & (1 << 0))
		{
			A = input & (1 << 0);
			if(!A)
			{
				printf("A is pressed\n");
			}
		}
		if(input & (1 << 1))
		{
			B = input & (1 << 1);
			printf("B is pressed\n");
		}
		if(input & (1 << 2))
		{
			Z = input & (1 << 2);
			printf("Z is pressed\n");
		}
		if(input & (1 << 3))
		{
			A = input & (1 << 3);
			printf("A is pressed\n");
		}
		if(input & (1 << 4))
		{
			A = input & (1 << 4);
			printf("A is pressed\n");
		}
		if(input & (1 << 0))
		{
			A = input & (1 << 0);
			printf("A is pressed\n");
		}
	}
	return 0;
}
