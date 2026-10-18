@echo off
echo ========================================================
echo   Launching Zenthra Systems Enterprise Operations Hub...
echo ========================================================
echo.
echo Opening Corporate Portal with Interactive Training Mode...
start "" "%~dp0index.html?train=true"
echo.
echo Opening Fullscreen AI Operations Specialist (embed/chat-widget.html)...
start "" "%~dp0embed\chat-widget.html"
echo.
echo Done! Zenthra Systems is live in your browser with Guided Training enabled.
pause
