@echo off
title Uninstal telemetry and GWX updates

dism /Online /English /LogLevel:1 /Get-Help | find "Image Version: 6.1" > nul && goto :gwx-7
dism /Online /English /LogLevel:1 /Get-Help | find "Image Version: 6.3" > nul && goto :gwx-9
exit

:gwx-7
start /w wusa.exe /uninstall /KB:3021917 /quiet /norestart
start /w wusa.exe /uninstall /KB:2952664 /quiet /norestart
goto :tel-78

:gwx-9
start /w wusa.exe /uninstall /KB:3044374 /quiet /norestart
start /w wusa.exe /uninstall /KB:2976978 /quiet /norestart
goto :tel-78

:tel-78
start /w wusa.exe /uninstall /KB:3080149 /quiet /norestart
start /w wusa.exe /uninstall /KB:3068708 /quiet /norestart
