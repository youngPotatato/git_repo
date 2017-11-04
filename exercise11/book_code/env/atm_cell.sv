`ifndef ATM_CELL__SV
`define ATM_CELL__SV
//`include "definitions.sv"
virtual class BaseTr;
	static int count;
	int id;
	function new();
    id = count++;
	endfunction
	//pure
	pure virtual function bit compare(input BaseTr to);
	pure virtual function bit copy(input BaseTr to = null);
  	pure virtual function void display(input string prefix="");
endclass:BaseTr

class UNI_cell extends BaseTr;
	//protocal
	rand bit	[3:0]  GFC    ;
	rand bit	[7:0]  VPI    ;
	rand bit	[15:0] VCI    ;
	rand bit	       CLP    ;
	rand bit	[2:0]  PT     ; 
	     bit 	[7:0]  HEC    ;
	rand bit  [0:47][7:0]  Payload;


	//!!!
	//syndrome is error control code, but now I can't figure them out 
   	static bit [7:0] syndrome[0:255];
   	static bit syndrome_not_generated = 1;



   	extern function new();
   	extern function void post_randomize();
   	extern virtual function void display(input string prefix="");
   	extern virtual function void pack(output ATMCellType to);
   	extern virtual function void unpack(input ATMCellType from);
   	extern function NNI_cell to_NNI();
   	extern function void generate_syndrome();
   	extern function bit [7:0] hec (bit [31:0] hdr);
	extern virtual function BaseTr copy(input BaseTr to = null);
	extern virtual function bit compare(input BaseTr to);
endclass:UNI_cell




	function UNI_cell::new();
	   if (syndrome_not_generated)
	     generate_syndrome();
	endfunction : new

	function void UNI_cell::post_randomize();
		HEC = hec({GFC, VPI, VCI, CLP, PT});
	endfunction: post_randomize

	function bit UNI_cell::compare(input BaseTr to);
		UNI_cell c;
		$cast(c,to);
		if(c.GFC    !=this.GFC    ) return 0;
		if(c.VPI    !=this.VPI    ) return 0;
		if(c.VCI    !=this.VCI    ) return 0;
		if(c.CLP    !=this.CLP    ) return 0;
		if(c.PT     !=this.PT     ) return 0;
		if(c.HEC    !=this.HEC    ) return 0;
		if(c.Payload!=this.Payload) return 0;
		return 1;
	endfunction:compare

	function BaseTr copy(input BaseTr to = null);
		UNI_cell xx;
		if(to == null)
			copy = new();
		else begin
			$cast(xx,to);
			xx.GFC    = this.GFC    ;
			xx.VPI    = this.VPI    ;
			xx.VCI    = this.VCI    ;
			xx.CLP    = this.CLP    ;
			xx.PT     = this.PT     ;
			xx.HEC    = this.HEC    ;
		end
		return xx;
	endfunction:copy

	function void UNI_cell::pack(output ATMCellType to);
	   to.uni.GFC     = this.GFC;
	   to.uni.VPI     = this.VPI;
	   to.uni.VCI     = this.VCI;
	   to.uni.CLP     = this.CLP;
	   to.uni.PT      = this.PT;
	   to.uni.HEC     = this.HEC;
	   to.uni.Payload = this.Payload;
	endfunction : pack

	function void UNI_cell::unpack(output ATMCellType from);
	    this.GFC	  = from.uni.GFC    ;
	    this.VPI	  = from.uni.VPI    ;
	    this.VCI	  = from.uni.VCI    ;
	    this.CLP      = from.uni.CLP    ;
	    this.PT       = from.uni.PT     ;
	    this.HEC      = from.uni.HEC    ;
	    this.Payload  = from.uni.Payload;
	endfunction : unpack

	function NNI_cell UNI_cell::to_NNI();
		NNI_cell tt;
		tt.VPI	  = this.VPI	;
		tt.VCI	  = this.VCI	;
		tt.CLP    = this.CLP    ;
		tt.PT     = this.PT     ;
		tt.HEC    = this.HEC    ;
		tt.Payload= this.Payload;
		return tt;
	endfunction:to_NNI

	function void UNI_cell::generate_syndrome();
	   bit [7:0] sndrm;
	   for (int i = 0; i < 256; i = i + 1 ) begin
	      sndrm = i;
	      repeat (8) begin
	         if (sndrm[7] === 1'b1)
	           sndrm = (sndrm << 1) ^ 8'h07;
	         else
	           sndrm = sndrm << 1;
	      end
	      syndrome[i] = sndrm;
	   end
	   syndrome_not_generated = 0;
	endfunction : generate_syndrome
	
	function bit [7:0] UNI_cell::hec (bit [31:0] hdr);
	   hec = 8'h00;
	   repeat (4) begin
	      hec = syndrome[hec ^ hdr[31:24]];
	      hdr = hdr << 8;
	   end
	   hec = hec ^ 8'h55;
	endfunction : hec

	function void UNI_cell::display(input string prefix);
		ATMCellType p;
   		$display("%sNNI id:%0d VPI=%x, VCI=%x, CLP=%b, PT=%x, HEC=%x, Payload[0]=%x",
	    		prefix, id, VPI, VCI, CLP, PT, HEC, Payload[0]);
		this.pack(p);
		$write("%s",prefix);
		foreach(p.Mem[i]) 
			$write(" %x ",p.Mem[i]);
		$display();
	endfunction:display
`endif
