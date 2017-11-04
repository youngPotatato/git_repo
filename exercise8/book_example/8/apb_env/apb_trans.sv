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
 * File:        $RCSfile: apb_trans.sv,v $
 * Revision:    $Revision: 1.5 $  
 * Date:        $Date: 2003/07/02 15:47:08 $
 *
 *******************************************************************************
 *
 * APB Transaction Structure
 *
 *******************************************************************************
 */
	class apb_trans;
	// LAB: Create a random address, data, and transaction, 
	// using data types defined in hdl/root.v
		randc apb_addr_t addr;
		rand apb_data_t data;
		rand trans_e 	transaction;


	
	
	  task display(string prefix);
		$write(prefix);
		$display();
	// LAB: Display the time, transaction's type, address, and data field
		$display("@%0t: transaction is type--%s, address is %0h, data is %0h",$time,transaction,addr,data);
	  endtask: display
	
	
	  function apb_trans copy();
	// LAB: Construct a new() apb_trans and fill it with this's information
	// Don't forget to return the handle
		apb_trans result = new();
		result.addr = this.addr;
		result.data = this.data;
		result.transaction = this.transaction;
		return result;
	  endfunction: copy
	endclass

