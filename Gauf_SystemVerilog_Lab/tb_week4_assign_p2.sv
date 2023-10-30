module tb_week4_assign_p2();
//declare necessary logic
	logic clk;
	logic reset;
	logic d;
	logic[2:0] y;

//init DUT
counterFSM DUT(.clk,.reset,.d,.y);

//generate clock
always begin
	clk = 1; #5;
	clk = 0; #5;
end

initial begin
	//reset to start state
	reset <= 1; 
	d <= 0;	#10;
	//let it go
	reset <=0;
	//needs to travel through 8 states and back, so 8 clks
	#80;
	//reverse direction 
	d<= 1;
	//just go halfway then reset to test
	#40;
	reset = 1;
end
endmodule




	