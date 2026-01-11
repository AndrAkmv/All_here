@echo off
title Removing appxes from Windows image

set _file=install.wim
set _make=Commit
set _img=Online
set _mnt=mount

dism /English /LogLevel:1 /Get-Help | find "Version: 6.1" > nul && exit

if not exist %_file% goto :remove
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

:remove
cls
echo Getting list of appxes. Please wait...
dism /English /LogLevel:1 /%_img% /Get-ProvisionedAppxPackages > %TEMP%\appxes.txt
echo -------------------------------------------------------------------------------
for /f "skip=8 tokens=3" %%i in (%TEMP%\appxes.txt) do call :filter %%i
del %TEMP%\appxes.txt
if %_img%==Online (
echo Remove current Appxes for AllUsers
powershell -ExecutionPolicy Bypass -Command "Get-AppxPackage | Remove-AppxPackage"
)
goto :unmount

:filter
echo %1 | findstr /ric:"Microsoft.*_" > nul && call :action %1
exit /b

:action
set /a _num+=1
echo %_num% Remove: %1
dism /English /LogLevel:1 /%_img% /Remove-ProvisionedAppxPackage /PackageName:%1
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 if %ERRORLEVEL% NEQ 3010 set _make=Discard & pause
exit /b

:unmount
cls
if not exist %_file% exit
dism /English /LogLevel:1 /Unmount-Image /MountDir:%_mnt% /%_make%
if %ERRORLEVEL% NEQ 0 pause
rd %_mnt%
