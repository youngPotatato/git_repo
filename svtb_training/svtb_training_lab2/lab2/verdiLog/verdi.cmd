debImport "+v2k" "-sverilog" "+systemverilogext+sv" "_verdilog2001ext+v" "-f" \
          "1.f"
debLoadSimResult \
           /home/yy/Desktop/My_prog/svtb_training/svtb_training_lab2/lab2/test.fsdb
wvCreateWindow
verdiDockWidgetDisplay -dock widgetDock_WelcomePage
verdiDockWidgetHide -dock widgetDock_WelcomePage
verdiWindowResize -win $_Verdi_1 -10 "20" "1920" "1099"
srcHBSelect "top.apb" -win $_nTrace1
srcSetScope -win $_nTrace1 "top.apb" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {48 50 7 1 1 1}
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave2 458654.910952 769802.714864
wvZoom -win $_nWave2 481149.691454 519660.755675
wvZoom -win $_nWave2 484490.732306 490125.954543
wvZoom -win $_nWave2 485083.913594 486003.018667
wvZoom -win $_nWave2 485218.935392 485392.231085
debExit
