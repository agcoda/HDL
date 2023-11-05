module tb_register_4bit();
    logic[3:0]  data_in;    
    logic       we;     
    logic       clk;
    logic[3:0]  data_out;

    register_4bit DUT(.data_in, .we, .clk, .data_out);

    //generate clock
    always begin
        clk = 1; #5;
        clk = 0; #5;
    end

    initial begin
	//init data in lines
	data_in <= 4'b0001;
    //start at half cycles
    #5;
    //enable half cycle in so its up on second posedge
    //0001 should be now written
    we <= 1;
    #10;
    we <= 0; 
    //when we is low output should read 0001
    #10;

    //change data while we is low to verify not written
    data_in <= 4'b1111;
    #10

    //we to verify it writes
    we<=1;
    #10;
    //shouldn't update until we is low
    we<=0;
    #10;
    end
endmodule