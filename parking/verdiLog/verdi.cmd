verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "979"
debImport "+v2k" "-sverilog" "+systemverilogext+sv" "_verdilog2001ext+v" "-f" \
          "1.f" "tests/test.sv"
debLoadSimResult /home/yy/Desktop/My_prog/parking/test.fsdb
wvCreateWindow
verdiDockWidgetDisplay -dock widgetDock_WelcomePage
verdiDockWidgetHide -dock widgetDock_WelcomePage
verdiDockWidgetMaximize -dock windowDock_nWave_2
wvRestoreSignal -win $_nWave2 \
           "/home/yy/Desktop/My_prog/parking/yyNewFolder/yy.rc" \
           -overWriteAutoAlias on
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
verdiDockWidgetRestore -dock windowDock_nWave_2
verdiDockWidgetMaximize -dock windowDock_nWave_2
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 -9 20 1918 346
wvResizeWindow -win $_nWave2 -10 20 1920 979
wvResizeWindow -win $_nWave2 -10 20 1920 979
wvZoomIn -win $_nWave2
verdiWindowResize -win $_Verdi_1 "0" "28" "1616" "820"
wvResizeWindow -win $_nWave2 -10 20 1616 820
verdiWindowResize -win $_Verdi_1 "0" "23" "1616" "639"
verdiWindowResize -win $_Verdi_1 "0" "28" "1616" "786"
wvResizeWindow -win $_nWave2 -10 20 1616 786
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1013"
wvResizeWindow -win $_nWave2 -10 20 1920 1013
verdiWindowResize -win $_Verdi_1 "0" "34" "1920" "1007"
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "979"
wvResizeWindow -win $_nWave2 -10 20 1920 979
verdiWindowResize -win $_Verdi_1 "0" "28" "1616" "954"
wvResizeWindow -win $_nWave2 -10 20 1616 954
verdiWindowResize -win $_Verdi_1 "0" "26" "1616" "868"
wvResizeWindow -win $_nWave2 -10 18 1616 868
verdiWindowResize -win $_Verdi_1 "0" "28" "1616" "920"
wvResizeWindow -win $_nWave2 -10 20 1616 920
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1133"
wvResizeWindow -win $_nWave2 -10 20 1920 1133
verdiWindowResize -win $_Verdi_1 "0" "33" "1920" "1128"
wvResizeWindow -win $_nWave2 -10 25 1920 1128
verdiWindowResize -win $_Verdi_1 "0" "28" "1920" "1099"
wvResizeWindow -win $_nWave2 -10 20 1920 1099
wvTpfCloseForm -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
debExit
