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
echo Opening Full-Use Practice Video & Simulator (practice_video.html)...
start "" "%~dp0practice_video.html"
echo.
echo Done! All interfaces (Portal, Agent & Practice Video) are now open in your browser.
pause
