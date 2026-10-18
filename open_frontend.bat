@echo off
echo ========================================================
echo   Launching Zenthra Systems Enterprise Frontend...
echo ========================================================
echo.
echo Opening Corporate Portal (index.html)...
start "" "%~dp0index.html"
echo.
echo Opening Fullscreen AI Operations Specialist (embed/chat-widget.html)...
start "" "%~dp0embed\chat-widget.html"
echo.
echo Done! Both interfaces are now open in your default browser.
pause
