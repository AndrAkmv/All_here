@echo off

ver | find "10" > nul && set _win10=Y

echo Microsoft Office 2019 Standard x64
echo -------------------------------------------------------------------------------
choice /c abcdefghijklmnopqrstuvwxyz /n /m "Download [d] or Configure [c] Office instalation?"
if %ERRORLEVEL% EQU 4 start setup.exe /download config.xml
if %ERRORLEVEL% EQU 3 if defined _win10 start setup.exe /configure config.xml
