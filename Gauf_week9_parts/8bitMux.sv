/*
We will need, at several points, an 8-bit wide multiplexer. This is a combinational circuit.
•	Inputs
o	Input_0: 8 bit wide input
o	Input_1: 8 bit wide input
o	SEL: 1 bit
*/
/*
•	Output
o	MUX_Out: 8 bits wide
*/
/*
•	Function
o	If SEL is:
	0: MUX_Out = Input_0
	1: MUX_Out = Input_1
*/

module eightBitMux(
    input   logic[7:0]  Input_0,
    input   logic[7:0]  Input_1,
    input   logic       SEL,
    output  logic[7:0]  MUX_Out
);

assign MUX_Out = SEL ? Input_1 : Input_0;


endmodule