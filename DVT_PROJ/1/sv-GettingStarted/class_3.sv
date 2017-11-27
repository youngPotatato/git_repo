
// HINT Learn about hyperlinks
//
// Ctrl+click 'defines.sv' to open the file.
`include "defines.sv"

class class_3 extends class_2;

    // HINT Learn about override indicators
    //
    // The arrow on the left vertical bar indicates this is a function override (try hover).
    // Click on the arrow to go the overridden declaration.
    virtual function int foo_1();

        // HINT Learn about expanding macros
        //
        // Click 'mdisplay' and right-click to Macros > Expand All Levels Inline.
        // Click the resulting '@dvt_expand_macro_inline_start' and right-click to Macros > Collapse Inline Expansion.
        `mtrace(moo_1)

    endfunction

endclass
