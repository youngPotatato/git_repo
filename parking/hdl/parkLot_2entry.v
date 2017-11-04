module parkingLot_2Entry(
	input 		clk	,
	input 		rst	,//async, active high
	input 	[1 :0]  a	,
	input 	[1 :0] 	b	,
	output  [1 :0]	in	,//car entering, active one cycle
	output  [1 :0]	out	,//car leaving , active one cycle
	output		error	
);


	wire [1:0] error_local;

	parkingLot parkingLot_inst1(
		.clk	(clk  	),
		.rst	(rst  	),//async, active high
		.a	(a[1]   ),
		.b	(b[1]   ),
		.in	(in[1]  ),//car entering, active one cycle
		.out	(out[1] ),//car leaving , active one cycle
		.error	(error_local[1])
	);
	parkingLot parkingLot_inst0(
		.clk	(clk  	),
		.rst	(rst  	),//async, active high
		.a	(a[0]   ),
		.b	(b[0]   ),
		.in	(in[0]  ),//car entering, active one cycle
		.out	(out[0] ),//car leaving , active one cycle
		.error	(error_local[0])
	);
	assign error = |error_local;
endmodule
