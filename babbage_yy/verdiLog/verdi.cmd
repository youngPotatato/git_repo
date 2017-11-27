verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "770"
debImport "+v2k" "-sverilog" "+incdir+env+env" "+systemverilogext+sv" \
          "+verdilog2001ext+v" "./hdl/babbage.v" "tests/test.sv"
debLoadSimResult /home/yy/Desktop/My_prog/git_repo/babbage_yy/test.fsdb
wvCreateWindow
verdiDockWidgetDisplay -dock widgetDock_WelcomePage
verdiDockWidgetHide -dock widgetDock_WelcomePage
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {9 19 1 1 1 1}
srcAddSelectedToWave -win $_nTrace1
verdiDockWidgetMaximize -dock windowDock_nWave_2
wvZoom -win $_nWave2 0.000000 1055849.108179
wvZoom -win $_nWave2 0.000000 80229.833626
wvZoom -win $_nWave2 0.000000 5584.443176
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSetCursor -win $_nWave2 764.459739 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 874.593769 -snap {("G1" 9)}
debExit
