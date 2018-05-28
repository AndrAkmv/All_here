@echo off
title Disabling features in Windows image

set _file=install.wim
set _img=Online
set _mnt=mount
set _word=Wim

ver | find "6.1" > nul || set _word=Image

:pre_menu
cls
if not exist %_file% goto :version
dism /English /LogLevel:1 /Get-%_word%Info /%_word%File:%_file%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & exit
set /p _ind=Input index or press [Enter] for quit: || exit
if %_ind% EQU 0 goto :version
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

:version
dism /%_img% /English /LogLevel:1 /Get-Help | find "Image Version: 6.1" > nul && goto :disable-7
dism /%_img% /English /LogLevel:1 /Get-Help | find "Image Version: 6.3" > nul && goto :disable-9
dism /%_img% /English /LogLevel:1 /Get-Help | find "Image Version: 10" > nul && goto :disable-A
goto :unmount

:disable-7
cls
echo Getting list of features. Please wait...
dism /%_img% /English /LogLevel:1 /Get-Features /Format:Table > %TEMP%\features.txt
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: WindowsGadgetPlatform
call :state WindowsGadgetPlatform &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:WindowsGadgetPlatform /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: MediaCenter
call :state MediaCenter &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:MediaCenter /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: OpticalMediaDisc
call :state OpticalMediaDisc &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:OpticalMediaDisc /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: TabletPCOC
call :state TabletPCOC &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:TabletPCOC /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: Printing-Foundation-Features
call :state Printing-Foundation-Features &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:Printing-Foundation-Features /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: MSRDC-Infrastructure
call :state MSRDC-Infrastructure &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:MSRDC-Infrastructure /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: Printing-XPSServices-Features
call :state Printing-XPSServices-Features &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:Printing-XPSServices-Features /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: Xps-Foundation-Xps-Viewer
call :state Xps-Foundation-Xps-Viewer &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:Xps-Foundation-Xps-Viewer /NoRestart
echo -------------------------------------------------------------------------------
del %TEMP%\features.txt
goto :unmount

:disable-9
cls
echo Getting list of features. Please wait...
dism /%_img% /English /LogLevel:1 /Get-Features /Format:Table > %TEMP%\features.txt
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: Printing-Foundation-Features
call :state Printing-Foundation-Features &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:Printing-Foundation-Features /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: Windows-Defender-Default-Definitions
call :state Windows-Defender-Default-Definitions &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:Windows-Defender-Default-Definitions /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: MicrosoftWindowsPowerShellV2Root
call :state MicrosoftWindowsPowerShellV2Root &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:MicrosoftWindowsPowerShellV2Root /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: NetFx4-AdvSrvs
call :state NetFx4-AdvSrvs &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:NetFx4-AdvSrvs /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: Microsoft-Windows-MobilePC-LocationProvider-INF
call :state Microsoft-Windows-MobilePC-LocationProvider-INF &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:Microsoft-Windows-MobilePC-LocationProvider-INF /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: Printing-XPSServices-Features
call :state Printing-XPSServices-Features &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:Printing-XPSServices-Features /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: MSRDC-Infrastructure
call :state MSRDC-Infrastructure &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:MSRDC-Infrastructure /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: Xps-Foundation-Xps-Viewer
call :state Xps-Foundation-Xps-Viewer &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:Xps-Foundation-Xps-Viewer /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: WorkFolders-Client
call :state WorkFolders-Client &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:WorkFolders-Client /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: SMB1Protocol
call :state SMB1Protocol &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:SMB1Protocol /NoRestart
echo -------------------------------------------------------------------------------
del %TEMP%\features.txt
goto :unmount

:disable-A
cls
echo Getting list of features. Please wait...
dism /%_img% /English /LogLevel:1 /Get-Features /Format:Table > %TEMP%\features.txt
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: MicrosoftWindowsPowerShellV2Root
call :state MicrosoftWindowsPowerShellV2Root &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:MicrosoftWindowsPowerShellV2Root /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: NetFx4-AdvSrvs
call :state NetFx4-AdvSrvs &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:NetFx4-AdvSrvs /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: Printing-PrintToPDFServices-Features
call :state Printing-PrintToPDFServices-Features &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:Printing-PrintToPDFServices-Features /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: Printing-XPSServices-Features
call :state Printing-XPSServices-Features &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:Printing-XPSServices-Features /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: MSRDC-Infrastructure
call :state MSRDC-Infrastructure &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:MSRDC-Infrastructure /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: Xps-Foundation-Xps-Viewer
call :state Xps-Foundation-Xps-Viewer &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:Xps-Foundation-Xps-Viewer /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: WorkFolders-Client
call :state WorkFolders-Client &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:WorkFolders-Client /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: SMB1Protocol
call :state SMB1Protocol &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:SMB1Protocol /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Disable: Printing-Foundation-Features
call :state Printing-Foundation-Features &&^
dism /%_img% /English /LogLevel:1 /Disable-Feature /FeatureName:Printing-Foundation-Features /NoRestart
echo -------------------------------------------------------------------------------
del %TEMP%\features.txt
goto :unmount

:state
findstr %1 %TEMP%\features.txt | find "Enable" > nul
exit /b

:mount
cls
md %_mnt%
dism /English /LogLevel:1 /Mount-%_word% /%_word%File:%_file% /Index:%_ind% /MountDir:%_mnt%
if %ERRORLEVEL% NEQ 0 rd %_mnt% & pause & exit
set _img=Image:%_mnt%
goto :version

:unmount
cls
if not exist %_file% exit
if not %_img%==Online (
dism /English /LogLevel:1 /Unmount-%_word% /MountDir:%_mnt% /Commit
rd %_mnt%
)
set _img=Online
goto :pre_menu
