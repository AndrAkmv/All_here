@echo off
title Adding Rollup updates into Windows 7 image

set _arch=x64
set _file=install.wim
set _img=Online
set _mnt=mount

:pre_menu
cls
if not exist %_file% goto :check
dism /English /LogLevel:1 /Get-WimInfo /WimFile:%_file%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & exit
set /p _ind=Input index or press [Enter] for quit: || exit
if %_ind% EQU 0 goto :check
if %_ind% GTR 0 if %_ind% LEQ 24 goto :ind_menu
goto :pre_menu

:ind_menu
cls
dism /English /LogLevel:1 /Get-WimInfo /WimFile:%_file% /Index:%_ind%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & goto :pre_menu
choice /c abcdefghijklmnopqrstuvwxyz /n /m "Mount selected image? [m] "
if %ERRORLEVEL% EQU 13 goto :mount
goto :pre_menu

:check
dism /%_img% /English /LogLevel:1 /Get-Help | find "Image Version: 6.1" > nul ||^
if not exist %_file% (exit) else (goto :unmount)
goto :bit

:bit
if %_img%==Online (if %PROCESSOR_ARCHITECTURE%==x86 if not defined PROCESSOR_ARCHITEW6432 set _arch=x86)^
else (dism /English /LogLevel:1 /Get-WimInfo /WimFile:%_file% /Index:%_ind% | find "Architecture : x86" > nul && set _arch=x86)
goto :add

:add
cls
echo Getting list of packages. Please wait...
dism /%_img% /English /LogLevel:1 /Get-Packages > %TEMP%\packages.txt
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: July 2016 update rollup KB3172605
call :exist %_arch%\Windows6.1-KB3172605-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3172605-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: August 2016 update rollup KB3179573
call :exist %_arch%\Windows6.1-KB3179573-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3179573-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: Update for d3dcompiler_47.dll KB4019990
call :exist %_arch%\Windows6.1-KB4019990-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB4019990-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: November 2017 rollup NetFx3 KB4040980
call :exist %_arch%\Windows6.1-KB4040980-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB4040980-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: December 2017 montly rollup KB4054518
call :exist %_arch%\Windows6.1-KB4054518-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB4054518-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
del %TEMP%\packages.txt
if not exist %_file% exit
goto :unmount

:exist
dism /%_img% /English /LogLevel:1 /Get-PackageInfo /PackagePath:%1 | find "Package Identity" | findstr /g:/ %TEMP%\packages.txt > nul
exit /b

:mount
cls
md %_mnt%
dism /English /LogLevel:1 /Mount-Wim /WimFile:%_file% /Index:%_ind% /MountDir:%_mnt%
if %ERRORLEVEL% NEQ 0 rd %_mnt% & pause & exit
set _img=Image:%_mnt%
goto :check

:unmount
cls
if not %_img%==Online (
dism /English /LogLevel:1 /Unmount-Wim /MountDir:%_mnt% /Commit
rd %_mnt%
)
set _arch=x64
set _img=Online
goto :pre_menu
