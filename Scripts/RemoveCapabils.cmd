@echo off
title Removing capabils from Windows image

set _file=install.wim
set _make=Commit
set _img=Online
set _mnt=mount

dism /English /LogLevel:1 /Get-Help | find "Version: 10" > nul || exit

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
echo Getting list of capabils. Please wait...
dism /English /LogLevel:1 /%_img% /Get-Capabilities /Format:Table > %TEMP%\capabils.txt
echo -------------------------------------------------------------------------------
for /f "skip=12 tokens=1,2" %%i in (%TEMP%\capabils.txt) do call :state %%i "%%j"
del %TEMP%\capabils.txt
goto :unmount

:state
if %2=="|" findstr %1 %TEMP%\capabils.txt | find "Installed" > nul && call :exclude %1
exit /b

:exclude
if %1==NetFX3~~~~ exit /b
if %1==OpenSSH.Client~~~~0.0.1.0 exit /b
if %1==OneCoreUAP.OneSync~~~~0.0.1.0 exit /b
if %1==Language.Basic~~~en-US~0.0.1.0 exit /b
if %1==Language.Basic~~~ru-RU~0.0.1.0 exit /b
if %1==Language.OCR~~~en-US~0.0.1.0 exit /b
if %1==Language.OCR~~~ru-RU~0.0.1.0 exit /b
if %1==Browser.InternetExplorer~~~~0.0.11.0 exit /b
if %1==Media.WindowsMediaPlayer~~~~0.0.12.0 exit /b
if %1==Microsoft.Windows.MSPaint~~~~0.0.1.0 exit /b
if %1==Microsoft.Windows.Notepad~~~~0.0.1.0 exit /b
if %1==Microsoft.Windows.WordPad~~~~0.0.1.0 exit /b
if %1==DirectX.Configuration.Database~~~~0.0.1.0 exit /b
if %1==Windows.Client.ShellComponents~~~~0.0.1.0 exit /b

set /a _num+=1
echo %_num% Remove: %1
dism /English /LogLevel:1 /%_img% /Remove-Capability /CapabilityName:%1 /NoRestart
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 if %ERRORLEVEL% NEQ 3010 set _make=Discard & pause
exit /b

:unmount
cls
if not exist %_file% exit
dism /English /LogLevel:1 /Unmount-Image /MountDir:%_mnt% /%_make%
if %ERRORLEVEL% NEQ 0 pause
rd %_mnt%
