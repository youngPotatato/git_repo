verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "979"
debImport "+v2k" "-sverilog" "+incdir+env+../sv+/home/yy/EDA/uvm-1.2/src" \
          "/home/yy/EDA/uvm-1.2/src/uvm.sv" "+systemverilogext+sv" \
          "+verdilog2001ext+v" "../sv/xbus.svh" "./test_lib.sv" \
          "xbus_tb_top.sv" "dut_dummy.v" "../sv/xbus_if.sv"
debLoadSimResult \
           /home/yy/Desktop/My_prog/git_repo/UVM/xbus_example/examples/test.fsdb
wvCreateWindow
verdiDockWidgetDisplay -dock widgetDock_WelcomePage
verdiDockWidgetHide -dock widgetDock_WelcomePage
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -inst "dut" -win $_nTrace1
srcAction -pos 33 3 2 -win $_nTrace1 -name "dut" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "xbus_addr" -win $_nTrace1
srcAction -pos 31 11 3 -win $_nTrace1 -name "xbus_addr" -ctrlKey off
srcHBSelect "\$root" -win $_nTrace1
srcSetScope -win $_nTrace1 "\$root" -delim "."
srcHBSelect "xbus_tb_top.dut" -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcSetScope -win $_nTrace1 "xbus_tb_top.xi0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "sig_addr" -win $_nTrace1
srcAction -pos 37 9 4 -win $_nTrace1 -name "sig_addr" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_env"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_env"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_env"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_env"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_env"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_env"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 64 -pos 1 -win $_nTrace1
srcAction -pos 64 1 17 -win $_nTrace1 -name \
          "xbus0.slaves\[0\].monitor.item_collected_port.connect" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 65 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 64 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 64 -pos 1 -win $_nTrace1
srcAction -pos 64 1 36 -win $_nTrace1 -name \
          "xbus0.slaves\[0\].monitor.item_collected_port.connect" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_slave_monitor"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_slave_monitor"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_slave_monitor"
srcDeselectAll -win $_nTrace1
srcSelect -word -line 46 -pos 7 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 64 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_slave_monitor"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_slave_monitor"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_slave_monitor"
srcDeselectAll -win $_nTrace1
srcSelect -word -line 46 -pos 7 -win $_nTrace1
srcSearchString "item_collected_port" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {160 160 2 2 1 20}
nsMsgSwitchTab -tab general
srcDeselectAll -win $_nTrace1
srcSelect -signal "range_check" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -signal "m_parent" -line 146 -pos 1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 51 -pos 5 -win $_nTrace1
srcSearchString "item_collected_port" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {47 47 8 9 1 1}
srcSearchString "item_collected_port" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {160 160 2 2 1 20}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {146 149 2 1 1 1}
srcDeselectAll -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 64 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 65 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -signal "xbus_tb_top.xi0" -line 68 -pos 1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 65 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 64 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 65 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {61 65 2 1 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 62 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {67 79 2 1 2 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {78 85 1 1 8 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "exp" -win $_nTrace1
srcSearchString "exp" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {57 57 8 8 17 20}
srcSearchString "exp" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {57 57 2 2 16 19}
srcSearchString "exp" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {40 40 8 8 7 10}
srcSearchString "exp" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33 33 11 11 16 19}
srcSearchString "exp" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {17 17 1 1 37 40}
srcSearchString "exp" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {102 102 2 2 7 10}
srcSearchString "exp" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {91 91 2 2 7 10}
srcSearchString "exp" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {82 82 2 3 1 1}
srcDeselectAll -win $_nTrace1
srcSelect -signal "exp" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_mem_expected\[trans.addr + i\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "exp" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_mem_expected\[trans.addr + i\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_mem_expected\[trans.addr + i\]" -win $_nTrace1
srcAction -pos 77 3 6 -win $_nTrace1 -name "m_mem_expected\[trans.addr + i\]" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_mem_expected" -win $_nTrace1
srcAction -pos 39 7 6 -win $_nTrace1 -name "m_mem_expected" -ctrlKey off
srcSearchString "m_mem_expected" -win $_nTrace1 -next -case
srcSearchString "m_mem_expected" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -word -line 71 -pos 4 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "trans.addr" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 71 -pos 4 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "trans.addr" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 71 -pos 4 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 71 -pos 4 -win $_nTrace1
srcAction -pos 71 4 15 -win $_nTrace1 -name "m_mem_expected.exists" -ctrlKey off
srcSearchString "m_mem_expected" -win $_nTrace1 -next -case
srcSearchString "m_mem_expected" -win $_nTrace1 -next -case
srcSearchString "m_mem_expected" -win $_nTrace1 -next -case
srcSearchString "m_mem_expected" -win $_nTrace1 -next -case
srcSearchString "m_mem_expected" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {100 100 5 5 10 42}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 98 -pos 4 -win $_nTrace1
srcSelect -win $_nTrace1 -range {99 100 5 1 11 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {102 103 1 1 6 1}
srcDeselectAll -win $_nTrace1
verdiWindowResize -win $_Verdi_1 "0" "28" "1616" "958"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1133"
verdiWindowResize -win $_Verdi_1 "0" "31" "1920" "1130"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1099"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcTBBTreeSelect -win $_nTrace1 -path "xbus_if"
srcTBBTreeSelect -win $_nTrace1 -path "xbus_if"
srcTBTreeAction -win $_nTrace1 -path "xbus_if"
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {121 124 1 1 21 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcAction -pos 120 0 41 -win $_nTrace1 -name \
          "//                   \(sig_start |=> \$onehot0\(sig_grant\)\)\)" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {109 110 1 1 4 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sig_reset" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sig_reset" -win $_nTrace1
srcAction -pos 111 4 5 -win $_nTrace1 -name "sig_reset" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top" -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {66 67 1 1 3 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {69 70 3 1 2 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "xbus_tb_top.dut" -win $_nTrace1
srcSetScope -win $_nTrace1 "xbus_tb_top.dut" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "xbus_clock" -win $_nTrace1
srcAction -pos 29 5 5 -win $_nTrace1 -name "xbus_clock" -ctrlKey off
srcHBSelect "xbus_tb_top.dut" -win $_nTrace1
srcSetScope -win $_nTrace1 "xbus_tb_top.dut" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "xbus_read" -win $_nTrace1
srcAction -pos 33 5 5 -win $_nTrace1 -name "xbus_read" -ctrlKey off
srcHBSelect "xbus_tb_top.dut" -win $_nTrace1
srcSetScope -win $_nTrace1 "xbus_tb_top.dut" -delim "."
srcHBSelect "xbus_tb_top" -win $_nTrace1
srcSetScope -win $_nTrace1 "xbus_tb_top" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -signal "xi0.sig_reset" -line 57 -pos 1
srcHBSelect "uvm_pkg.run_test" -win $_nTrace1
srcSetScope -win $_nTrace1 "uvm_pkg.run_test" -delim "."
srcHBSelect "xbus_tb_top.xi0.assertAddrUnknown" -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcSetScope -win $_nTrace1 "xbus_tb_top.xi0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "sig_write" -win $_nTrace1
srcAction -pos 40 3 6 -win $_nTrace1 -name "sig_write" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.dut" -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sig_request" -win $_nTrace1
srcAction -pos 35 9 7 -win $_nTrace1 -name "sig_request" -ctrlKey off
srcTBBTreeSelect -win $_nTrace1 -path "\$root.incr_read_byte_seq"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.incr_read_byte_seq"
srcTBTreeAction -win $_nTrace1 -path "\$root.incr_read_byte_seq"
srcDeselectAll -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.read_byte_seq"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.read_byte_seq"
srcTBTreeAction -win $_nTrace1 -path "\$root.read_byte_seq"
srcDeselectAll -win $_nTrace1
srcSelect -word -line 66 -pos 6 -win $_nTrace1
srcAction -pos 66 6 12 -win $_nTrace1 -name "xbus_base_sequence" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -word -line 33 -pos 12 -win $_nTrace1
srcAction -pos 33 12 8 -win $_nTrace1 -name "xbus_transfer" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -word -line 44 -pos 3 -win $_nTrace1
srcAction -pos 44 3 11 -win $_nTrace1 -name "xbus_read_write_enum" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "\$root" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_write" -win $_nTrace1
srcForwardHistory -win $_nTrace1
srcHBSelect "\$root" -win $_nTrace1
srcHBSelect "\$root" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "\$root" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "\$root" -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "xbus_if"
srcTBBTreeSelect -win $_nTrace1 -path "xbus_if"
srcTBTreeAction -win $_nTrace1 -path "xbus_if"
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {37 49 1 2 1 4}
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcHBSelect "uvm_pkg.run_test" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "uvm_pkg.run_test" -win $_nTrace1
srcHBSelect "xbus_tb_top" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top" -win $_nTrace1
srcHBSelect "xbus_tb_top.dut" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.dut" -win $_nTrace1
srcHBSelect "xbus_tb_top.dut" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.dut" -win $_nTrace1
srcHBSelect "xbus_tb_top.dut" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.dut" -win $_nTrace1
srcHBSelect "xbus_tb_top" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top" -win $_nTrace1
srcHBSelect "xbus_tb_top.dut" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.dut" -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_status"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_transfer"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_transfer"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_transfer"
srcTBBTreeSelect -win $_nTrace1 -path "xbus_if"
srcTBBTreeSelect -win $_nTrace1 -path "xbus_if"
srcTBTreeAction -win $_nTrace1 -path "xbus_if"
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_master_sequencer"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_master_sequencer"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_master_sequencer"
srcDeselectAll -win $_nTrace1
srcSelect -word -line 30 -pos 10 -win $_nTrace1
srcAction -pos 30 10 6 -win $_nTrace1 -name "xbus_transfer" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_master_monitor"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_master_monitor"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_master_monitor"
srcDeselectAll -win $_nTrace1
srcSelect -word -line 120 -pos 5 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 138 -pos 5 -win $_nTrace1
srcAction -pos 138 5 1 -win $_nTrace1 -name "xmi.sig_request\[master_id\]" \
          -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 120 -pos 5 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 120 -pos 5 -win $_nTrace1
srcSearchString "xmi" -win $_nTrace1 -next -case
srcSearchString "xmi" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {108 108 6 7 1 1}
srcSearchString "xmi" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {108 108 2 3 6 1}
srcSearchString "xmi" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {107 107 14 15 1 1}
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_master_monitor"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_master_monitor"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_master_monitor"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_base_sequence"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_base_sequence"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_base_sequence"
srcDeselectAll -win $_nTrace1
srcSelect -word -line 33 -pos 12 -win $_nTrace1
srcAction -pos 33 12 9 -win $_nTrace1 -name "xbus_transfer" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -word -line 44 -pos 3 -win $_nTrace1
srcAction -pos 44 3 9 -win $_nTrace1 -name "xbus_read_write_enum" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "\$root" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "\$root" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "\$root" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "\$root" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcAction -pos 106 11 4 -win $_nTrace1 -name "xbus_if" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.write_byte_seq"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.write_byte_seq"
srcTBTreeAction -win $_nTrace1 -path "\$root.write_byte_seq"
srcDeselectAll -win $_nTrace1
srcSelect -word -line 209 -pos 6 -win $_nTrace1
srcAction -pos 209 6 12 -win $_nTrace1 -name "xbus_base_sequence" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -word -line 33 -pos 12 -win $_nTrace1
srcAction -pos 33 12 6 -win $_nTrace1 -name "xbus_transfer" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {68 79 2 1 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_master_driver"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_master_driver"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_master_driver"
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {57 59 1 1 6 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {57 59 1 1 6 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 161 -pos 7 -win $_nTrace1
srcSearchString "drive_read_write" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {161 161 2 2 4 20}
srcSearchString "drive_read_write" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {111 111 2 3 1 1}
srcDeselectAll -win $_nTrace1
srcSelect -word -line 107 -pos 7 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 107 -pos 7 -win $_nTrace1
srcSearchString "drive_address_phase" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {107 107 2 3 4 1}
srcSearchString "drive_address_phase" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {96 96 2 3 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 77 -pos 5 -win $_nTrace1
srcAction -pos 77 5 9 -win $_nTrace1 -name "xmi.sig_reset" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "sig_reset" -win $_nTrace1
srcAction -pos 34 3 3 -win $_nTrace1 -name "sig_reset" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top" -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 30 -pos 6 -win $_nTrace1
srcAction -pos 30 6 7 -win $_nTrace1 -name "uvm_sequencer" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 30 -pos 2 -win $_nTrace1
srcAction -pos 30 2 16 -win $_nTrace1 -name "xbus_master_sequencer" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -word -line 30 -pos 2 -win $_nTrace1
srcAction -pos 30 2 13 -win $_nTrace1 -name "xbus_master_sequencer" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -word -line 30 -pos 2 -win $_nTrace1
srcAction -pos 30 2 13 -win $_nTrace1 -name "xbus_master_sequencer" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -word -line 30 -pos 2 -win $_nTrace1
srcHBSelect "\$root" -win $_nTrace1
srcSetScope -win $_nTrace1 "\$root" -delim "."
srcHBSelect "\$root" -win $_nTrace1
srcSetScope -win $_nTrace1 "\$root" -delim "."
srcHBSelect "\$root" -win $_nTrace1
srcSetScope -win $_nTrace1 "\$root" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -word -line 38 -pos 4 -win $_nTrace1
srcAction -pos 38 4 10 -win $_nTrace1 -name "xbus_master_sequencer" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -word -line 30 -pos 2 -win $_nTrace1
srcAction -pos 30 2 10 -win $_nTrace1 -name "xbus_master_sequencer" -ctrlKey off
srcHBSelect "\$root" -win $_nTrace1
srcSetScope -win $_nTrace1 "\$root" -delim "."
srcHBSelect "\$root" -win $_nTrace1
srcSetScope -win $_nTrace1 "\$root" -delim "."
srcHBSelect "\$root" -win $_nTrace1
srcSetScope -win $_nTrace1 "\$root" -delim "."
verdiDockWidgetSetCurTab -dock widgetDock_<Decl._Tree>
srcNextTraced -scope
srcNextTraced
srcNextTraced
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_slave_agent"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_slave_agent"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_slave_agent"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_slave_monitor"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_slave_monitor"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_slave_monitor"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_base_test"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_base_test"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_demo_base_test"
srcDeselectAll -win $_nTrace1
srcSelect -word -line 42 -pos 1 -win $_nTrace1
srcAction -pos 42 1 5 -win $_nTrace1 -name "xbus_demo_tb0" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -word -line 64 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 64 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 64 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 32 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 32 -pos 10 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 32 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 32 -pos 10 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 32 -pos 4 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 32 -pos 7 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 32 -pos 10 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {61 62 2 1 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {62 64 1 1 4 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {61 64 1 1 2 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 32 -pos 10 -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_base_test"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_base_test"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_demo_base_test"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcDeselectAll -win $_nTrace1
srcSelect -word -line 32 -pos 10 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 32 -pos 10 -win $_nTrace1
srcAction -pos 32 10 16 -win $_nTrace1 -name "item_collected_export" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.xi0" -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcDeselectAll -win $_nTrace1
srcSelect -word -line 65 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 64 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 64 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 64 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 65 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 65 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {61 62 2 1 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 32 -pos 10 -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_demo_tb"
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {65 66 1 1 3 1}
srcDeselectAll -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_slave_monitor"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_slave_monitor"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_slave_monitor"
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 150 -pos 6 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "address_phase_grabbed" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 147 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "trans_collected.addr" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 175 -pos 5 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 176 -pos 2 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 175 -pos 12 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "trans_collected.addr" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 177 -pos 5 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "trans_collected.size" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "trans_collected.size" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "trans_collected.size" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "trans_collected.size" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "trans_collected.read_write" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "trans_collected.read_write" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "trans_collected.read_write" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 185 -pos 7 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "trans_collected.read_write" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "trans_collected.size" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "trans_collected.data" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 185 -pos 5 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "trans_collected.size" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 185 -pos 7 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 185 -pos 5 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "trans_collected.size" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 185 -pos 7 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 185 -pos 5 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "trans_collected.read_write" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {146 149 1 1 6 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {150 151 1 1 2 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {152 153 1 1 7 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 152 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {176 176 11 21 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {177 177 1 14 5 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {178 179 1 1 4 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 178 -pos 4 -win $_nTrace1
srcAction -pos 178 4 5 -win $_nTrace1 -name "xsi.sig_size" -ctrlKey off
srcTraceLoad "xbus_tb_top.xi0.sig_size\[1:0\]" -win $_nTrace1
srcNextTraced -scope
srcNextTraced -scope
srcTBBTreeSelect -win $_nTrace1 -path "dut_dummy"
srcTBBTreeSelect -win $_nTrace1 -path "dut_dummy"
srcTBTreeAction -win $_nTrace1 -path "dut_dummy"
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "xbus_size" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top.dut" -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "xbus_tb_top"
srcTBBTreeSelect -win $_nTrace1 -path "xbus_tb_top"
srcTBTreeAction -win $_nTrace1 -path "xbus_tb_top"
srcDeselectAll -win $_nTrace1
srcSelect -word -line 41 -pos 1 -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "xbus_tb_top" -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_slave_driver"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_slave_driver"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_slave_driver"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_demo_scoreboard"
srcDeselectAll -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "xbus_if"
srcTBBTreeSelect -win $_nTrace1 -path "xbus_if"
srcTBTreeAction -win $_nTrace1 -path "xbus_if"
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {45 51 1 1 1 1}
srcDeselectAll -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_transfer"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_transfer"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_transfer"
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_write" -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_slave_monitor"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_slave_monitor"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_slave_monitor"
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_slave_monitor"
srcTBBTreeSelect -win $_nTrace1 -path "\$root.xbus_slave_monitor"
srcTBTreeAction -win $_nTrace1 -path "\$root.xbus_slave_monitor"
srcDeselectAll -win $_nTrace1
srcSelect -signal "trans_collected.read_write" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 137 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 108 -pos 1 -win $_nTrace1
srcSearchString "trans_collected" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {84 84 8 8 1 16}
srcSearchString "trans_collected" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {72 72 8 8 1 16}
srcSearchString "trans_collected" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {71 71 8 8 1 16}
srcSearchString "trans_collected" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {69 69 8 8 1 16}
srcSearchString "trans_collected" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {52 52 6 7 1 1}
srcSearchString "trans_collected" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {241 241 6 7 1 1}
nsMsgSwitchTab -tab general
srcSearchString "trans_collected" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -word -line 51 -pos 3 -win $_nTrace1
srcAction -pos 51 3 6 -win $_nTrace1 -name "xbus_transfer" -ctrlKey off
srcSearchString "trans_collected" -win $_nTrace1 -next -case
srcSearchString "trans_collected" -win $_nTrace1 -prev -case
srcTBBTreeSelect -win $_nTrace1 -path "\$root"
srcTBBTreeSelect -win $_nTrace1 -path "xbus_if"
srcTBBTreeSelect -win $_nTrace1 -path "xbus_if"
srcTBTreeAction -win $_nTrace1 -path "xbus_if"
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1013"
verdiWindowResize -win $_Verdi_1 "0" "25" "1920" "1016"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "979"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1133"
verdiWindowResize -win $_Verdi_1 "0" "31" "1920" "1130"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1099"
verdiWindowResize -win $_Verdi_1 "0" "28" "654" "788"
verdiWindowResize -win $_Verdi_1 "0" "28" "654" "754"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "800"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "778"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "766"
verdiWindowResize -win $_Verdi_1 "0" "28" "954" "766"
verdiWindowResize -win $_Verdi_1 "0" "28" "954" "743"
verdiWindowResize -win $_Verdi_1 "0" "28" "954" "754"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "800"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "766"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1013"
verdiWindowResize -win $_Verdi_1 "0" "35" "1920" "1006"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "979"
verdiWindowResize -win $_Verdi_1 "0" "28" "954" "788"
verdiWindowResize -win $_Verdi_1 "0" "28" "1436" "638"
verdiWindowResize -win $_Verdi_1 "0" "28" "954" "788"
verdiWindowResize -win $_Verdi_1 "0" "22" "954" "589"
verdiWindowResize -win $_Verdi_1 "0" "28" "954" "754"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "800"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "766"
verdiWindowResize -win $_Verdi_1 "0" "28" "1076" "1640"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "766"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1013"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "979"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "800"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "848"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "800"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "766"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1013"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "979"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "954"
verdiWindowResize -win $_Verdi_1 "0" "26" "1916" "868"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "920"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1133"
verdiWindowResize -win $_Verdi_1 "0" "33" "1920" "1128"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1099"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "800"
verdiWindowResize -win $_Verdi_1 "0" "20" "1916" "543"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "766"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1013"
verdiWindowResize -win $_Verdi_1 "0" "35" "1920" "1006"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "979"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "800"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "766"
verdiWindowResize -win $_Verdi_1 "0" "28" "1269" "465"
verdiWindowResize -win $_Verdi_1 "0" "7" "1922" "980"
verdiWindowResize -win $_Verdi_1 "0" "28" "1269" "431"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "954"
verdiWindowResize -win $_Verdi_1 "0" "54" "1916" "928"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "920"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1133"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1099"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "954"
verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "920"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1133"
verdiWindowResize -win $_Verdi_1 "0" "33" "1920" "1128"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1099"
debExit
