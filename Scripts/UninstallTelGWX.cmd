@echo off

echo Attempt to uninstall unwanted update packages
echo -------------------------------------------------------------------------------

echo KB3150513
start /w wusa.exe /uninstall /KB:3150513 /quiet /norestart

ver | find "6.1" > nul && goto :gwx-7
ver | find "6.3" > nul && goto :gwx-9
exit

:gwx-7
echo KB3021917
start /w wusa.exe /uninstall /KB:3021917 /quiet /norestart
echo KB2952664
start /w wusa.exe /uninstall /KB:2952664 /quiet /norestart
goto :tel-79

:gwx-9
echo KB3044374
start /w wusa.exe /uninstall /KB:3044374 /quiet /norestart
echo KB2976978
start /w wusa.exe /uninstall /KB:2976978 /quiet /norestart
goto :tel-79

:tel-79
echo KB3080149
start /w wusa.exe /uninstall /KB:3080149 /quiet /norestart
echo KB3068708
start /w wusa.exe /uninstall /KB:3068708 /quiet /norestart
