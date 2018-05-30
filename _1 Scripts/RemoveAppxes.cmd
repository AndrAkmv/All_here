@echo off
title Deleting Appxes in Windows image

set _file=install.wim
set _img=Online
set _mnt=mount

ver | find "6.1" > nul && exit

:pre_menu
cls
if not exist %_file% goto :remove
dism /English /LogLevel:1 /Get-ImageInfo /ImageFile:%_file%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & exit
set /p _ind=Input index or press [Enter] for quit: || exit
if %_ind% EQU 0 goto :remove
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

:remove
cls
echo Getting list of Appxes. Please wait...
dism /%_img% /English /LogLevel:1 /Get-ProvisionedAppxPackages > %TEMP%\appxes.txt
echo -------------------------------------------------------------------------------
set _num=1
for /f "skip=8 tokens=3" %%a in (%TEMP%\appxes.txt) do call :filter %%a
del %TEMP%\appxes.txt
echo Removes default application associations
dism /%_img% /English /LogLevel:1 /Remove-DefaultAppAssociations
echo -------------------------------------------------------------------------------
if %_img%==Online (
echo Remove current Appxes for AllUsers
powershell -Command Start-Process powershell -ArgumentList '-NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File RemoveAppxes.ps1' -Verb RunAs
)
if not exist %_file% exit
goto :unmount

:filter
echo %1 | findstr /ric:"Microsoft.*" > nul
if %ERRORLEVEL% EQU 0 call :action %1
exit /b

:action
echo %1 | findstr /ric:"Microsoft.*_" > nul
if %ERRORLEVEL% NEQ 0 (
set /a _num+=1
echo %_num% Remove: %1
) else (
dism /%_img% /English /LogLevel:1 /Remove-ProvisionedAppxPackage /PackageName:%1
echo -------------------------------------------------------------------------------
)
exit /b

:mount
cls
md %_mnt%
dism /English /LogLevel:1 /Mount-Image /ImageFile:%_file% /Index:%_ind% /MountDir:%_mnt%
if %ERRORLEVEL% NEQ 0 rd %_mnt% & pause & exit
set _img=Image:%_mnt%
goto :remove

:unmount
cls
if not exist %_file% exit
if not %_img%==Online (
dism /English /LogLevel:1 /Unmount-Image /MountDir:%_mnt% /Commit
rd %_mnt%
)
set _img=Online
goto :pre_menu
