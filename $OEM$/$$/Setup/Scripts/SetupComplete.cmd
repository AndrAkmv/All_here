@echo off

set _arch=x64
if %PROCESSOR_ARCHITECTURE%==x86 if not defined PROCESSOR_ARCHITEW6432 set _arch=x86

start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x86_2005.exe" /q
if %_arch%==x64 start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x64_2005.exe" /q
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x86_2008.exe" /q
if %_arch%==x64 start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x64_2008.exe" /q
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x86_2010.exe" /q
if %_arch%==x64 start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x64_2010.exe" /q
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x86_2012.exe" /q
if %_arch%==x64 start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x64_2012.exe" /q
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x86_2013.exe" /q
if %_arch%==x64 start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x64_2013.exe" /q
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x86_2015-2022.exe" /q
if %_arch%==x64 start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x64_2015-2022.exe" /q
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vstor_redist.exe" /q

ver | find "6.1" > nul && goto :windows-7
ver | find "6.3" > nul && goto :windows-9
ver | find "10.0.14393" > nul && goto :Windows-B
ver | find "10.0.17763" > nul && goto :Windows-C
ver | find "10.0.19044" > nul && goto :Windows-X
goto :cleanup

:windows-7
dism /Online /English /LogLevel:1 /Add-Package /PackagePath:"%SYSTEMDRIVE%\OEM\Updates\Windows 7 - Online\%_arch%"
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft .NET Framework 4.8\ndp48-x86-x64-allos-enu.exe" /q
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft .NET Framework 4.8\ndp48-x86-x64-allos-rus.exe" /q
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft .NET Framework 4.8\ndp48-kb4532941-%_arch%.exe" /q
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2010 Standard SP2+\setup.exe" ^
/config "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2010 Standard SP2+\Unattend\config.xml"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Tweaks /d "cmd /c reg import %SYSTEMROOT%\Setup\Scripts\Tweaks-7.reg"
goto :cleanup

:windows-9
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2013 Standard SP1+\setup.exe" ^
/config "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2013 Standard SP1+\unattend\config.xml"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Tweaks /d "cmd /c reg import %SYSTEMROOT%\Setup\Scripts\Tweaks-9.reg"
goto :cleanup

:windows-B
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2016 Standard SP0+\setup.exe" ^
/config "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2016 Standard SP0+\unattend\config.xml"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Tweaks /d "cmd /c reg import %SYSTEMROOT%\Setup\Scripts\Tweaks-Y.reg"
goto :cleanup

:windows-C
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2019 Standard latest\setup.exe" ^
/configure "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2019 Standard latest\config.xml"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Tweaks /d "cmd /c reg import %SYSTEMROOT%\Setup\Scripts\Tweaks-Y.reg"
goto :cleanup

:windows-X
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Tweaks /d "cmd /c reg import %SYSTEMROOT%\Setup\Scripts\Tweaks-Y.reg"
goto :cleanup

:cleanup
start "" /w "%SYSTEMDRIVE%\OEM\Activator\AAct_%_arch%.exe" /win=act /ofs=act /taskwin /taskofs
rd /s /q %SYSTEMDRIVE%\OEM
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v DTasks /d "cmd /c %SYSTEMROOT%\Setup\Scripts\DeleteTasks.cmd"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Folder /d "cmd /c %SYSTEMROOT%\Setup\Scripts\UserFolders2D.cmd"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Remove /d "cmd /c rd /s /q %SYSTEMROOT%\Setup\Scripts"
powercfg -s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powershell -ExecutionPolicy ByPass -Command "$ms = New-Object -ComObject Microsoft.Update.ServiceManager; $ms.AddService2('7971f918-a847-4430-9279-4a52d1efe18d',7,'')"
