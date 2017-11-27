
// HINT Learn about Types View
//
// Go to Types View and double click 'class_1'.
// Or press Ctrl+Shift+T and chose 'class_1'.
// Or right click and Show > Quick Types and chose 'class_1'.

class class_5;
    int var_a;
    int var_b;
    int var_c[];

    function int foo_1();

        if(var_b == 0)
            var_a = var_c[0];
        else
            var_a = var_b;

        // HINT Learn about quick fixes
        //
        // Uncomment the 'var_d = var_a' line below and save.
        // An error indicates that 'var_d' is not declared.
        // The light-bulb indicates that a quick fix is available.
        //
        // Click 'var_d' and press Ctrl+1 to declare 'var_d'
        // as a function argument, local function variable or class variable.
        //
        // var_d = var_a;

        foo_1 = var_a;
        
    endfunction

    task too();
    endtask
endclass
