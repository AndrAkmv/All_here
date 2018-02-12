@echo off
title Adding Old updates into Windows 8.1 image

dism /Online /English /LogLevel:1 /Get-Help | find "Image Version: 6.3" > nul || exit

set _arch=x64
if %PROCESSOR_ARCHITECTURE%==x86 if not defined PROCESSOR_ARCHITEW6432 set _arch=x86

echo Getting list of packages. Please wait...
dism /Online /English /LogLevel:1 /Get-Packages > %TEMP%\packages.txt
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System update KB2919355
call :exist %_arch%\Windows8.1-KB2919355-%_arch%.cab ||^
dism /Online /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB2919355-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB2932046
call :exist %_arch%\Windows8.1-KB2932046-%_arch%.cab ||^
dism /Online /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB2932046-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB2934018
call :exist %_arch%\Windows8.1-KB2934018-%_arch%.cab ||^
dism /Online /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB2934018-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB2937592
call :exist %_arch%\Windows8.1-KB2937592-%_arch%.cab ||^
dism /Online /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB2937592-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB2938439
call :exist %_arch%\Windows8.1-KB2938439-%_arch%.cab ||^
dism /Online /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB2938439-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: Update for .NET Native KB2954879-v2
call :exist %_arch%\Windows8.1-KB2954879-v2-%_arch%.cab ||^
dism /Online /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB2954879-v2-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: Windows Update Client KB2959977
call :exist %_arch%\Windows8.1-KB2959977-%_arch%.cab ||^
dism /Online /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB2959977-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System update KB2962140
call :exist %_arch%\Windows8.1-KB2962140-%_arch%.cab ||^
dism /Online /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB2962140-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: July 2014 update rollup KB2967917
call :exist %_arch%\Windows8.1-KB2967917-%_arch%.cab ||^
dism /Online /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB2967917-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB2973351
call :exist %_arch%\Windows8.1-KB2973351-%_arch%.cab ||^
dism /Online /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB2973351-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: November 2014 update rollup KB3000850
call :exist %_arch%\Windows8.1-KB3000850-%_arch%.cab ||^
dism /Online /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB3000850-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB3003057
call :exist %_arch%\Windows8.1-KB3003057-%_arch%.cab ||^
dism /Online /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB3003057-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System update KB3014442
call :exist %_arch%\Windows8.1-KB3014442-%_arch%.cab ||^
dism /Online /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB3014442-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
del %TEMP%\packages.txt
exit

:exist
dism /Online /English /LogLevel:1 /Get-PackageInfo /PackagePath:%1 | find "Package Identity" | findstr /g:/ %TEMP%\packages.txt > nul
exit /b
