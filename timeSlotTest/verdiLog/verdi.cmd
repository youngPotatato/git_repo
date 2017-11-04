verdiWindowResize -win $_Verdi_1 "0" "28" "1440" "799"
debImport "+v2k" "-sverilog" "+systemverilogext+sv" "_verdilog2001ext+v" "-f" \
          "1.f"
verdiDockWidgetDisplay -dock widgetDock_WelcomePage
verdiDockWidgetHide -dock widgetDock_WelcomePage
srcHBSelect "top.arb_if" -win $_nTrace1
srcSetScope -win $_nTrace1 "top.arb_if" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 5 -pos 5 -win $_nTrace1
srcSelect -signal "grant" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "top.test" -win $_nTrace1
srcSetScope -win $_nTrace1 "top.test" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -signal "arb_if.cb.grant" -line 4 -pos 1
wvCreateWindow
srcAddSelectedToWave -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/yy/Desktop/My_prog/timeSlotTest/test.fsdb}
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -signal "arb_if.cb.grant" -line 4 -pos 1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 29.119481
srcHBSelect "top.arb_if" -win $_nTrace1
srcSetScope -win $_nTrace1 "top.arb_if" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 26.190043 -snap {("G1" 1)}
wvSetOptions -win $_nWave2 -fixedDelta on
wvSetOptions -win $_nWave2 -fixedDelta off
wvSetOptions -win $_nWave2 -fixedDelta on
wvSetOptions -win $_nWave2 -fixedDelta off
wvSetOptions -win $_nWave2 -fixedDelta on
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcAction -pos 10 5 0 -win $_nTrace1 -name "cb" -ctrlKey off
srcDeselectAll -win $_nTrace1
debExit
