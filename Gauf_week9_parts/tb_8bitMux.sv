module tb_eightBitMux();

logic   testClk;
logic[7:0]  Input_0;
logic[7:0]  Input_1;
logic       SEL;
logic[7:0]  MUX_Out;

eightBitMux DUT(.Input_0, .Input_1, .SEL, .MUX_Out);


//generate clock
always begin
    testClk = 1; #5;
    testClk = 0; #5;
end

initial begin
    Input_0 = 8'b0000_0001;
    Input_1 = 8'b0000_0010; #10

    SEL = 1;    #10;
    SEL = 0;    #10;
end

endmodule