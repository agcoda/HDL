/*
The circuit has a 4 bit input
The circuit has 4 memory registers, each 4 bits wide, with a “Write Enable” control input to each individual register. 
    (Write this file once, and instantiate it 4 times.)
The output is the sum total of the values of all 4 memory registers, added together. 
    Choose carefully the number of bits of your output. Do not make the output too narrow, nor wider than needed
A state machine will read the 4-bit input, write the value to one of the memory registers, 
    then read the input again, then write to the next register, then read, then write to the 3rd register, 
    and continue rotating in this way through all 4 memory registers in an eternal loop. 
    The state machine may perform the read and the write in a 2-clock-cycle period, or in a single clock cycle. The choice is yours.
Remember to properly verify each module or file in your design separately, then verify the entire design.
*/

//two modules
//  4 bit memory register
//  state machine that uses 4 of the 4 bit registers

//state machine that writes to four internal registers in loop
module memStateMachine( input   logic[3:0]  data_in,     //4 bit input matching internal registers
                        input   logic       clk,
                        input   logic       reset,
                        output  logic[5:0]  sum_out     //6 bit out req for max val 60 (15*4)
);

    typedef enum logic[1:0]{S0, S1, S2, S3} stateType;
    stateType   state;
    stateType   nextState;
    logic[3:0]  we;
    logic[3:0]  data_out_1, data_out_2, data_out_3, data_out_4;

    //4 registers
    register_4bit reg_1(data_in, we[0], clk, data_out_1);
    register_4bit reg_2(data_in, we[1], clk, data_out_2);
    register_4bit reg_3(data_in, we[2], clk, data_out_3);
    register_4bit reg_4(data_in, we[3], clk, data_out_4);

    //state register
    always_ff @(posedge clk, posedge reset)
	begin
        if(reset)   state   <= S0;        
        else        state   <= nextState;
    end

    //next state logic
    always_comb
	begin
	case(state)
            S0: 	nextState = S1;
            S1: 	nextState = S2;
            S2: 	nextState = S3;
            S3: 	nextState = S0;
	    default:	nextState = S0;
        endcase
	end

    //W operation
    //write to register on fall so its read on next rise
    always_ff @(negedge clk)
        begin
        case(state)
            S0:     we = 4'b0001;
            S1:     we = 4'b0010;
            S2:     we = 4'b0100;
            S3:     we = 4'b1000;
        endcase
    	end

    //registers should automatically read every rise
    //output logic
    
    assign sum_out = data_out_1 + data_out_2 + data_out_3 + data_out_4;



endmodule

//4 bit register with write enable
module register_4bit(   input   logic[3:0]  data_in,     
                        input   logic       we,     
                        input   logic       clk,
                        output  logic[3:0]  data_out
                    );
//1x4 stored data
logic[3:0]  data_array;

//read from register
always_ff @(posedge clk)
    data_out <= data_array;

//write to register
always_ff @(posedge clk)
    if(we == 1'b1)  data_array <= data_in;

endmodule
