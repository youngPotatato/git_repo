/*********************************************************************
 * SYNOPSYS CONFIDENTIAL                                             *
 *                                                                   *
 * This is an unpublished, proprietary work of Synopsys, Inc., and   *
 * is fully protected under copyright and trade secret laws. You may *
 * not view, use, disclose, copy, or distribute this file or any     *
 * information contained herein except pursuant to a valid written   *
 * license from Synopsys.                                            *
 *********************************************************************/

// Synchronous FIFO.  4 x 16 bit words.
//
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// CDANOTE  ANSI style port list 
// 	    Signals din and dout are now arbitrary types 
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
module fifo (
input		clk,
input		rstp,
input packet_t	din,
input		readp,
input		writep,
output packet_t	dout,
output	logic	emptyp,
output	logic	fullp
);

int i;

// Defines sizes in terms of bits.
//
parameter	DEPTH = 2,		// 2 bits, e.g. 4 words in the FIFO.
		MAX_COUNT = (1<<DEPTH);	// topmost address in FIFO.


// Define the FIFO pointers.  A FIFO is essentially a circular queue.
//
reg [(DEPTH-1):0]	tail;
reg [(DEPTH-1):0]	head;

// Define the FIFO counter.  Counts the number of entries in the FIFO which
// is how we figure out things like Empty and Full.
//
reg [(DEPTH):0]	count;

// Define our regsiter bank.  This is actually synthesizable!
//
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// CDANOTE  Array of structures
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
packet_t fifomem[0:MAX_COUNT];

// Dout is registered and gets the value that tail points to RIGHT NOW.

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// CDANOTE  Clear every element of fifomem
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
always @(posedge clk) begin
   if (rstp == 1) begin
      dout <= '{default:0};
   end
   else begin
      dout <= fifomem[tail];
   end
end 
     
// Update FIFO memory.
always @(posedge clk) 
   if (rstp == 1'b0) begin
	if (writep == 1'b1 && fullp == 1'b0)
           fifomem[head] <= din;
	end
   else
      fifomem='{default:0};
                  
// Update the head register.
//
always @(posedge clk) begin
   if (rstp == 1'b1) begin
      head <= 0;
   end
   else begin
      if (writep == 1'b1 && fullp == 1'b0) begin
         // WRITE
         head <= head + 1;
      end
   end
end

// Update the tail register.
//
always @(posedge clk) begin
   if (rstp == 1'b1) begin
      tail <= 0;
   end
   else begin
      if (readp == 1'b1 && emptyp == 1'b0) begin
         // READ               
         tail <= tail + 1;
      end
   end
end

// Update the count regsiter.
//
always @(posedge clk) begin
   if (rstp == 1'b1) begin
      count <= 0;
   end
   else begin
      case ({readp, writep})
         2'b00: count <= count;
         2'b01: 
            // WRITE
            if (!fullp) 
               count <= count + 1;
         2'b10: 
            // READ
            if (!emptyp)
               count <= count - 1;
         2'b11:
            // Concurrent read and write.. no change in count
            count <= count;
      endcase
   end
end

         
// *** Update the flags
//
// First, update the empty flag.
//
always @(count) begin
   if (count == 0)
     emptyp = 1'b1;
   else
     emptyp = 1'b0;
end


// Update the full flag
//
always @(count) begin
   if (count < MAX_COUNT)
      fullp = 1'b0;
   else
      fullp = 1'b1;
end

endmodule

