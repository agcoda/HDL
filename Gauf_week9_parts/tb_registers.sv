module tb_registers();
logic        Clock;      //1 bit; positive-edge 
logic        Reset;      //1 bit; positive-edge
logic[3:0]   Addr_A;     //4 bits wide
logic[3:0]   Addr_B;     //4 bits wide
logic[3:0]   Addr_WR;    //4 bits wide
logic        WR;         //Write Enable; 1 bit
logic[7:0]   DIN;        //8 bit wide data 
logic[7:0]   Out_A;       //: 8 bits wide
logic[7:0]   Out_B;      //: 8 bits wide

register DUT(.Clock, .Reset, .Addr_A, .Addr_B, .Addr_WR, .WR, .DIN, .Out_A, .Out_B);

int i;

//generate clock
always begin
    Clock = 1; #5;
    Clock = 0; #5;
end



/*
•Function, synchronous
o	If Reset = 1
	Reset all data to 0
o	At the rising-edge of Clock
	If WR is 0: no action
	If WR is 1: the register at address Addr_WR is set to DIN
*/
initial begin
    //watch reg 0 and 15
    Addr_A = 4'b0000;
    Addr_B = 4'b1111; 
    
    //initialize all registers to their vals
    WR = 1; #5
    for( i =0;i<16;i=i+1) begin
        Addr_WR = i;
        DIN = i; #10;
    end

    //read some regs
    WR = 0;
    DIN = 0; #10;
    
    for( i =0;i<15;i=i+2) begin
        Addr_A = i;
        Addr_B = i+1; #10;
    end

    //reset and red again
    Reset = 1; #10;
    Reset = 0; #10;
    
    for( i =0;i<15;i=i+2) begin
        Addr_A = i;
        Addr_B = i+1; #10;
    end

end


endmodule