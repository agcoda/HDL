module tb_week4_assign_p1();
	logic [3:0] in;
	logic [9:0] out;

	//instantiat dut
	partial_decoder DUT(.in,.out);

	//apply inputs
	initial begin
		in=4'b0000; #10;
		//assert (y === 10'b00_0000_0001) else $error("0000 failed.");
		in=4'b0001; #10;
		in=4'b0010; #10;
		in=4'b0011; #10;
		in=4'b0100; #10;
		in=4'b0101; #10;
		in=4'b0110; #10;
		in=4'b0111; #10;
		in=4'b1000; #10;
		in=4'b1001; #10;
		//everything past here should read all 1s
		in=4'b1010; #10;
		in=4'b1011; #10;		
		in=4'b1100; #10;
		in=4'b1101; #10;
		in=4'b1110; #10;
		in=4'b1111; #10;
		
	end
endmodule