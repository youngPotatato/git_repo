program automatic test;
	import yy::*;
	logic [7:0] d_in;
	logic [3:0] a_in;
	MemTrans mt1,mt2;
	initial begin
		d_in = 'h2;
		mt1 = new(d_in,);
		mt1.address = 4'hF;
		mt1.print();
		d_in = 'h3;
		a_in = 'h4;
		mt2 = new(d_in,a_in);
		MemTrans::print_last_add();
		mt2.print();
		mt2 = null;

	end
endprogram