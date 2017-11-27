module top;
logic clk = 0;
always #1 clk = ~clk;

logic [2:0] req,gnt;
logic rst;
sequence req_1clk_gnt;
	req[0] ##1 gnt[0];
endsequence
sequence req_3to5clk_gnt;
	req[1] ##[3:6] gnt[1];
endsequence
sequence req_0clk_gnt;
	//same clk
	req[2] ##0 gnt[2];
endsequence
//sequence of sequence
sequence my_sequence;
	req_1clk_gnt ##1 req_3to5clk_gnt ##1 req_0clk_gnt;
endsequence

property pro1;
	@(posedge clk) disable iff(rst)
		req[0] |-> req_1clk_gnt;
endproperty

property pro2;
	@(posedge clk) disable iff(rst)
		req[1] |-> req_3to5clk_gnt;
endproperty

property pro3;
	@(posedge clk) disable iff(rst)
		req[2] |-> req_0clk_gnt;
endproperty

property pro4;
	@(posedge clk) disable iff(rst)
		req[0] |-> my_sequence;
endproperty


assert1: assert property(pro1);
assert2: assert property(pro2);
assert3: assert property(pro3);
assert4: assert property(pro4);



initial begin
	rst <= 0;
	req <= '0;
	gnt <= '0;
	@(posedge clk);
	req[0] <= 1;
	@(posedge clk);
	req[0] <= 0;
	gnt[0] <= 1;
	@(posedge clk);
	req[1] <= 1;
	@(posedge clk);
	req[1] <= 0;
	repeat(5)@(posedge clk);
	gnt[1] <= 1;
	@(posedge clk);
	gnt[1] <= 0;
	gnt[2] <= 1;
	req[2] <= 1;
	repeat(30) @(posedge clk);
	$finish;
end

initial begin
	$fsdbDumpfile("test.fsdb");
	$fsdbDumpvars("+all");
end
endmodule

