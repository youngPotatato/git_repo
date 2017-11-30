interface dut_if(input logic clock,input logic clock_45,input logic clock_90,input logic clock_135);

  logic reset;
  logic [`Width-1:0] r_data,w_data;
  logic pop,push;
  logic ept,ful;
  logic valid;

  logic [31:0] rd_size;

  clocking tx_cb @(posedge clock);
  	output  w_data	;
	input   r_data	;
  	output  pop,push;
  	input   ept,ful	;
	input   valid	;
  endclocking

  clocking rx_cb @(posedge clock);
  	input  w_data	;
        output r_data	;
  	input  pop,push	;
  	output ept,ful	;
        output valid    ;	
  endclocking

  clocking rx_cb_45 @(posedge clock_45);
  endclocking

  clocking rx_cb_90 @(posedge clock_90);
  endclocking

  clocking rx_cb_135 @(posedge clock_135);
  endclocking

  modport DUT(
	input  clock	,
  	input  w_data	,
	output r_data	,
  	input  pop,push	,
  	output ept,ful	,
	input  reset	,
	output valid	
	);
  modport GOLDEN(
	clocking rx_cb,
	clocking rx_cb_45,
	clocking rx_cb_90,
	clocking rx_cb_135,
	input  reset	,
  	input  w_data	,
	output r_data	,
  	input  pop,push	,
  	output ept,ful	,
	output valid    	
  );
  modport TB(
	  clocking tx_cb,clocking rx_cb,output reset,output pop,input ept
  );

  always @(posedge clock) begin
	  assertEmpFulMutuExclusive:assert property(
		  disable iff(reset)
		  (
			  ept*ful !== 1
		  ) 
	  )
		  else

			  $error("empty ful active at the same time");
		  
  //add more assertions here ...
  end

endinterface: dut_if
typedef virtual interface dut_if.TB vdut_if;
//typedef virtual interface dut_if.RB vdut_rif;
//typedef virtual interface dut_if.GOLDEN vdut_if_goldenr;
