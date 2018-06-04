@echo off
title Disabling features in Windows image

set _file=install.wim
set _img=Online
set _mnt=mount
set _word=Wim

dism /English /LogLevel:1 /Get-Help | find "Version: 6.1" > nul || set _word=Image

:pre_menu
cls
if not exist %_file% goto :disable
dism /English /LogLevel:1 /Get-%_word%Info /%_word%File:%_file%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & exit
set /p _ind=Input index or press [Enter] for quit: || exit
if %_ind% EQU 0 goto :disable
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

:disable
cls
echo Getting list of features. Please wait...
dism /%_img% /English /LogLevel:1 /Get-Features /Format:Table > %TEMP%\features.txt
echo -------------------------------------------------------------------------------
for /f "skip=12 tokens=1,2" %%i in (%TEMP%\features.txt) do call :state %%i "%%j"
del %TEMP%\features.txt
goto :unmount

:state
if %2=="|" findstr %1 %TEMP%\features.txt | find "Enable" > nul && call :exclude %1
exit /b

:exclude
if %1==NetFx3 exit /b
if %1==MediaPlayback exit /b
if %1==WindowsMediaPlayer exit /b
if %1==Internet-Explorer-Optional-x86 exit /b
if %1==Internet-Explorer-Optional-amd64 exit /b
if %1==SearchEngine-Client-Package exit /b
if %1==Windows-Defender-Default-Definitions exit /b
if %1==Microsoft-Hyper-V-Common-Drivers-Package exit /b
if %1==Microsoft-Hyper-V-Guest-Integration-Drivers-Package exit /b
if %1==Microsoft-Windows-NetFx-VCRedist-Package exit /b
if %1==Microsoft-Windows-Printing-PrintToPDFServices-Package exit /b
if %1==Microsoft-Windows-Printing-XPSServices-Package exit /b
if %1==Microsoft-Windows-Client-EmbeddedExp-Package exit /b
if %1==Microsoft-Windows-NetFx3-OC-Package exit /b
if %1==Microsoft-Windows-NetFx4-US-OC-Package exit /b
if %1==Microsoft-Windows-NetFx3-WCF-OC-Package exit /b
if %1==Microsoft-Windows-NetFx4-WCF-US-OC-Package exit /b
goto :action

:action
set /a _num+=1
echo %_num% Disable: %1
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:%1 /NoRestart
echo -------------------------------------------------------------------------------
exit /b

:mount
cls
md %_mnt%
dism /English /LogLevel:1 /Mount-%_word% /%_word%File:%_file% /Index:%_ind% /MountDir:%_mnt%
if %ERRORLEVEL% NEQ 0 rd %_mnt% & pause & exit
set _img=Image:%_mnt%
goto :disable

:unmount
cls
if not exist %_file% exit
if not %_img%==Online (
dism /English /LogLevel:1 /Unmount-%_word% /MountDir:%_mnt% /Commit
rd %_mnt%
)
set _img=Online
goto :pre_menu
