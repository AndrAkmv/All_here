@echo off

ver | find "10" > nul && set _win10=Y

echo Microsoft Office 2021 Standard x64
echo -------------------------------------------------------------------------------
choice /c cde /n /m "Download [d] or Configure [c] Office instalation? Press [e] to Exit."
if %ERRORLEVEL% EQU 1 if defined _win10 start setup.exe /configure config.xml & exit
if %ERRORLEVEL% EQU 3 exit
reg add HKCU\Software\Microsoft\Office\16.0\Common\ExperimentConfigs\Ecs /v CountryCode /d "std::wstring|US" /f > nul
start setup.exe /download config.xml
reg add HKCU\Software\Microsoft\Office\16.0\Common\ExperimentConfigs\Ecs /v CountryCode /d "std::wstring|RU" /f > nul
