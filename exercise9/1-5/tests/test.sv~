`timescale 1ns/1ns
program automatic test(itf.Master yy); 


	class Transaction;
		rand opcode_e opcode;
		rand byte operand1;
		rand byte operand2;
	endclass 
	Transaction tr;

	covergroup co_p;
		opcode_cp:coverpoint tr.opcode{
			bins add2sub={ADD->SUB};
			bins add= {ADD};
			bins sub= {SUB};
			//these bins below is for 2 cross coverage illegal bins
			//because the cross coverage is based on bins of coverpoint
			//even using !binof(opcode_cp.add)to represent the bin that is not add, I don't have bins of this case 
			//or I can use &&binsof(opcode_cp.notAdd)
			bins notAdd= {DIV,SUB,MULT};
			bins notSub= {ADD,MULT,DIV};
		}
		operand1: coverpoint tr.operand1{
			bins maximum_negative={-128};
			bins maximum_positve={127};
			bins zero = {0};
			bins others= default;
		}
		crossyy:cross opcode_cp,operand1{
			bins maxNegAdd=binsof(operand1.maximum_negative)&&binsof(opcode_cp.add);
			bins maxPosSUB=binsof(operand1.maximum_positve)&&binsof(opcode_cp.sub);
			illegal_bins maxNnotAdd=binsof(operand1.maximum_negative)&&!binsof(opcode_cp.add);
			illegal_bins maxPnotSub=binsof(operand1.maximum_positve)&&!binsof(opcode_cp.sub);
		} 
	endgroup

	initial begin
		co_p cp;
		cp = new();
		repeat(99) begin
			@yy.master_cb;
			tr = new();
			checkRandom(tr);
			cp.sample();
		end
	end

	function checkRandom(Transaction m);
		do begin 
			if(!(m.randomize())) begin 
				$display("%s:%0d: Rand failed \" %s\"", `__FILE__,`__LINE__,`"m.randomize()`"); 
				$finish;  
			end 
		end while(0);
	endfunction

	initial begin
		$fsdbDumpfile("test.fsdb");
		$fsdbDumpvars("+all");
	end
endprogram
