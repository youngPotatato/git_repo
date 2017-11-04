/*********************************************************************
 * SYNOPSYS CONFIDENTIAL                                             *
 *                                                                   *
 * This is an unpublished, proprietary work of Synopsys, Inc., and   *
 * is fully protected under copyright and trade secret laws. You may *
 * not view, use, disclose, copy, or distribute this file or any     *
 * information contained herein except pursuant to a valid written   *
 * license from Synopsys.                                            *
 *********************************************************************/

module test_fifo;

reg		clk;
reg		rstp;

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// CDANOTE  interface used to declare data in/out 
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Port 		in();
Port 		out();
   

   parameter 	depth = 2, 
		max = (1<<depth)-1;
   

fifo #(depth) U1 (
   .clk		(clk),
   .rstp	(rstp),
   .in		(in),
   .out	(out)
);

task  write_word ( ubyte src, dst, ubyte [3:0] data );
begin
   packet_t this_packet;
   this_packet = '{src,dst,data};
   

   @(negedge clk);

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// CDANOTE  Write to signals in interface 
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   in.packet = this_packet;
   in.enable = 1;
   @(posedge clk);
   $displayh ("Write %h to FIFO", in.packet.data);
   #5;
   in.enable = 0;
end
endtask

task read_word;
begin
   @(negedge clk);
   out.enable = 1;
   @(posedge clk) #5;
   $displayh ("Read %h from FIFO", out.packet.data);
   out.enable = 0;
end
endtask
   

initial begin
   clk = 0;
   forever begin
      #10 clk = 1;
      #10 clk = 0;
   end
end

initial begin
   //$fsdbDumpfile("run3.fsdb");
   //$fsdbDumpvars("+all");
test1;
   test2;
   
   $finish;
end

task test1;
begin
   in.enable = 0;
   out.enable = 0;

   // Reset
   rstp = 1;
   #50;
   rstp = 0;
   #50;
   
   // ** Write 3 values.
   write_word (0,1,16'h1111);
   write_word (1,2,16'h2222);
   write_word (3,4,16'h3333);
   
   // ** Read 2 values
   read_word;
   read_word;
   
   // ** Write one more
   write_word (5,6,16'h4444);
   
   // ** Read a bunch of values
   repeat (6) begin
      read_word;
   end
   
   // *** Write a bunch more values
   write_word (0,1,16'h0001);
   write_word (0,1,16'h0002);
   write_word (0,1,16'h0003);
   write_word (0,1,16'h0004);
   write_word (0,1,16'h0005);
   write_word (0,1,16'h0006);
   write_word (0,1,16'h0007);
   write_word (0,1,16'h0008);

   // ** Read a bunch of values
   repeat (6) begin
      read_word;
   end
   
   $display ("Done TEST1.");
end
endtask

// TEST2
//
// This test will operate the FIFO in an orderly manner the way it normally works.
// 2 threads are forked; a reader and a writer.  The writer writes a counter to
// the FIFO and obeys the fullp flag and delays randomly.  The reader likewise
// obeys the stall flag and reads at random intervals.  The result should be that
// the reader reads the incrementing counter out of the FIFO.  The empty/full flags
// should bounce around depending on the random delays.  The writer repeats some
// fixed number of times and then terminates both threads and kills the sim.
//
task test2;
reg [15:0] writer_counter;
begin

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// CDANOTE  Initialize signals in interface
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   in.enable = 0;
   out.enable = 0;

   // Reset
   rstp = 1;
   #50;
   rstp = 0;
   #50;
   
   fork
      // Writer
      begin
         repeat (500) begin
            @(negedge clk);
            if (in.stall == 1'b0) begin
               // CDA - use default argument
	       write_word ($random,$random,$random);
               #5;
            end
            else begin
               $display ("WRITER is waiting..");
            end
            // Delay a random amount of time between 0ns and 100ns
	    // CDA - Superlog random range
            #(50 + ($random % 50));
         end
         $display ("Done with WRITER fork..");
         #200 $finish;
      end
      
      // Reader
      begin
         forever begin
            @(negedge clk);
            if (out.stall == 1'b0) begin
               read_word;
            end  
            else begin
               $display ("READER is waiting..");
            end
            // Delay a random amount of time between 0ns and 100ns
            #(50 + ($random % 50));
         end
      end
   join
end
endtask


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// CDANOTE  flags 
//          for fullp and stall conditions 
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   bit full_ck=0; bit empty_ck=0;

   always @(out.stall) begin
      $display ("out.stall = %0b", out.stall);

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// CDANOTE  Set flags on condition
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      if (out.stall) full_ck=1;
   end // always @ (out.stall)
   
   always @(out.stall) begin
      $display ("out.stall = %0b", out.stall);
      if (out.stall) empty_ck=1;
   end // always @ (out.stall)

   always @(U1.head) begin
      $display ("head = %0h", U1.head);
   end // always @ (U1.head)
   
   always @(U1.tail) begin
      $display ("tail = %0h", U1.tail);
   end // always @ (U1.tail)
   
endmodule
