/*
We will need a bank of registers for temporary data storage
*/

module register(
    input   logic       Clock,      //1 bit, positive-edge 
	input   logic       Reset,      //1 bit, positive-edge
	input   logic[3:0]  Addr_A,     //4 bits wide
	input   logic[3:0]  Addr_B,     //4 bits wide
	input   logic[3:0]  Addr_WR,    //4 bits wide
	input   logic       WR,         //Write Enable, 1 bit
	input   logic[7:0]  DIN,        //8 bit wide data input
    output  logic[7:0]	Out_A,       //: 8 bits wide
	output  logic[7:0]  Out_B       //: 8 bits wide

);

//Internally: Create an array, 16 elements long, of 8-bit values. Initial value for all is 0. Addresses range from 0 to 15
bit[15:0][7:0]  mem;
int i;


/*
•Function, synchronous
o	If Reset = 1
	Reset all data to 0
o	At the rising-edge of Clock
	If WR is 0: no action
	If WR is 1: the register at address Addr_WR is set to DIN
*/
always_ff @( posedge Clock ) begin : Synchronous
    if(Reset)   begin
        for(i=0;i<16;i=i+1) begin
            mem[i] = 0;
        end
    end

    if(WR)  mem[Addr_WR] = DIN;
end


/*
•Function, Combinational
o	Out_A: always equals the register at address Addr_A
o	Out_B: always equals the register at address Addr_B
*/
assign Out_A = mem[Addr_A];
assign Out_B = mem[Addr_B];

endmodule
