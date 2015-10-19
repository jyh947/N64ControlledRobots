// my_Project_373.v

module my_Project_373(

output wire ENABLE,
output wire IN1_OUT,
output wire IN2_OUT,
output wire IN3_OUT,
output wire IN4_OUT,
output wire IR_LED_OUT,
input sensor,

/*** APB3 BUS INTERFACE ***/
input PCLK, // clock
input PRESERN, // system reset
input PSEL, // peripheral select
input PENABLE, // distinguishes access phase
output wire PREADY, // peripheral ready signal
output wire PSLVERR, // error signal
input PWRITE, // distinguishes read and write cycles
input [31:0] PADDR, // I/O address
input wire [31:0] PWDATA, // data from processor to I/O device (32 bits)
output reg [31:0] PRDATA // data to processor from I/O device (32-bits)


);


assign PSLVERR = 0;
assign PREADY = 1;

wire IN1_write = PSEL && PENABLE && PWRITE && (PADDR[7:0] == 8'h04);
wire IN2_write = PSEL && PENABLE && PWRITE && (PADDR[7:0] == 8'h08);

wire IN3_write = PSEL && PENABLE && PWRITE && (PADDR[7:0] == 8'h10);
wire IN4_write = PSEL && PENABLE && PWRITE && (PADDR[7:0] == 8'h14);

assign ENABLE = sensor;

reg [31:0]pulse_width1;
reg [31:0]pulse_width2;
reg [31:0]pulse_width3;
reg [31:0]pulse_width4;
reg [31:0] count;
reg [31:0] count2;

reg done;

always@ (posedge PCLK)
    begin
        if (!PRESERN)
            begin
                pulse_width1 <= 0;
                pulse_width2 <= 0;
                pulse_width3 <= 0;
                pulse_width4 <= 0;
                count <= 0;
                count2 <= 0;
                done <= 0;
            end
        if (done)
             begin
                count <= count + 1;
                pulse_width1 <= 0;
                pulse_width2 <= 0;
                pulse_width3 <= 0;
                pulse_width4 <= 0;
                if (count >= 500000000)
                    begin
                        done <= 0;
                        count <= 0;
                    end
            end
        else
            begin
                if (!ENABLE)
                    begin
                    count2 <= count2 + 1;
                    if(count2 >= 20000000)
                        begin
                            count2 <= 0;
                            done <= 1;
                        end
                    end
                else count2 <= 0;
                if(IN1_write)
                    begin
                    pulse_width1 <= PWDATA;
                    end
                if(IN2_write)
                    begin
                    pulse_width2 <= PWDATA;
                    end
                if(IN3_write)
                    begin
                    pulse_width3 <= PWDATA;
                    end
                if(IN4_write)
                    begin
                    pulse_width4 <= PWDATA;
                    end
            end
    end

pulsewm pwm1(PCLK, pulse_width1, IN1_OUT);
pulsewm pwm2(PCLK, pulse_width2, IN2_OUT);
pulsewm pwm3(PCLK, pulse_width3, IN3_OUT);
pulsewm pwm4(PCLK, pulse_width4, IN4_OUT);
LED led1(PCLK, IR_LED_OUT);

endmodule


module pulsewm( input clk, input [31:0]num_high, output reg pwm);
`define period 1000

reg [31:0] count;

always @(posedge clk)
begin
    if (count >= `period)
        count <= 0;
    else
        count <= count + 1;
    if (count < num_high)
        pwm <= 1;
    else
        pwm <= 0;
end

endmodule

module LED(input PCLK,                  // clock
output reg Dout);
    
    reg [31:0] counter;
    always @(posedge PCLK)
    begin
        if(counter < 1316)
            Dout <= 1;
        else
            Dout <= 0;
        if(counter < 2632)
            counter <= counter + 1;
        else
            counter <= 0;
    end
endmodule 