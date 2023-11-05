module tb_registerStateMachine();
    logic[3:0] data_in;
    logic      clk;
    logic      reset;
    logic[5:0] sum_out;

    memStateMachine DUT(.data_in, .clk, .reset, .sum_out);

    //generate clock
    always begin
        clk = 1; #5;
        clk = 0; #5;
    end

    initial begin
	//reset to start state
	reset <= 1; 
	data_in <= 4'b0000;
    #10
	reset <=0;

    //wait for one full cycle to init all registers
    //whether system needs to sum 0s before all written to wasn't in spec
    //question for owner
    #40;
   
    //set all 4 registers to 1
    //data_out should run up 0 to 4
	data_in <= 4'b0001;
    #40;

    //set two registers to 10, 2 to 5
    //out should go 8, 12, 21, 30
    data_in <= 4'b0101;
    #20;
    data_in <=  4'b1010;
    #20;

    //test max edge by setting all to f
    //should sum up to 60
	data_in <= 4'b1111;
    #40;

    
    //test low edge by setting all to 0
    //should return down to 0
	data_in <= 4'b0000;
    #40;

    end
endmodule