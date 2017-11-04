module lifo(
	input 		clk	,
	input 		rst	,
	output  	empty	,
	output		full	,
	input		push	,
	input		pop	,
	input	[15:0]	data_in	,
	output	[15:0]  data_out
);


	reg	[15:0] 	top,top_next			;
	reg	[15:0] 	top_backUp			;
	reg	[4 :0]  ptr,ptr_next			;//one more bit for full signal
	reg     [15:0]	data_out_r,data_out_r_next	;//need reg version? 
							 //or simply Comb Logic?
							 //depends on what kind of timing 
							 //is needed
	//************************ for underlying ram op ************************//
	wire    [3 :0]	ram_addr_next			;
	wire		ram_we_next			;
	wire	[15:0]  ram_din				;
	wire	[15:0]	ram_dout			;
	wire		write,rd			;
	reg    	[3 :0]	ram_addr			;
	reg		ram_we				;
	//************************ LIFO fsm and op ************************//
	//************************ LIFO fsm and op ************************//
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			ptr	   <=	'1		;
			top	   <=	'd0		;
			data_out_r <=	'd0		;
		end
		else begin
			ptr	   <=	ptr_next	;
			top	   <=	top_next	;
			data_out_r <=	data_out_r_next ;	
		end
	end

	always @(*) begin
		ptr_next 	= ptr		;
		top_next 	= top		;
		data_out_r_next = data_out_r	;	
		case({push,pop})
			2'b10:begin
				if(!full) begin
					//no push when full
					//top write to ram[ram_addr]
					top_next 	= data_in	;
					ptr_next 	= ptr	+ 1	;
				end
			end
			2'b01:begin
				if(!empty) begin
					//no pop when empty
					data_out_r_next = top		;
					top_next 	= top_backUp 	;//back to top_next
					ptr_next 	= ptr	- 1	;
				end
			end
			2'b11:begin
				//ptr no change
				//don't need ram op
				data_out_r_next 	= top		;
				top_next 		= data_in	;
			end
		endcase
	end
	assign	full 	= (ptr == 'd15)	;
	assign 	empty	= (ptr == '1 )	;
	assign	data_out= data_out_r	;

	//************************ underlying ram op ************************//
	assign write 	= push && (!full || pop)	;
	assign rd    	= pop  && !empty		;

	assign ram_we_next  = ({push,pop}== 2'b10) && !full	;
	assign ram_din	    = top				;
	assign ram_addr_next= (({push,pop}== 2'b10) && !full)?
				(ptr+1)
				:
				ptr			;
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			ram_we	<= 'd0;
			ram_addr<= 'd0;
		end
		else begin
			ram_we	<= ram_we_next		;
			ram_addr<= ram_addr_next	;
		end
	end
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			top_backUp <= 'd0		;
		end
		else begin
			if(write)
				top_backUp <= top	;
			else if(rd)
				top_backUp <= ram_dout	;
		end
	end

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
