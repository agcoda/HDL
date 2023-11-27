/*
The ALU
The ALU is an asynchronous (no clock, no memory) circuit element.
•Inputs
o	A: 8 bit input
o	B: 8 bit input
o	OPCode: 3 bit OpCode
•Outputs
o	ALU_Out: 8 bit output
•Function
o	If OPCode is:
	    000: ALU_Out = A  (function: Pass A)
	    001: ALU_Out = B  (function: Pass B)
	    010: ALU_Out = A Xor B
	    011: ALU_Out = A XNor B
	    100: ALU_Out = A + B 
	    101: ALU_Out = A – B
	    110: ALU_Out = A, left-shifted 1 bit
	    111: ALU_Out = A, right-shifted 1 bit
o	There are no bits to indicate overflow or carry out. 
    If the programmer inputs bad data, the processor will not protect them.

*/

module aLU( input   logic[7:0]  A,
            input   logic[7:0]  B,
            input   logic[2:0]  OPCode,
            output  logic[7:0]  ALU_Out           
);

always_comb    begin
    case (OPCode)
        3'b000:     ALU_Out = A;        //(function: Pass A)
        3'b001:     ALU_Out = B;        //(function: Pass B)
        3'b010:     ALU_Out = A^ B;      //xor
        3'b011:     ALU_Out = A ~^ B;    //XNor
        3'b100:     ALU_Out = A + B; 
        3'b101:     ALU_Out = A - B;
        3'b110:     ALU_Out = A<<1;      //left-shifted 1 bit
        3'b111:     ALU_Out = A>>1;      //right-shifted 1 bit
        default:    ALU_Out = 0;
    endcase
end

endmodule