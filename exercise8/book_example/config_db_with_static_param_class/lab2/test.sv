program automatic tt;
	class Tiny;
		int i;
	endclass


	int i = 43,j = 32,k;
	real pi = 22.0/7.0, r;
	Tiny t;


	initial begin
		config_db#(int)::set("i",i);
		config_db#(int)::set("j",j);
		config_db#(real)::set("pi",pi);

		t = new();
		t.i = 99;

		config_db#(Tiny)::set("t",t);
		config_db#(Tiny)::set("null",null);


		config_db#(int)::get("i",k);
		$display("db[%d] is %d",i,k);


		config_db#(int)::print();
		config_db#(real)::print();
		config_db#(Tiny)::print();
	end
endprogram
