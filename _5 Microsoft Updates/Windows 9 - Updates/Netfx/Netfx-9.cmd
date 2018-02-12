@echo off
title Adding Netfx updates into Windows 8.1 image

set _arch=x64
set _file=install.wim
set _img=Online
set _mnt=mount

:pre_menu
cls
if not exist %_file% goto :check
dism /English /LogLevel:1 /Get-ImageInfo /ImageFile:%_file%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & exit
set /p _ind=Input index or press [Enter] for quit: || exit
if %_ind% EQU 0 goto :check
if %_ind% GTR 0 if %_ind% LEQ 24 goto :ind_menu
goto :pre_menu

:ind_menu
cls
dism /English /LogLevel:1 /Get-ImageInfo /ImageFile:%_file% /Index:%_ind%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & goto :pre_menu
choice /c abcdefghijklmnopqrstuvwxyz /n /m "Mount selected image? [m] "
if %ERRORLEVEL% EQU 13 goto :mount
goto :pre_menu

:check
dism /%_img% /English /LogLevel:1 /Get-Help | find "Image Version: 6.3" > nul ||^
if not exist %_file% (exit) else (goto :unmount)
goto :bit

:bit
if %_img%==Online (if %PROCESSOR_ARCHITECTURE%==x86 if not defined PROCESSOR_ARCHITEW6432 set _arch=x86)^
else (dism /English /LogLevel:1 /Get-ImageInfo /ImageFile:%_file% /Index:%_ind% | find "Architecture : x86" > nul && set _arch=x86)
goto :enable

:enable
cls
echo Getting list of features. Please wait...
dism /%_img% /English /LogLevel:1 /Get-Features /Format:Table > %TEMP%\features.txt
echo -------------------------------------------------------------------------------
echo Unpacking SXS folder. Please wait...
start /d %_arch% /w Windows8.1-SXS-%_arch%.exe
echo -------------------------------------------------------------------------------
echo Enable: .NET Framework 3.5 (includes .NET 2.0 and 3.0)
call :state NetFx3 ||^
dism /%_img% /English /LogLevel:1 /Enable-Feature /FeatureName:NetFx3 /Source:%TEMP%\Windows8.1-SXS-%_arch% /LimitAccess /NoRestart
echo -------------------------------------------------------------------------------
del %TEMP%\features.txt
rd /s /q %TEMP%\Windows8.1-SXS-%_arch%
goto :add

:state
findstr %1 %TEMP%\features.txt | find "Enable" > nul
exit /b

:add
cls
echo Getting list of packages. Please wait...
dism /%_img% /English /LogLevel:1 /Get-Packages > %TEMP%\packages.txt
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB2894852-v2
call :exist %_arch%\Windows8.1-KB2894852-v2-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB2894852-v2-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB2966826
call :exist %_arch%\Windows8.1-KB2966826-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB2966826-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB2966828
call :exist %_arch%\Windows8.1-KB2966828-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB2966828-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB2968296
call :exist %_arch%\Windows8.1-KB2968296-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB2968296-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB2972103-v2
call :exist %_arch%\Windows8.1-KB2972103-v2-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB2972103-v2-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB2972213
call :exist %_arch%\Windows8.1-KB2972213-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB2972213-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB2973114
call :exist %_arch%\Windows8.1-KB2973114-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB2973114-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB2978122
call :exist %_arch%\Windows8.1-KB2978122-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB2978122-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB3023219
call :exist %_arch%\Windows8.1-KB3023219-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB3023219-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB3037576
call :exist %_arch%\Windows8.1-KB3037576-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB3037576-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB3072307
call :exist %_arch%\Windows8.1-KB3072307-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB3072307-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB3074545
call :exist %_arch%\Windows8.1-KB3074545-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB3074545-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB3097992
call :exist %_arch%\Windows8.1-KB3097992-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB3097992-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB3122651
call :exist %_arch%\Windows8.1-KB3122651-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB3122651-%_arch%.cab /NoRestart
echo -------------------------------------------------------------------------------
set /a _num+=1
echo %_num% Add: System security update KB3127222
call :exist %_arch%\Windows8.1-KB3127222-%_arch%.cab ||^
dism /%_img% /English /LogLevel:1 /Add-Package /PackagePath:%_arch%\Windows8.1-KB3127222-%_arch%.cab /NoRestart
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
dism /English /LogLevel:1 /Mount-Image /ImageFile:%_file% /Index:%_ind% /MountDir:%_mnt%
if %ERRORLEVEL% NEQ 0 rd %_mnt% & pause & exit
set _img=Image:%_mnt%
goto :check

:unmount
cls
if not %_img%==Online (
dism /English /LogLevel:1 /Unmount-Image /MountDir:%_mnt% /Commit
rd %_mnt%
)
set _arch=x64
set _img=Online
goto :pre_menu
