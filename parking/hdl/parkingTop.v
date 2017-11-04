module parkingTop#(
	parameter capacity = 99
	)(
	input 				  clk	 ,
	input 				  rst	 ,//async, active high
	input 	   [1 :0]  		  a	 ,
	input 	   [1 :0] 		  b	 ,
	output				  error	 ,
	output reg [log2(capacity)-1 : 0] counter
);
	function integer log2;
		input integer d;
		begin
			d= d-1;
			for(log2=0;d>0; log2 = log2 + 1)
				d = d>>1;
		end
	endfunction

	wire  [1 :0]	in	;//car entering, active one cycle
	wire  [1 :0]	out	;//car leaving , active one cycle


	//counter 
	always @(posedge clk or posedge rst) begin
		if(rst)
			counter <= capacity;
		else
			if({in,out}!=4'b0)begin
				counter <= counter + out[0] + out[1] 
						- in[0] - in[1] ;
			end
	end

	parkingLot_2Entry parkingLot_2Entry_inst(
		.clk	(clk  	),
		.rst	(rst  	),//async, active high
		.a	(a      ),
		.b	(b      ),
		.in	(in     ),//car entering, active one cycle
		.out	(out    ),//car leaving , active one cycle
		.error	(error  )
	);
endmodule
