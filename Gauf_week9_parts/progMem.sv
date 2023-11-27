/*Program Memory
The simplest way to execute this will be a combinational circuit based on a CASE or IF statement. This is a ROM (Read Only Memory), so no clock will be needed. 
The system is a simple output based ONLY on the input address
The data contained in each address is “the next line” of the software. There is only one command format. (Dashes included for legibility)
	Bit 26->  AAA_B_EEEE_FFFF_GGGG_H_KKKKKKKK_L_M  <- Bit 0
•	A: 3 bit ALU Opcode
•	B: ALU Mux SEL
•	E: Register A Address
•	F: Register B Address
•	G: Register C (“save” location) address
•	H: Register C Write Enable
•	K: Immediate Value (for writing to register or Program Counter)
•	L: Program Counter/Register Write Enable
•	M: Program Counter Mux  SEL

•Function:
o	If Address is:                                                                                    
1.	000_0_0000_0000_0000_1_00001111_0_0  
2.	000_0_0000_0000_0001_1_00001100_0_0 
3.	000_0_0000_0000_0010_1_00011000_0_0 
4.	000_1_0000_0001_0011_1_11111111_0_0 
5.	100_0_0000_0011_0000_0_11111111_1_1  
30.	101_1_0010_0000_0100_1_00000000_0_0 
All other values return 000000000000000000000000000
*/

module progMem (
	input	logic[7:0]	Address,
	output	logic[26:0]	Data_Out
);

always_comb begin 
	case (Address)
		1: Data_Out = 27'b000_0_0000_0000_0000_1_00001111_0_0 ;
		2: Data_Out = 27'b000_0_0000_0000_0001_1_00001100_0_0;
		3: Data_Out = 27'b000_0_0000_0000_0010_1_00011000_0_0;
		4: Data_Out = 27'b000_1_0000_0001_0011_1_11111111_0_0;
		5: Data_Out = 27'b100_0_0000_0011_0000_0_11111111_1_1;
		30: Data_Out = 27'b101_1_0010_0000_0100_1_00000000_0_0;
		default: Data_Out = 0;
	endcase
end
	
endmodule