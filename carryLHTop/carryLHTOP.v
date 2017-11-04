`timescale 1ns / 1ns
module	carryLHTop#(
	parameter		width = 32 
	)(
	input	[width-1	: 0]	a	,
	input	[width-1	: 0]	b	,
	input				cin	,
	output	[width-1	: 0]	s	,
	output				cout     
	);
	parameter CLA_WIDTH = 8;
	function integer log2;
		input integer d;
		begin
			d = d-1;
			for(log2=0; d>0 ; log2 = log2+1)
				d = d>>1;
		end
	endfunction


	wire [CLA_WIDTH-1 : 0] s_local[width/CLA_WIDTH -1:0];
	wire [width/CLA_WIDTH-1 :0]  co;
	wire [width/CLA_WIDTH-1 :0]  cin_local;
	generate
		genvar ii;
		for(ii = 0; ii < width/CLA_WIDTH; ii = ii + 1) begin: cascade_unit 
			carryLHN #(
				.width(CLA_WIDTH)
			) c_inst(
				.a	(a[CLA_WIDTH*ii +: CLA_WIDTH]	),
				.b	(b[CLA_WIDTH*ii +: CLA_WIDTH]	),
				.cin	(cin_local[ii]			),
				.s	(s_local[ii]			),
				.cout   (co[ii]				)  
			);
			assign cin_local[ii] = (ii == 0)? cin:co[ii-1]	;
			assign s[CLA_WIDTH*ii +: CLA_WIDTH] = s_local[ii];
		end//cascade_unit
	endgenerate

	assign cout =  co[width/CLA_WIDTH-1];

	
endmodule


