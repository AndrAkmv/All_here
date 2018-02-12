@echo off
title Adding Other updates into Windows 7 image

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
echo %_num% Add: System update KB2545698
call :exist %_arch%\Windows6.1-KB2545698-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2545698-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System update KB2547666
call :exist %_arch%\Windows6.1-KB2547666-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2547666-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System update KB2574819-v2
call :exist %_arch%\Windows6.1-KB2574819-v2-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2574819-v2-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: Remote Desktop Protocol 8.0 KB2592687
call :exist %_arch%\Windows6.1-KB2592687-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2592687-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB2667402-v2
call :exist %_arch%\Windows6.1-KB2667402-v2-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2667402-v2-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: Kernel-Mode Driver Framework KB2685811
call :exist %_arch%\Windows6.1-KB2685811-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2685811-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: User-Mode Driver Framework: KB2685813
call :exist %_arch%\Windows6.1-KB2685813-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2685813-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB2698365
call :exist %_arch%\Windows6.1-KB2698365-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2698365-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System update KB2732059-v5
call :exist %_arch%\Windows6.1-KB2732059-v5-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2732059-v5-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System update KB2750841
call :exist %_arch%\Windows6.1-KB2750841-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2750841-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System update KB2761217
call :exist %_arch%\Windows6.1-KB2761217-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2761217-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System update KB2773072
call :exist %_arch%\Windows6.1-KB2773072-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2773072-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB2813347
call :exist %_arch%\Windows6.1-KB2813347-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2813347-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: Microcode update for AMD processors KB2818604
call :exist %_arch%\Windows6.1-KB2818604-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2818604-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: RemoteApp and Desktop Connections KB2830477
call :exist %_arch%\Windows6.1-KB2830477-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2830477-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB2862330-v2
call :exist %_arch%\Windows6.1-KB2862330-v2-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2862330-v2-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update for the .NET Framework 3.5.1 KB2894844
call :exist %_arch%\Windows6.1-KB2894844-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2894844-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: Cumulative security update for ActiveX Kill Bits KB2900986
call :exist %_arch%\Windows6.1-KB2900986-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2900986-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB2912390
call :exist %_arch%\Windows6.1-KB2912390-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2912390-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System update KB2919469
call :exist %_arch%\Windows6.1-KB2919469-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2919469-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System update for RDP 8.1 KB2923545
call :exist %_arch%\Windows6.1-KB2923545-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2923545-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System update KB2970228
call :exist %_arch%\Windows6.1-KB2970228-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2970228-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB2984972
call :exist %_arch%\Windows6.1-KB2984972-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB2984972-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB3004375-v3
call :exist %_arch%\Windows6.1-KB3004375-v3-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3004375-v3-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: Hotfix (currency symbol of Lithuania) KB3006137
call :exist %_arch%\Windows6.1-KB3006137-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3006137-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update for RDC 8.1 KB3020388
call :exist %_arch%\Windows6.1-KB3020388-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3020388-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB3035126
call :exist %_arch%\Windows6.1-KB3035126-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3035126-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB3046269
call :exist %_arch%\Windows6.1-KB3046269-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3046269-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB3059317
call :exist %_arch%\Windows6.1-KB3059317-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3059317-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: Microcode update for Intel processors KB3064209
call :exist %_arch%\Windows6.1-KB3064209-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3064209-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update for RDP 8.1 KB3075226
call :exist %_arch%\Windows6.1-KB3075226-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3075226-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB3078601
call :exist %_arch%\Windows6.1-KB3078601-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3078601-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System update KB3102429-v2
call :exist %_arch%\Windows6.1-KB3102429-v2-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3102429-v2-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB3110329
call :exist %_arch%\Windows6.1-KB3110329-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3110329-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System update KB3138612
call :exist %_arch%\Windows6.1-KB3138612-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3138612-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB3156016
call :exist %_arch%\Windows6.1-KB3156016-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3156016-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB3156019
call :exist %_arch%\Windows6.1-KB3156019-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3156019-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB3159398
call :exist %_arch%\Windows6.1-KB3159398-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3159398-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB3161949
call :exist %_arch%\Windows6.1-KB3161949-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3161949-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB3161958
call :exist %_arch%\Windows6.1-KB3161958-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3161958-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System update KB3184143
call :exist %_arch%\Windows6.1-KB3184143-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB3184143-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: Windows Activation Technologies KB971033
call :exist %_arch%\Windows6.1-KB971033-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows6.1-KB971033-%_arch%.cab /NoRestart
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
