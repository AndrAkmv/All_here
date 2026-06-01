@echo off

powercfg /h off
powercfg /l | find "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
if %ERRORLEVEL% EQU 0 powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

"%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x86_2012.exe" /q
"%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x64_2012.exe" /q
"%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x86_2013.exe" /q
"%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x64_2013.exe" /q
ver | find "10"
if %ERRORLEVEL% EQU 0 (
"%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x86_2017-2026.exe" /q
"%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x64_2017-2026.exe" /q
) else (
"%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x86_2015-2022.exe" /q
"%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x64_2015-2022.exe" /q
)

ver | find "6.1" && goto :windows-7

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"$flash = (Get-Volume ^| Where-Object DriveType -eq 'Removable' ^| Select-Object -First 1).DriveLetter; ^
$lhard = (Get-Volume ^| Where-Object DriveType -eq 'Fixed' ^| Select-Object -Last 1).DriveLetter; ^
if ($flash -and $lhard -and ($flash -lt $lhard)) { ^
Set-Partition -DriveLetter $flash -NewDriveLetter T; ^
Set-Partition -DriveLetter $lhard -NewDriveLetter $flash; ^
Set-Partition -DriveLetter T -NewDriveLetter $lhard }"

ver | find "6.3" && goto :windows-9
ver | find "10.0.14393" && goto :Windows-B
ver | find "10.0.17763" && goto :Windows-C
ver | find "10.0.19044" && goto :Windows-D
goto :cleanup

:windows-7
dism /Online /English /LogLevel:1 /Add-Package /PackagePath:"%SYSTEMDRIVE%\OEM\Updates\Windows 7 - Online\x64"
"%SYSTEMDRIVE%\OEM\Software\Microsoft .NET Framework 4.8\ndp48-x86-x64-allos-enu.exe" /q
"%SYSTEMDRIVE%\OEM\Software\Microsoft .NET Framework 4.8\ndp48-x86-x64-allos-rus.exe" /q
"%SYSTEMDRIVE%\OEM\Software\Microsoft .NET Framework 4.8\ndp48-kb4532941-x64.exe" /q
"%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2010 Standard x32\setup.exe" ^
/config "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2010 Standard x32\Unattend\config.xml"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Tweaks /d "cmd /c reg import %SYSTEMROOT%\Setup\Scripts\Tweaks-7.reg"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v HotFix /d "cscript //b %SYSTEMROOT%\Setup\Scripts\W7-Fix-Event-ID-10.vbs"
sc stop CscService && sc config CscService start= disabled
printui /dd /m "Microsoft Shared Fax Driver"
goto :cleanup

:windows-9
"%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2013 Standard x32\setup.exe" ^
/config "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2013 Standard x32\unattend\config.xml"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Tweaks /d "cmd /c reg import %SYSTEMROOT%\Setup\Scripts\Tweaks-9.reg"
printui /dl /n "Fax" && printui /dd /m "Microsoft Shared Fax Driver"
goto :cleanup

:windows-B
"%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2016 Standard x32\setup.exe" ^
/config "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2016 Standard x32\unattend\config.xml"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Tweaks /d "cmd /c reg import %SYSTEMROOT%\Setup\Scripts\Tweaks-B.reg"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v UsoCli /d "cmd /c usoclient startscan"
goto :cdpuser

:windows-C
"%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2019 Standard x64\setup.exe" ^
/configure "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2019 Standard x64\config.xml"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Tweaks /d "cmd /c reg import %SYSTEMROOT%\Setup\Scripts\Tweaks-C.reg"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v UsoCli /d "cmd /c usoclient refreshsettings"
goto :cdpuser

:windows-D
dism /Online /English /LogLevel:1 /Cleanup-Image /StartComponentCleanup /NoRestart
"%PROGRAMFILES(X86)%\Microsoft\Edge\Application\92.0.902.67\Installer\setup.exe" ^
/uninstall /msedge /system-level /force-uninstall
"%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2021 Standard x64\setup.exe" ^
/configure "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2021 Standard x64\config.xml"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Tweaks /d "cmd /c reg import %SYSTEMROOT%\Setup\Scripts\Tweaks-D.reg"
goto :onesync

:cdpuser
for /f %%i in ('reg query HKLM\SYSTEM\CurrentControlSet\Services /k /f CDPUserSvc ^| find "CDPUserSvc"') do (
reg add %%i /v Start /t REG_DWORD /d 3 /f)

:onesync
for /f %%i in ('reg query HKLM\SYSTEM\CurrentControlSet\Services /k /f OneSyncSvc ^| find "OneSyncSvc"') do (
reg add %%i /v Start /t REG_DWORD /d 3 /f)

:cleanup
sc stop WinDefend && sc config WinDefend start= disabled
reagentc /disable && del /a %SYSTEMROOT%\System32\Recovery\Winre.wim
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v ClrEvt /d "cmd /c %SYSTEMROOT%\Setup\Scripts\ClearEvents.cmd"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v DTasks /d "cmd /c %SYSTEMROOT%\Setup\Scripts\DeleteTasks.cmd"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Folder /d "cmd /c %SYSTEMROOT%\Setup\Scripts\UserFolders2D.cmd"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Remove /d "cmd /c rd /s /q %SYSTEMROOT%\Setup\Scripts"
"%SYSTEMDRIVE%\OEM\Activator\AAct_x64.exe" /win=act /ofs=act /taskwin /taskofs
rd /s /q %SYSTEMDRIVE%\OEM
rd /s /q %SYSTEMDRIVE%\PerfLogs
rd "%SYSTEMDRIVE%\Documents and Settings"
rd %SYSTEMDRIVE%\Recovery
rd %SYSTEMDRIVE%\inetpub
