/*********************************************************************
 * SYNOPSYS CONFIDENTIAL                                             *
 *                                                                   *
 * This is an unpublished, proprietary work of Synopsys, Inc., and   *
 * is fully protected under copyright and trade secret laws. You may *
 * not view, use, disclose, copy, or distribute this file or any     *
 * information contained herein except pursuant to a valid written   *
 * license from Synopsys.                                            *
 *********************************************************************/

/***************************************************************************
 *
 * File:        $RCSfile: test_00_debug.sv,v $
 * Revision:    $Revision: 1.2 $  
 * Date:        $Date: 2003/07/15 15:18:54 $
 *
 *******************************************************************************
 *
 * This test shows how to run sanity check (purely random)
 * based upon the default verif environment.
 *
 *******************************************************************************
 */


program test(apb_if.Master apb);

`include "apb_trans.sv"
`include "apb_if.sv"
`include "cbs.sv"
`include "delay_cbs.sv"
`include "apb_master.sv"
`include "apb_gen.sv"

  apb_gen     gen;
  apb_master  mst;

  // APB transaction mailbox. Used to pass transaction
  // from APB gen to APB master (Layered approach)
  mailbox apb_mbox;


initial begin
	// LAB: Initialize apb_mbox 
	apb_mbox = new();

	// LAB: Call constructor for gen with xx random transactions, verbose on
	gen = new(2**4,apb_mbox,1'b1);
	

	// LAB: Call constructor for mst, verbose on
	mst = new(1'b1,apb_mbox);

	begin
		//pre-trans callback task
		Delay_cbs delay_callB = new();
		mst.cbs.push_back(delay_callB);
	end



	// LAB: Call reset method of mst object
	mst.reset();


  	fork
	// LAB: Call main method of mst
		mst.main();
	// LAB: Call main meth of gen  
		gen.main();	
  	join



  	// Wait some more clock cycles just to be sure
  	repeat(10) @apb.cb;  

  	$finish;
end 
initial begin
	$fsdbDumpfile("test.fsdb");
	$fsdbDumpvars("+all");
end
endprogram
