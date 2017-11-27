verdiWindowResize -win $_Verdi_1 "0" "28" "1916" "770"
debImport "+v2k" "-sverilog" "+incdir+env+env" "+systemverilogext+sv" \
          "+verdilog2001ext+v" "./hdl/babbage.v" "tests/test.sv"
debLoadSimResult /home/yy/Desktop/My_prog/git_repo/babbage/test.fsdb
wvCreateWindow
verdiDockWidgetDisplay -dock widgetDock_WelcomePage
verdiDockWidgetHide -dock widgetDock_WelcomePage
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {9 19 2 1 1 1}
srcAddSelectedToWave -win $_nTrace1
verdiDockWidgetMaximize -dock windowDock_nWave_2
wvZoom -win $_nWave2 150790.762065 640860.738776
wvZoom -win $_nWave2 167278.035063 194283.051181
wvSetCursor -win $_nWave2 169001.092936 -snap {("G1" 6)}
wvZoom -win $_nWave2 168515.503899 171006.105734
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSetCursor -win $_nWave2 169142.488352 -snap {("G1" 8)}
wvSelectGroup -win $_nWave2 {G2}
wvSetCursor -win $_nWave2 169250.838200 -snap {("G1" 7)}
wvZoom -win $_nWave2 168815.994144 169286.954816
wvSetCursor -win $_nWave2 168920.894897
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
debExit
