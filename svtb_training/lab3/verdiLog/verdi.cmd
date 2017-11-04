verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1099"
debImport "+v2k" "-sverilog" "+incdir+env+apb_env+env" "+systemverilogext+sv" \
          "+verdilog2001ext+v" "hdl/root.v" "hdl/top.sv" "hdl/mem.v" \
          "apb_env/apb_if.sv" "tests/test.sv"
debLoadSimResult /home/yy/Desktop/My_prog/svtb_training/lab3/test.fsdb
wvCreateWindow
verdiDockWidgetDisplay -dock widgetDock_WelcomePage
