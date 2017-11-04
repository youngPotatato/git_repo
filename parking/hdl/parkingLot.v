module parkingLot(
	input 		clk	,
	input 		rst	,//async, active high
	input 		a	,
	input 	 	b	,
	output  	in	,//car entering, active one cycle
	output  	out	,//car leaving , active one cycle
	output reg      error	
);


	localparam A = 2'b00;
	localparam B = 2'b01;
	localparam C = 2'b10;
	localparam D = 2'b11;
	reg 	[ 1:0] p_state,state,n_state;
	reg     [ 1:0] cnt;
	wire 	[ 1:0] input_comb;
	reg		forward;
	assign input_comb = {a,b};
	//**************fsm******************//

	always @(posedge clk or posedge rst) begin
		if(rst)
			state <= A;
		else
			state <= n_state;
	end

	always @(posedge clk) begin
		if(state != n_state)
			p_state <= state;
	end

	//*************a counter************//
	always @(posedge clk or posedge rst) begin
		if(rst)
			cnt <='d0;
		else
			if(n_state == A)
				cnt <= 'd0;
			else
				cnt <= cnt + forward;
	end

	//next state combination logic 
	always @(*) begin
		error   = 0;
		forward = 0;
		case(state)
			A:begin	
				case(input_comb)
					2'b00:n_state = A;
					2'b01: begin
						n_state = D;
						forward    = 1;
					end
					2'b10:begin
						n_state = B;
						forward = 1;	
					end
					2'b11: begin
						n_state = A;//error condition
						error   = 1;
					end
				endcase
			end
			B:begin	
				case(input_comb)
					2'b00:begin
						n_state = A;
					end
					2'b01:begin
						n_state = A;//error
						error   = 1;
					end
					2'b10:begin
						n_state = B;
					end
					2'b11: begin
						n_state = C;
						if(p_state == A)	
							forward = 1;
					end
				endcase
			end
			C:begin	
				case(input_comb)
					2'b00:begin
						n_state = A;
						error   = 1;
					end
					2'b01:begin
						n_state = D;
						if((p_state == B) && (cnt == 2))	
							forward = 1;
					end
					2'b10:begin
						n_state = B;
						if((p_state == D) && (cnt == 2))	
							forward = 1;
					end
					2'b11:begin
						n_state = C;
					end
				endcase
			end
			D:begin	
				case(input_comb)
					2'b00:begin
						n_state = A;
					end
					2'b01:begin
						n_state = D;
					end
					2'b10:begin
						n_state = A;
						error   = 1;
					end
					2'b11:begin
						n_state = C;
						if(p_state == A)	
							forward = 1;
					end
				endcase
			end
		endcase
	end

	assign in  = (state == D) && (input_comb == 2'b00) && (cnt == 'd3);
	assign out = (state == B) && (input_comb == 2'b00) && (cnt == 'd3);


endmodule
