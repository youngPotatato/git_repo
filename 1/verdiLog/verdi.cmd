debImport "+v2k" "-sverilog" "+systemverilogext+sv" "_verdilog2001ext+v" \
          "example_assoc_array.v"
verdiDockWidgetDisplay -dock widgetDock_WelcomePage
verdiDockWidgetHide -dock widgetDock_WelcomePage
srcDeselectAll -win $_nTrace1
srcSelect -signal "BASE_ADDR" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 50 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_model\[BASE_ADDR + 0 \]" -win $_nTrace1
wvCreateWindow
srcAddSelectedToWave -win $_nTrace1
verdiWindowResize -win $_Verdi_1 -10 "20" "1136" "656"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/yy/Desktop/My_prog/1/test.fsdb}
verdiDockWidgetMaximize -dock windowDock_nWave_2
verdiDockWidgetRestore -dock windowDock_nWave_2
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "assoc\[\"zero\"\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_model" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_model" -win $_nTrace1
srcSelect -win $_nTrace1 -range {22 34 10 1 6 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "assoc" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_model\[BASE_ADDR + 0 \]" -win $_nTrace1
srcAction -pos 33 1 2 -win $_nTrace1 -name "sram_model\[BASE_ADDR + 0 \]" \
          -ctrlKey off
debExit
