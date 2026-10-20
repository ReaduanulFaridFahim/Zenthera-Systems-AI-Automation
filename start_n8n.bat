@echo off
title Zenthra Systems - n8n Operations Engine
color 0B

echo ================================================================
echo           ZENTHRA SYSTEMS - AUTONOMOUS OPERATIONS HUB
echo ================================================================
echo  Starting local n8n workflow server on http://localhost:5678 ...
echo ================================================================
echo.

set "PATH=C:\Program Files\nodejs;%APPDATA%\npm;%SystemRoot%\system32;%SystemRoot%"
set N8N_PORT=5678
set N8N_LISTEN_ADDRESS=0.0.0.0
set N8N_DIAGNOSTICS_ENABLED=false
set N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

start http://localhost:5678
"C:\Program Files\nodejs\node.exe" "%APPDATA%\npm\node_modules\n8n\bin\n8n" start

pause
