@echo off

ver | find "10" > nul && set _win10=Y

echo Microsoft Office 2019 Standard x64
echo -------------------------------------------------------------------------------
choice /c cde /n /m "Download [d] or Configure [c] Office instalation? Press [e] to Exit."
if %ERRORLEVEL% EQU 1 if defined _win10 start setup.exe /configure config.xml
if %ERRORLEVEL% EQU 2 start setup.exe /download config.xml
