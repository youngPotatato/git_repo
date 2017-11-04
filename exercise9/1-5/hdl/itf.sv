interface itf(input clk);
	opcode_e opcode;
	byte 	operand1;
	byte	operand2;


  

  clocking master_cb @(posedge clk);
    default input #1 output #1;
    output  opcode;
    output  operand1;
    output  operand2;
  endclocking

  //clocking monitor_cb @(posedge PClk);
  //  // default input #1skew output #0;
  //  input  PAddr;
  //  input  PSel;
  //  input  PWData;
  //  input  PRData;
  //  input  PEnable;
  //  input  PWrite;
  //  input  Rst; 
  //endclocking

  modport Master(clocking master_cb);
  //modport Monitor(clocking monitor_cb);

  //modport Slave(input PAddr, PClk, PSel, PWData, PEnable, PWrite, Rst,
  //              output PRData);
  

endinterface
