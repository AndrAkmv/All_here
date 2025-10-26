@echo off
title Adding update packages into Windows image

set _file=install.wim
set _make=Commit
set _img=Online
set _mnt=mount
set _word=Wim

dism /English /LogLevel:1 /Get-Help | find "Version: 6.1" > nul || set _word=Image

if not exist %_file% goto :add
dism /English /LogLevel:1 /Get-%_word%Info /%_word%File:%_file%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & exit
set /p _ind=Input index or press [Enter] for quit: || exit

cls
dism /English /LogLevel:1 /Get-%_word%Info /%_word%File:%_file% /Index:%_ind%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & exit
choice /c abcdefghijklmnopqrstuvwxyz /n /m "Mount selected image? [m] "
if %ERRORLEVEL% NEQ 13 exit

cls
md %_mnt%
dism /English /LogLevel:1 /Mount-%_word% /%_word%File:%_file% /Index:%_ind% /MountDir:%_mnt%
if %ERRORLEVEL% NEQ 0 rd %_mnt% & pause & exit
set _img=Image:%_mnt%

:add
cls
echo Getting list of packages. Please wait...
dism /English /LogLevel:1 /%_img% /Get-Packages > %TEMP%\packages.txt
echo -------------------------------------------------------------------------------
for /f "tokens=*" %%i in ('dir x64 /b') do call :exist %%i
del %TEMP%\packages.txt
goto :unmount

:exist
dism /English /LogLevel:1 /%_img% /Get-PackageInfo /PackagePath:x64\%1 |^
find "Package Identity" | findstr /g:/ %TEMP%\packages.txt > nul || call :handle %1
exit /b

:handle
set /a _num+=1
echo %_num% Add: %1
dism /English /LogLevel:1 /%_img% /Add-Package /PackagePath:x64\%1 /NoRestart
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 if %ERRORLEVEL% NEQ 3010 set _make=Discard & pause
exit /b

:unmount
cls
if not exist %_file% exit
dism /English /LogLevel:1 /Unmount-%_word% /MountDir:%_mnt% /%_make%
if %ERRORLEVEL% NEQ 0 pause
rd %_mnt%
