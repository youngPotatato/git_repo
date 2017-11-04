verdiWindowResize -win $_Verdi_1 "0" "28" "1440" "799"
debImport "+v2k" "-sverilog" "+systemverilogext+sv" "_verdilog2001ext+v" "-f" \
          "1.f"
verdiDockWidgetDisplay -dock widgetDock_WelcomePage
verdiDockWidgetHide -dock widgetDock_WelcomePage
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/yy/Desktop/My_prog/carryLHTop/test.fsdb}
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {5 11 13 1 6 1}
srcAddSelectedToWave -win $_nTrace1
verdiDockWidgetMaximize -dock windowDock_nWave_2
wvSetCursor -win $_nWave2 2.420259 -snap {("G2" 0)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
verdiWindowResize -win $_Verdi_1 "0" "28" "1136" "690"
verdiWindowResize -win $_Verdi_1 "0" "24" "1136" "545"
verdiWindowResize -win $_Verdi_1 "0" "28" "1136" "656"
verdiWindowResize -win $_Verdi_1 "0" "28" "1440" "833"
verdiWindowResize -win $_Verdi_1 "0" "33" "1440" "828"
verdiWindowResize -win $_Verdi_1 "0" "28" "1440" "799"
debExit
