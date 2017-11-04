`timescale 1ns / 1ns
module	sim_top;
	parameter		width =	4;
	reg 	[width-1	:0]	a;
	reg 	[width-1	:0]	b;
	reg			      cin;
	wire 	[width-1	:0]	s;
	wire			     cout;

	initial begin
		cin 	= 'b1	;
		a 	= 'd10	;
		b 	= 'd2 	;
		#15		;
		a 	= 'd11	;
		#15		;
		a 	= 'd12	;
		b 	= 'd3 	;
	end

	carryLHN#(
		.width	(width)
	)dut(
		.a	(a	),
		.b	(b	),
		.cin	(cin	),
		.s	(s	),
		.cout   (cout	)  
	);


endmodule


