// Read_Buttons.v
// N64.v
module Read_Buttons(input PCLK, // clock
input PRESERN, // system reset
//APB3 BUS INTERFACE
input PSEL, // peripheral select
input PENABLE, // distinguishes access phase
output wire PREADY, // peripheral ready signal
output wire PSLVERR, // error signal
input PWRITE, // read/write control bit 
input [31:0] PADDR, // IO address
input wire [31:0] PWDATA, // (processor) bus is writing data to
                          //this device 32 bits
output reg [31:0] PRDATA, // (processor) bus is reading data from this device 
input Din, output reg Dout);

    assign PSLVERR = 0; //assumes no error generation
    assign PREADY = 1; //assumes zero wait
    wire write_enable = (PENABLE && PWRITE && PSEL);
    //decodes APB3 write cycle
    wire read_enable = (!PWRITE && PSEL);
    //decode APB3 read cycle

    assign reset = 0;

    reg [32:0] controller_data;
    reg [31:0] counter;
    reg [7:0] eight_bit_data;
    reg [6:0] bit_access;

    // counter == 100 represents 1 us.
    always @(posedge PCLK)
    begin
        //3600 for sending 0x01
        //3601 - 3800 wait
        //3801 - 17000 receive signal
        //17001 - 18000 wait
        if(counter > 18000)
        begin
            eight_bit_data <= 0;
            counter <= 0;
            bit_access <= 0;
            controller_data <= 0;
        end
        else
            counter <= counter + 1;
        if((counter % 100) == 99)
            eight_bit_data <= eight_bit_data + 1;
        if(eight_bit_data == 190)
        begin
            eight_bit_data <= 0;
        end
        if(eight_bit_data == 3 ||
           eight_bit_data == 7 ||
           eight_bit_data == 11 ||
           eight_bit_data == 15 ||
           eight_bit_data == 19 ||
           eight_bit_data == 23 ||
           eight_bit_data == 27 ||
           eight_bit_data == 29 ||
           eight_bit_data == 30 ||
           eight_bit_data == 31 ||
           eight_bit_data == 33 ||
           eight_bit_data == 34 ||
           eight_bit_data == 35 ||
           eight_bit_data >= 36)
            Dout <= 0;
        else
            Dout <= 1;
        // We are suppose to wait for 2us, but the controller sends a signal at roughly counter == 3750
        // Within the 400 clock cycles where one bit is broadcasted, you should sample at the 225th tick.
        if(((counter - 3750) % 400) == 225 && counter >= 3750)
        begin
            controller_data[bit_access] <= Din;
            bit_access <= bit_access + 1;
        end
        if(counter > 17000)
        begin
            
        end
        
    end
    
    

endmodule 