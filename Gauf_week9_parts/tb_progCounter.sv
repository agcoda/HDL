module tb_progCounter();

logic       Clock;
logic       Reset;
logic[7:0]  DIN;     //overwrite next address on WR
logic       WR;   
logic[7:0]  Address;

programCounter DUT(.Clock, .Reset, .DIN, .WR, .Address);


always begin
    Clock = 1; #5;
    Clock = 0; #5;
end

initial begin
    //let it run a few cycles
    #30;

    //test that we can write the address to mid and that it counts
    DIN = 8'b0000_1110;
    WR = 1; #10;
    WR = 0; #50;

    //test reset to 0
    Reset = 1; #10;
    Reset = 0; #10;

    //test the wrap
    //should incremement 1 then reset to 0
    DIN = 8'b1111_1110;
    WR = 1; #10;
    WR = 0; #50;

end

endmodule
