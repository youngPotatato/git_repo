//`include "definitions.sv"
interface Utopia#(IfWidth = 8);
	logic [IfWidth-1 :0] data;
	bit clk_in,clk_out;
	bit soc,en,clav,valid,ready,reset,selected;


	ATMCellType ATMcell;
	modport TopReceive(
		input data,soc,clav,
		output clk_in,reset,ready,clk_out,en,ATMcell,valid
	);

	modport TopTransmit(
		input clav,
		inout selected,
		output clk_in,clk_out,ATMcell,data,soc,en,valid,reset,ready
	);

	modport CoreReceive(
		input clk_in,data,soc,clav,ready,reset,
		output clk_out,en,ATMcell,valid
	);

	modport CoreTransmit(
		input clk_in,clav,ATMcell,valid,reset,
		output clk_out,data,soc,en,ready
	);

	clocking cbr @(posedge clk_out);
		input clk_in,clk_out,ATMcell,valid,reset,en,ready;
		output data,soc,clav;
	endclocking:cbr
	modport TB_Rx (clocking cbr);

	clocking cbt @(posedge clk_in);
		input clk_in,clk_out,ATMcell,valid,reset,en,ready,data,soc;
		output clav;
	endclocking:cbt
	modport TB_Tx (clocking cbt);

endinterface


typedef virtual Utopia vUtopia;
typedef virtual Utopia.TB_Rx vUtopiaRx;
typedef virtual Utopia.TB_Tx vUtopiaTx;
