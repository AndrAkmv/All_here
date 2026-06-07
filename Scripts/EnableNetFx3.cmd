@echo off
title Enabling NetFx3 in Windows image

set _file=install.wim
set _make=Commit
set _img=Online
set _mnt=mount

if not exist %_file% goto :version
dism /English /LogLevel:1 /Get-ImageInfo /ImageFile:%_file%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & exit
set /p _ind=Input index or press [Enter] for quit: || exit

cls
dism /English /LogLevel:1 /Get-ImageInfo /ImageFile:%_file% /Index:%_ind%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & exit
choice /c abcdefghijklmnopqrstuvwxyz /n /m "Mount selected image? [m] "
if %ERRORLEVEL% NEQ 13 exit

cls
md %_mnt%
dism /English /LogLevel:1 /Mount-Image /ImageFile:%_file% /Index:%_ind% /MountDir:%_mnt%
if %ERRORLEVEL% NEQ 0 rd %_mnt% & pause & exit
set _img=Image:%_mnt%

:version
dism /English /LogLevel:1 /%_img% /Get-Help | find "Image Version: 6.3" > nul && set _ver=8.1
if defined _ver goto :enable
dism /English /LogLevel:1 /%_img% /Get-Help | find "Image Version: 10.0.14393" > nul && set _ver=B
if defined _ver goto :enable
dism /English /LogLevel:1 /%_img% /Get-Help | find "Image Version: 10.0.17763" > nul && set _ver=C
if defined _ver goto :enable
dism /English /LogLevel:1 /%_img% /Get-Help | find "Image Version: 10.0.19044" > nul && set _ver=D
if defined _ver goto :enable
goto :unmount

:enable
cls
echo Getting list of features. Please wait...
dism /English /LogLevel:1 /%_img% /Get-Features /Format:Table > %TEMP%\features.txt
echo Unpacking SXS folder. Please wait...
start /w Windows%_ver%-SXS-x64.exe
echo -------------------------------------------------------------------------------
echo Enable: .NET Framework 3.5 (includes .NET 2.0 and 3.0)
call :state NetFx3 ||^
dism /English /LogLevel:1 /%_img% /Enable-Feature /FeatureName:NetFx3 /Source:%TEMP%\Windows%_ver%-SXS-x64 /LimitAccess /NoRestart
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 if %ERRORLEVEL% NEQ 3010 set _make=Discard & pause
del %TEMP%\features.txt
rd /s /q %TEMP%\Windows%_ver%-SXS-x64
if %_ver%==8.1 goto :add
goto :unmount

:state
findstr /b %1 %TEMP%\features.txt | find "Enable" > nul
exit /b

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
dism /English /LogLevel:1 /Unmount-Image /MountDir:%_mnt% /%_make%
if %ERRORLEVEL% NEQ 0 pause
rd %_mnt%
