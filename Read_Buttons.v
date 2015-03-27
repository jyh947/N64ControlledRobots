// Read_Buttons.v
// N64.v
module Read_Buttons(clk, reset, Din, Dout);
    input clk;
    input reset;
    input Din;
    output reg Dout;
    
    assign reset = 0;

    reg [32:0] controller_data;
    reg [31:0] counter;
    reg [7:0] eight_bit_data;
    reg [6:0] bit_access;

    // counter == 100 represents 1 us.
    always @(posedge clk)
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
            if(Din == 1)
            begin
                
            end
            else
            begin

            end
            controller_data[bit_access] = Din;
            bit_access <= bit_access + 1;
        end
        
    end
    
    

endmodule 