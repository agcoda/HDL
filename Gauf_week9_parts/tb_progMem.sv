module tb_progMem();
logic       testClk;
logic[7:0]	Address;
logic[26:0]	Data_Out;

progMem DUT(.Address, .Data_Out);


//generate clock
always begin
    testClk = 1; #5;
    testClk = 0; #5;
end

//test mem 1-5 and 30
//all others should be zero
initial begin
    Address = 8'b0000_0001; #10;
    Address = 8'b0000_0010; #10;
    Address = 8'b0000_0011; #10;
    Address = 8'b0000_0100; #10;
    Address = 8'b0000_0101; #10;
    Address = 8'b0001_1110; #10;

    //should give back 0s
    Address = 8'b0100_0100; #10;
    Address = 8'b0000_1100; #10;
end


endmodule