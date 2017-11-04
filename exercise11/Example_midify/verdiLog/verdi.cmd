debImport "+v2k" "-sverilog" "+incdir+env+env" "+systemverilogext+sv" \
          "+verdilog2001ext+v" "hdl/definitions.sv" "hdl/atm_cell.sv" \
          "hdl/top.sv" "hdl/utopia.sv" "hdl/cpu_ifc.sv" "hdl/LookupTable.sv" \
          "hdl/squat.sv" "hdl/utopia1_atm_rx.sv" "hdl/utopia1_atm_tx.sv" \
          "tests/test.sv"
debLoadSimResult /home/yy/Desktop/My_prog/exercise11/Example_midify/test.fsdb
wvCreateWindow
verdiDockWidgetDisplay -dock widgetDock_WelcomePage
verdiDockWidgetHide -dock widgetDock_WelcomePage
verdiWindowResize -win $_Verdi_1 -10 "20" "1920" "1099"
srcHBSelect "top.mif" -win $_nTrace1
srcHBSelect "top.mif" -win $_nTrace1
srcSetScope -win $_nTrace1 "top.mif" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {74 82 3 1 8 1}
srcAddSelectedToWave -win $_nTrace1
wvSelectGroup -win $_nWave2 {G2}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcHBSelect "top" -win $_nTrace1
srcSetScope -win $_nTrace1 "top" -delim "."
srcHBSelect "top" -win $_nTrace1
srcSetScope -win $_nTrace1 "top" -delim "."
srcHBSelect "top" -win $_nTrace1
srcSetScope -win $_nTrace1 "top" -delim "."
srcHBSelect "top.Rx\[0\]" -win $_nTrace1
srcSetScope -win $_nTrace1 "top.Rx\[0\]" -delim "."
srcHBSelect "top" -win $_nTrace1
srcSetScope -win $_nTrace1 "top" -delim "."
srcHBSelect "top" -win $_nTrace1
srcSetScope -win $_nTrace1 "top" -delim "."
srcHBSelect "top.Rx\[0\]" -win $_nTrace1
srcSetScope -win $_nTrace1 "top.Rx\[0\]" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {72 75 2 1 1 1}
srcHBSelect "top" -win $_nTrace1
srcHBSelect "top.squat" -win $_nTrace1
srcSetScope -win $_nTrace1 "top.squat" -delim "."
srcHBSelect "top.Rx\[0\]" -win $_nTrace1
srcSetScope -win $_nTrace1 "top.Rx\[0\]" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {72 75 1 1 1 1}
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 24738.521747 28462.600289
wvZoom -win $_nWave2 25621.617295 26020.087237
wvZoom -win $_nWave2 25696.978585 25744.223431
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "top" -win $_nTrace1
srcSetScope -win $_nTrace1 "top" -delim "."
srcHBSelect "top.Tx\[0\]" -win $_nTrace1
srcSetScope -win $_nTrace1 "top.Tx\[0\]" -delim "."
wvSelectGroup -win $_nWave2 {G3}
wvSetPosition -win $_nWave2 {("G3" 0)}
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {72 76 12 1 1 1}
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 37152.116888 42383.560555
wvZoom -win $_nWave2 39557.552235 39978.125208
wvZoom -win $_nWave2 39745.338433 39788.879533
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
debExit
