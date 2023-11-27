/*
The Program Counter
•	The first element you design will be the Program Counter. 
•Inputs
o	Clock
o	Reset
o	DIN: an 8-bit data-in bus, use explained shortly
o	WR: Write Enable
*/
module programCounter(  
    input   logic       Clock,
    input   logic       Reset,
    input   logic[7:0]  DIN,     //overwrite next address on WR
    input   logic       WR,   
    output  logic[7:0]  Address 
);

//Internally, declare an 8-bit counter, set the initial value to 0.
logic[7:0]  mem = 0'b00000000;    

/*
•Function
o	On Reset = 1, set the counter to 0
o	On each rising edge of “Clock”, 
	    if WR is 1, the 8-bit memory value is set to equal DIN
	    if WR is 0, the 8-bit memory increments up by 1
	    if the internal counter ever reaches 255, it resets to 0
o	the Address output is always equal to the value in the internal 8-bit counter
*/

//if writing overwrite mem, otherwise count up by 1 each clock
always_ff @(posedge Clock)
    begin
    if      (Reset)                mem = 0;

    if      (WR)              mem = DIN;
    else     mem = (mem == 8'b11111111) ? (mem = 0) : (mem = mem + 8'b00000001);

    end

/*
•Outputs
o	Address: the output value of the 8 bit internal memory
*/
//always output stored mem
assign Address = mem;



endmodule

