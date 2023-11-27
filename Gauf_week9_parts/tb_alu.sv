module tb_alu();
logic       testClk;
logic[7:0]  A;
logic[7:0]  B;
logic[2:0]  OPCode;
logic[7:0]  ALU_Out ;    

aLU DUT(.A, .B, .OPCode, .ALU_Out);

int i;

//generate clock
always begin
    testClk = 1; #5;
    testClk = 0; #5;
end
/*
o	If OPCode is:
	    000: ALU_Out = A  (function: Pass A)
	    001: ALU_Out = B  (function: Pass B)
	    010: ALU_Out = A Xor B
	    011: ALU_Out = A XNor B
	    100: ALU_Out = A + B 
	    101: ALU_Out = A – B
	    110: ALU_Out = A, left-shifted 1 bit
	    111: ALU_Out = A, right-shifted 1 bit
*/

initial begin
    A = 8'b11001100;
    B = 8'b00001111; 
/* should output

	    000: ALU_Out = A  = 11001100
	    001: ALU_Out = B  = 00001111
	    010: ALU_Out = A Xor B = 11000011
	    011: ALU_Out = A XNor B = 00111100
	    100: ALU_Out = A + B = 11010011
	    101: ALU_Out = A – B = 10111101
	    110: ALU_Out = A, left-shifted 1 bit = 10011000
	    111: ALU_Out = A, right-shifted 1 bit = 01100110


*/


    for(i=0;i<8;i=i+1) begin
        OPCode = i; #10;
    end

end
    

endmodule