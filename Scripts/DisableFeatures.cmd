@echo off
title Disabling features in Windows image

set _file=install.wim
set _make=Commit
set _img=Online
set _mnt=mount
set _word=Wim

dism /English /LogLevel:1 /Get-Help | find "Version: 6.1" > nul || set _word=Image

if not exist %_file% goto :disable
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

:disable
cls
echo Getting list of features. Please wait...
dism /English /LogLevel:1 /%_img% /Get-Features /Format:Table > %TEMP%\features.txt
echo -------------------------------------------------------------------------------
for /f "skip=12 tokens=1,2" %%i in (%TEMP%\features.txt) do call :state %%i "%%j"
del %TEMP%\features.txt
goto :unmount

:state
if %2=="|" findstr %1 %TEMP%\features.txt | find "Enable" > nul && call :exclude %1
exit /b

:exclude
if %1==NetFx3 exit /b
if %1==SMB1Protocol exit /b
if %1==MediaPlayback exit /b
if %1==WindowsMediaPlayer exit /b
if %1==SearchEngine-Client-Package exit /b
if %1==Internet-Explorer-Optional-amd64 exit /b
if %1==Microsoft-Windows-NetFx3-OC-Package exit /b
if %1==Microsoft-Windows-NetFx4-US-OC-Package exit /b
if %1==Microsoft-Windows-NetFx3-WCF-OC-Package exit /b
if %1==Microsoft-Windows-NetFx4-WCF-US-OC-Package exit /b

set /a _num+=1
echo %_num% Disable: %1
dism /English /LogLevel:1 /%_img% /Disable-Feature /FeatureName:%1 /NoRestart
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 if %ERRORLEVEL% NEQ 3010 set _make=Discard & pause
exit /b

:unmount
cls
if not exist %_file% exit
dism /English /LogLevel:1 /Unmount-%_word% /MountDir:%_mnt% /%_make%
if %ERRORLEVEL% NEQ 0 pause
rd %_mnt%
