/*********************************************************************
 * SYNOPSYS CONFIDENTIAL                                             *
 *                                                                   *
 * This is an unpublished, proprietary work of Synopsys, Inc., and   *
 * is fully protected under copyright and trade secret laws. You may *
 * not view, use, disclose, copy, or distribute this file or any     *
 * information contained herein except pursuant to a valid written   *
 * license from Synopsys.                                            *
 *********************************************************************/

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// CDANOTE  Using structure packet_t
//          to replace reg [15:0] or wire [15:0]
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
module test_fifo;

reg		clk;
reg		rstp;
packet_t	packet_in;
reg		readp;
reg		writep;
packet_t	packet_out;
wire		emptyp;
wire		fullp;


   parameter 	depth = 2; 

fifo #(depth+1) U1 (
   .clk         (clk),
   .rstp        (rstp),
   .din         (packet_in),
   .readp       (readp),
   .writep      (writep),
   .dout        (packet_out),
   .emptyp      (emptyp),
   .fullp       (fullp)
);

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// CDANOTE  Tasks used to Write and Read to/from FIFO 
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task read_word;
   @(negedge clk);
   readp = 1;
   @(posedge clk) #5;
   $displayh ("Read %h from FIFO", packet_out.src);
   readp = 0;
endtask
   

task  write_word(ubyte src, dst, ubyte [3:0] data);
   @(negedge clk);
   packet_in = '{src,dst,data};
   writep = 1;
   @(posedge clk);
   $displayh ("Write %h to FIFO", src);
   #5;
   packet_in = '{default:'z};
   writep = 0;
endtask

initial begin
   //$fsdbDumpfile("run2.fsdb");
   //$fsdbDumpvars("+all");
   clk = 0;
   forever begin
      #10 clk = 1;
      #10 clk = 0;
   end
end

initial begin
   
   test1;
   test2;
   @(posedge clk);
   $finish;
end

task test1;
begin
   packet_in = '{default:'z};
   writep = 0;
   readp = 0;

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
   repeat (8) begin
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
// obeys the emptyp flag and reads at random intervals.  The result should be that
// the reader reads the incrementing counter out of the FIFO.  The empty/full flags
// should bounce around depending on the random delays.  The writer repeats some
// fixed number of times and then terminates both threads and kills the sim.
//
task test2;
reg [15:0] writer_counter;
begin
   packet_in = '{default:'z};
   writer_counter = 16'h0001;
   writep = 0;
   readp = 0;

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
            if (fullp == 1'b0) begin
	       write_word ($random,$random,$random);
               #5;
               writer_counter = writer_counter + 1;
          end
            else begin
               $display ("WRITER is waiting..");
            end
            // Delay a random amount of time between 0ns and 100ns
            #(50 + ($random % 50));
         end
         $display ("Done with WRITER fork..");
         #200 $finish;
      end
      
      // Reader
      begin
         forever begin
            @(negedge clk);
            if (emptyp == 1'b0) begin
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

 always @(fullp)
   $display ("fullp = %0b", fullp);
   
always @(emptyp)
   $display ("emptyp = %0b", emptyp);

always @(U1.head)
   $display ("head = %0h", U1.head);

always @(U1.tail)
   $display ("tail = %0h", U1.tail);

endmodule
