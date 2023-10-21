
/* Design a combinational circuit which takes in a 4-bit BCD input, 
and outputs a 10-bit value where all the bits are 0 except the bit represented by the BCD value.
 For any input outside of the limits of BCD, all outputs will be ?1?.
For instance, if the input is A[3:0]= 0010, this represents the value 2 in decimal. 
Thus, the output will be B[9:0]= 0000000100.
 If the input is A[3:0]= 1111, this represents a value greater than the limits of BCD. 
Thus, the output will be B[9:0]= 1111111111.
*/

module partial_decoder (input logic[3:0] in,
			output logic[9:0] out);

 always_comb
  case(in)
   0:		out = 10'b00_0000_0001;
   1:		out = 10'b00_0000_0010;
   2:		out = 10'b00_0000_0100;
   3:		out = 10'b00_0000_1000;
   4:		out = 10'b00_0001_0000; 
   5:		out = 10'b00_0010_0000; 
   6:		out = 10'b00_0100_0000; 
   7:		out = 10'b00_1000_0000;
   8:		out = 10'b01_0000_0000;
   9:		out = 10'b10_0000_0000;
   default:	out =10'b11_1111_1111;
  endcase
endmodule

/*
Design a state machine that generates a 3-bit output. 
The output will start at 0 and count up, by 1, until it reaches 7 (?111?), 
then start again at 0, repeating forever. 
Add a single input (1 bit). If the input is ?0? the circuit operates as indicated in question 3. 
If the input is ?1? the circuit counts DOWN instead of UP.
*/

//mostly referencing example 4.30 pg 210 Harris
module counterFSM(input logic clk,
		input logic reset,
		input logic d,
		output logic[2:0] y);
typedef enum logic[2:0]{S0, S1, S2, S3, S4, S5, S6, S7} statetype;
statetype state, nextstate;

//state register
always_ff @(posedge clk, posedge reset)
	if(reset) 	state <=S0;
	else		state<=nextstate;

//next state logic
always_comb
	if(d) //count down
		case(state)
			S0: 	nextstate = S7;
			S1:	nextstate = S0;
			S2:	nextstate = S1;
			S3:	nextstate = S2;
			S4: 	nextstate = S3;
			S5:	nextstate = S4;
			S6:	nextstate = S5;
			S7:	nextstate = S6;
		endcase
	else //d==0 count up
		case(state)
			S0: 	nextstate = S1;
			S1:	nextstate = S2;
			S2:	nextstate = S3;
			S3:	nextstate = S4;
			S4: 	nextstate = S5;
			S5:	nextstate = S6;
			S6:	nextstate = S7;
			S7:	nextstate = S0;
		endcase

//output logic
	assign y = state;
endmodule
