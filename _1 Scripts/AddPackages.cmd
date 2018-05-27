@echo off
title Adding update packages into Windows image

set _arch=x64
set _file=install.wim
set _img=Online
set _mnt=mount
set _word=Wim

ver | find "6.1" > nul || set _word=Image

:pre_menu
cls
if not exist %_file% goto :bit
dism /English /LogLevel:1 /Get-%_word%Info /%_word%File:%_file%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & exit
set /p _ind=Input index or press [Enter] for quit: || exit
if %_ind% EQU 0 goto :bit
if %_ind% GTR 0 if %_ind% LEQ 24 goto :ind_menu
goto :pre_menu

:ind_menu
cls
dism /English /LogLevel:1 /Get-%_word%Info /%_word%File:%_file% /Index:%_ind%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & goto :pre_menu
choice /c abcdefghijklmnopqrstuvwxyz /n /m "Mount selected image? [m] "
if %ERRORLEVEL% EQU 13 goto :mount
goto :pre_menu

:bit
if %_img%==Online (if %PROCESSOR_ARCHITECTURE%==x86 if not defined PROCESSOR_ARCHITEW6432 set _arch=x86)^
else (dism /English /LogLevel:1 /Get-%_word%Info /%_word%File:%_file% /Index:%_ind% | find "Architecture : x86" > nul && set _arch=x86)
goto :add

:add
cls
echo Getting list of packages. Please wait...
dism /%_img% /English /LogLevel:1 /Get-Packages > %TEMP%\packages.txt
echo -------------------------------------------------------------------------------
for /f "tokens=*" %%i in ('dir %_arch% /b') do call :handle %%i
del %TEMP%\packages.txt
if not exist %_file% exit
goto :unmount

:handle
set /a _num+=1
echo %_num% Add: %1
call :exist %_arch%\%1 || dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\%1 /NoRestart
echo -------------------------------------------------------------------------------
exit /b

:exist
dism /%_img% /English /LogLevel:1 /Get-PackageInfo /PackagePath:%1 | find "Package Identity" | findstr /g:/ %TEMP%\packages.txt > nul
exit /b

:mount
cls
md %_mnt%
dism /English /LogLevel:1 /Mount-%_word% /%_word%File:%_file% /Index:%_ind% /MountDir:%_mnt%
if %ERRORLEVEL% NEQ 0 rd %_mnt% & pause & exit
set _img=Image:%_mnt%
goto :bit

:unmount
cls
if not %_img%==Online (
dism /English /LogLevel:1 /Unmount-%_word% /MountDir:%_mnt% /Commit
rd %_mnt%
)
set _arch=x64
set _img=Online
goto :pre_menu
