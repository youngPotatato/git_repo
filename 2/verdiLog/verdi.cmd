verdiWindowResize -win $_Verdi_1 "0" "28" "1136" "656"
debImport "+v2k" "-sverilog" "+systemverilogext+sv" "_verdilog2001ext+v" "-f" \
          "run1.f"
verdiDockWidgetDisplay -dock widgetDock_WelcomePage
verdiWindowResize -win $_Verdi_1 "0" "28" "1136" "656"
debExit
