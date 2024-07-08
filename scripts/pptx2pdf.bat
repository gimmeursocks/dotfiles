@echo off

set "batchDir=%~dp0"

echo %batchDir%

PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "D:\dev\Scripts\pptx2pdf.ps1 \"%batchDir%\""

pause
exit /b
