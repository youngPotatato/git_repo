module lifo(
	input 		clk	,
	input 		rst	,
	output reg 	empty	,
	output reg	full	,
	input		push	,
	input		pop	,
	input	[15:0]	data_in	,
	output	[15:0]  data_out
);


	reg	[3 :0]  ptr,ptr_next			;//one more bit for full signal
	reg     [15:0]	ram_dout_r		;//need reg version? 
							 //or simply Comb Logic?
							 //depends on what kind of timing 
							 //is needed
	reg     [15:0]	data_out_r_shadow		;
	reg 		use_shadow;
	//************************ for underlying ram op ************************//
	wire    [3 :0]	ram_addr			;
	reg		ram_we				;
	wire	[15:0]  ram_din				;
	wire    [15:0]  data_out_r			;
	wire	[15:0]	ram_dout			;
	wire		write,rd			;
	//************************ LIFO  op && fsm************************//
	assign write 	= push && (ptr < 'd16 || pop)	;
	assign rd    	= pop  && ptr  > 'd0		;

	always @(*) begin
		if(rst)
			ptr_next = 0		;
		else if(write && !rd)
			ptr_next = ptr + 1	;
		else if(rd && !write)
			ptr_next = ptr - 1	;
		else
			ptr_next = ptr	  	;
	end

	always @(posedge clk)
		ptr <= ptr_next;

	always @(posedge clk)
		full <= ptr_next == 16;

	always @(posedge clk)
		empty<= ptr_next == 0;
	

	
	assign data_out = data_out_r;
	//************************ underlying ram op ************************//
	assign ram_addr = write?ptr:ptr - 1	;
	assign ram_din  = data_out_r		;  
	assign ram_we   = write && !rd		;


	always @(posedge clk)
		if(rd)
			ram_dout_r <= ram_dout;

	always @(posedge clk)
		if(write)
			data_out_r_shadow <= data_in;

	always @(posedge clk)
		if(rst)
			use_shadow <= 0;
		else if(write)
			use_shadow <= 0;
		else if (rd)
			use_shadow <= 1;

	assign data_out_r = use_shadow? ram_dout_r : data_out_r_shadow;

	ram #(
		.width(16),
		.depth(4 )//2**4 =16--is the depth
		)
		ram_inst(
		.clk	(clk	),
		.din	(ram_din),	
		.dout	(ram_dout),
		.we	(ram_we	),
		.addr	(ram_addr)
	);

endmodule
