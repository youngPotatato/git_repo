module babbage(
	input [7:0 ] a3	  ,
	input [7:0 ] a2	  ,
	input [7:0 ] a1	  ,
	input [7:0 ] a0	  ,
	input 	     clk  ,
	input 	     rst  ,
	input [7:0 ] x	  ,
	input	     x_val,
	output	     valid,
	output[32:0] y	 
);
	reg [31 : 0] f,g,k;
	reg [31 : 0] f_next,g_next,k_next;
	reg [8	: 0] counter;
	reg [  7: 0] x_r;
	//counter for x
	reg [1  : 0] state,next_state;
	always @(posedge clk or posedge rst) begin
		if(rst)
			state <= 0;
		else
			state <= next_state;
	end
	always @(*) begin
		case(state)
			0:begin//inactive
				if(x_val)
					next_state = 1;
				else
					next_state = 0;
			end
			1:begin//active
				if(counter == x_r + 1)
					next_state = 2;
				else
					next_state = 1;
			end
			2:begin//wait
				if(x_val)
					next_state = 1;
				else
					next_state = 2;
			end
		endcase
	end
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			counter <= 'd0;
		end
		else begin
			if(x_val)
				counter <= 0;
			else  
				if(counter == x_r+1)
					counter <= 0;
				else
					counter <= counter + 1;
		end
	end

	always @(posedge clk or posedge rst) begin
		if(rst) begin
			x_r <= x;
		end
		else begin
			if(x_val)
				x_r <= x;
		end
	end

	always @(posedge clk or posedge rst) begin
		if(rst) begin
			f <= 'd0;
                        g <= 'd0;
                        k <= 'd0;
		end
		else begin
			f <= f_next;
			g <= g_next;
			k <= k_next;
		end
	end
	always @(*) begin
		if(counter == 0) begin
			k_next <=  2*a2 - 6*a3	;
			g_next <= a3 - a2 +a1	;
			f_next <= a0		;
		end
		else if(counter != x) begin
			k_next <= k + 6*a3	; 
			g_next <= g + k_next	;
			f_next <= f + g_next 	;
		end
		else begin
			k_next <= k;
			g_next <= g;
			f_next <= f;
		end
	end

	assign y      = (counter == x_r + 1)? 
				((x_r == 0)?f:f_next)
				:
				'd0;
	assign valid  = ((counter == x_r + 1)&&(state != 2))? 1:0;
	

	
		
endmodule
