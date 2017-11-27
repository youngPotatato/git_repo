interface dut_if();

  logic clock, reset;
  logic cmd;
  logic [7:0] addr;
  logic [7:0] data;

endinterface: dut_if
typedef virtual interface dut_if vdut_if;
