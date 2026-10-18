@echo off
setlocal
set "PATH=C:\Program Files\nodejs;%APPDATA%\npm;%SystemRoot%\system32;%SystemRoot%"
echo Using node:
where node
echo.
echo Installing n8n globally...
call npm install -g n8n --ignore-scripts
echo.
if %ERRORLEVEL% EQU 0 (
    echo SUCCESS: n8n installed globally!
    where n8n
) else (
    echo FAILED with error code %ERRORLEVEL%
)
