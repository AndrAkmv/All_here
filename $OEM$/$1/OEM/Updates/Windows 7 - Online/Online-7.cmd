@echo off
title Adding Only-Online updates into Windows 7 image

dism /Online /English /LogLevel:1 /Get-Help | find "Image Version: 6.1" > nul || exit

set _arch=x64
if %PROCESSOR_ARCHITECTURE%==x86 if not defined PROCESSOR_ARCHITEW6432 set _arch=x86

echo Getting list of packages. Please wait...
dism /Online /English /LogLevel:1 /Get-Packages > %TEMP%\packages.txt
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: "Service Pack 1 for Windows 7" KB2533552
call :exist %_arch%\Windows6.1-KB2533552-%_arch%.cab ||^
dism /Online /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2533552-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
if %_arch%==x64 (
echo %_num% Add: System update KB2603229
call :exist x64\Windows6.1-KB2603229-x64.cab ||^
dism /Online /English /LogLevel:1 /Add-Package /PackagePath:x64\Windows6.1-KB2603229-x64.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
)
echo %_num% Add: Servicing stack update KB3177467
call :exist %_arch%\Windows6.1-KB3177467-%_arch%.cab ||^
dism /Online /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3177467-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
del %TEMP%\packages.txt
exit

:exist
dism /Online /English /LogLevel:1 /Get-PackageInfo /PackagePath:%1 | find "Package Identity" | findstr /g:/ %TEMP%\packages.txt > nul
exit /b
