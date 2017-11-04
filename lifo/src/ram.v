module ram #(
	parameter width = 16,
	parameter depth = 3  
	)(
	input 			clk	,
	input			we	,
	input [width-1:0]	din	,
	input [depth-1:0]	addr	,
	output[width-1:0]	dout
);

	reg[width-1:0] mem[2**depth-1:0];

	always @(posedge clk)
		if(we)
			mem[addr] <= din;
	

	assign	dout = mem[addr]	;
endmodule
