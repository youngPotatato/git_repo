`timescale 1ns/1ns
module test; 
  	parameter simulation_cycle = 100;
	parameter width		   =  16;
	parameter capacity 	   =  99;
  	
  	bit clk;
  	always #(simulation_cycle/2) 
  	  clk = ~clk;

	logic    	     		rst	;
	logic [1 :0]  		  	a	;
	logic [1 :0] 		  	b	;
	logic      		  	error	;
	logic [$clog2(capacity)-1 : 0] 	counter ;
	logic [31:0]			c1,c2	;

	initial begin
		rst = 1;
		c1 = $urandom_range(0,65);
		c2 = $urandom_range(0,24);
		repeat(5) @(posedge  clk);
		rst = 0;
		repeat(6000) begin
			c1 = $urandom_range(0,965);
			c2 = $urandom_range(0,124);
			@(posedge clk);

		end
		$finish;
	end	
	assign a = {c1[0],c2[0]};
	assign b = {c1[2],c2[2]};

	parkingTop #(
		.capacity(99)
	)dut(
		.clk	 (clk	),
		.rst	 (rst	),//async, active high
		.a	 (a	),
		.b	 (b	),
		.error	 (error	),
		.counter (counter)  
	);




	initial begin
		$fsdbDumpfile("test.fsdb");
		$fsdbDumpvars("+all");
	end
endmodule
