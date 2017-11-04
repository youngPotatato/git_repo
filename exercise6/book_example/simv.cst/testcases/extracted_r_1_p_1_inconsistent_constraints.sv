class c_1_1;
    rand bit[7:0] data_in; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (./MemTrans.sv:7)
    {
       (data_in < 8'h5);
       (data_in > 8'h41);
    }
endclass

program p_1_1;
    c_1_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z11xzxx10xz01z1z100z10x01xx01z1zxxxxxxzxzzzzzxzxzxxxxzxzzzzzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
