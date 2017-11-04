`timescale 1ns / 1ns
module rippleAdder #(
	parameter width=8
	)(
    	input	[width-1:0] a	,
    	input 	[width-1:0] b	,
    	input 		    cin	,
    	output 	[width-1:0] s	,
    	output 		    cout
    	);
    wire [width:0] carry;
    
    assign carry[0]=cin;
    assign cout=carry[width];
    
    generate
    	genvar i;
    	for (i=0;i<width;i=i+1) begin:fa
    	    assign  carry[i+1]= a[i]&b[i] | a[i]&carry[i] | b[i]&carry[i];
    	    assign  s[i]= a[i]^b[i]^carry[i];
    	end
    endgenerate
    
endmodule

