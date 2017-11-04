verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1099"
debImport "+v2k" "-sverilog" "+incdir+env+env+/home/yy/EDA/uvm-1.2/src" \
          "/home/yy/EDA/uvm-1.2/src/uvm.sv" "+systemverilogext+sv" \
          "+verdilog2001ext+v" "env/package.sv" "hdl/top.sv" "hdl/dut.sv" \
          "hdl/dut_if.sv"
debLoadSimResult /home/yy/Desktop/My_prog/UVM/hello_world/test.fsdb
wvCreateWindow
verdiDockWidgetDisplay -dock widgetDock_WelcomePage
verdiDockWidgetHide -dock widgetDock_WelcomePage
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
debExit
