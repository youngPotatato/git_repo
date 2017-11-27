`timescale 1ns/1ns
module test; 
  	parameter simulation_cycle = 100;
  	
  	bit clk;
  	always #(simulation_cycle/2) 
  	  clk = ~clk;

	logic [7:0 ] a3	  ;
	logic [7:0 ] a2	  ;
	logic [7:0 ] a1	  ;
	logic [7:0 ] a0	  ;
	logic 	     rst  ;
	logic [7:0 ] x	  ;
	logic 	     x_val;
	logic 	     valid;
	logic [32:0] y	  ; 

	initial begin
		rst = 1;
		x_val = 0;
		repeat(5) @(negedge  clk);
		rst = 0;
		repeat ($urandom_range(0,99999)) begin
			@(negedge clk);
			x_val = 1;
			x  = $urandom_range(0,55);
			a3 = $urandom_range(0,2**7-1);
			a2 = $urandom_range(0,2**7-1);
			a1 = $urandom_range(0,2**7-1);
			a0 = $urandom_range(0,2**7-1);
			@(negedge  clk);
			x_val = 0;
			while(!valid) @(negedge clk);
			repeat($urandom_range(0,5))@(posedge clk);//mimic different pauses between different inputs

		end
		$finish;
	end	
	sequence check_equal;
		((x**3*a3 + x**2*a2 + x*a1 + a0) == y);
	endsequence
	property check_prop;
		@(negedge clk)
			disable iff(rst)
				valid |-> check_equal;
	endproperty
	equal_assert:assert property (check_prop)
		//				$display("@%d passed",$time);
					else
						$display("@%d not equal",$time);

	//property check_1validto1xval;
	//	@(negedge clk)
	//		disable iff(rst)
	//		(valid [=1]) |-> x_val;
	//endproperty

	//property check_1xvalto1valid;
	//	@(negedge clk)
	//		disable iff(rst)
	//		(x_val[=1]) |-> valid;
	//endproperty


	//assert_1to1_A:assert property (check_1validto1xval)
	//	//				$display("@%d passed",$time);
	//				else
	//					$display("@%d not 1to1A",$time);

	//assert_1to1_B:assert property (check_1xvalto1valid)
	//	//				$display("@%d passed",$time);
	//				else
	//					$display("@%d not 1to1B",$time);

	babbage dut(
		.a3	(a3	),	  
		.a2	(a2	),	  
		.a1	(a1	),	  
		.a0	(a0	),	  
		.clk	(clk	),
		.rst	(rst	),
		.x	(x	),	  
		.x_val	(x_val	),
		.valid	(valid	),
		.y	(y	)
	);




	initial begin
		$fsdbDumpfile("test.fsdb");
		$fsdbDumpvars("+all");
	end
endmodule
