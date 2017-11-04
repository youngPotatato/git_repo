`timescale 1ns/1ns
module test; 
  	parameter simulation_cycle = 100;
	parameter width		   =  16;
  	
  	bit clk;
  	always #(simulation_cycle/2) 
  	  clk = ~clk;

	logic    	     	rst	;
	logic	[width-1:0]	data_in	;
	logic 	[width-1:0]    	data_out;
	logic    	     	pop	;
	logic    	        push	;
	logic		   	empty	;
	logic		    	full	;
	//should have written package class,driver, generator, driver, 
	//moniter, etc to randomize din array, and build the 
	//layerd verification environment
	//but now, just code a simple one
	bit 	[width-1:0] 	d_in[];

	task write(input bit [width-1:0] din[]);
		foreach(din[i]) begin
			@(posedge clk);
			data_in = din[i];
			push	= 'b1;
		end
		@(posedge clk);//deassert pop
			push	= 'b0;
	endtask

	task read(input int times);
		while(times >=0) begin 
			pop = 'b1;
			@(posedge clk);
			times --;
		end	
		pop = 'b0;
	endtask
	initial begin
		rst = 1;
		pop = 'b0;
		push= 'b0;
		repeat(5) @(posedge  clk);
			rst = 0;
			repeat (2) begin
			d_in = new[16];
			foreach(d_in[i])
				d_in[i] = i;
			write(d_in);
			read(16);
			repeat(5) @(posedge  clk);//wait for all ops to finish
			end
		$finish;
	end	


	lifo lifo_inst(
		.clk		(clk     ),
		.rst		(rst	 ),
		.empty		(empty	 ),
		.full		(full	 ),
		.push		(push	 ),
		.pop		(pop	 ),
		.data_in	(data_in ),
		.data_out	(data_out)
	);




	initial begin
		$fsdbDumpfile("test.fsdb");
		$fsdbDumpvars("+all");
	end
endmodule
