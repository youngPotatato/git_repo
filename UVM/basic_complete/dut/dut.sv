//import uvm_pkg::*;
module dut(
	input clk,
	input cmd,
	input [7:0] addr,
	input [7:0] data
);

//  import uvm_pkg::*;

  always @(posedge clk)
  begin
    `uvm_info("mg", $psprintf("DUT received cmd=%b, addr=%d, data=%d",
                               cmd, addr, data), UVM_NONE);
  end
  
endmodule: dut

