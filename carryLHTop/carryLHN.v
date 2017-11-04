`timescale 1ns / 1ns
module	carryLHN#(
	parameter		width = 32 
	)(
	input	[width-1	: 0]	a	,
	input	[width-1	: 0]	b	,
	input				cin	,
	output	[width-1	: 0]	s	,
	output				cout     
	);

	wire [width-1 : 0] p,pii,g,gii;

	rippleAdder #(
		.width	(width	)
	) rippleAdderWidth(
		.a	(a	),
		.b	(b	),
		.cin	(cin	),
		.s	(s	),
		.cout   (	)  
	);

	assign pii[0] = p[0];
	assign gii[0] = a[0] & b[0];

	generate 
		genvar ii;
		genvar jj;
		for(ii = 0; ii < width; ii = ii + 1) begin: gen_cout
			//G3:0 = G3 + P3(G2 + P2(G1 + P1G0))
			//P3:0 = P3P2P1P0;
			assign	p[ii] = a[ii] | b[ii];
			assign  g[ii] = a[ii] & b[ii];
		end//gen_s_width
		for (jj = 1; jj < width ; jj = jj +1) begin: connect
			assign pii[jj] = pii[jj-1] & p[jj];
			assign gii[jj] = g[jj] | (p[jj] & gii[jj-1]);
		end//connect
	endgenerate
	//Ci = Gi:j + Pi:j Cj
	assign cout = gii[width - 1] | (cin & pii[width-1]);

	
endmodule


