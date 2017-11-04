`timescale 1ns/1ns
module test; 

	parameter		width =	16;
	reg 	[width-1	:0]	a;
	reg 	[width-1	:0]	b;
	reg			      cin;
	wire 	[width-1	:0]	s;
	wire			     cout;

	carryLHTop #(
		.width	(width)
	)dut(
		.a	(a	),
		.b	(b	),
		.cin	(cin	),
		.s	(s	),
		.cout   (cout	)  
	);
	initial begin
		cin 	= 'b1		;
		a 	= 'd1		;
		b 	= 2**width-5 	;
		#15			;
		cin 	+= 'b1		;
		a 	= a+2		;
		#15			;
		cin 	+= 'b1		;
		a 	= a+2		;
		b 	= b+2		;
		#15			;
		cin 	+= 'b1		;
		b 	= b+2		;
	end
	initial begin
		$fsdbDumpfile("test.fsdb");
		$fsdbDumpvars("+all");
	end
endmodule
