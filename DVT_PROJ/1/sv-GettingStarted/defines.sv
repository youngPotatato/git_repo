`ifndef DISABLE_TRACE

// Ctrl+click 'mtrace' to show usages in the Search View, and go to the first usage.
`define mtrace(ID) \
   $display("Start call %s", ID); \
   ID(); \
   $display("End call %s", ID);


`else
// HINT Learn about `ifdef active/inactive code highlight
//
// Inactive `ifdef branches are grayed out.

`define mtrace(ID) \
   ID();

`endif
