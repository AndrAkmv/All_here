@echo off

set _arch=x64
if %PROCESSOR_ARCHITECTURE%==x86 if not defined PROCESSOR_ARCHITEW6432 set _arch=x86

start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft .NET Framework 4.7.2\NDP472-KB4054530-x86-x64-AllOS-ENU.exe" /q
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft .NET Framework 4.7.2\NDP472-KB4054530-x86-x64-AllOS-RUS.exe" /q
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
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x86_2017.exe" /q
if %_arch%==x64 start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vcredist_x64_2017.exe" /q
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Visual C++ Pack\vstor_redist.exe" /q
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Silverlight 5.1.50907\Silverlight_%_arch%.exe" /q

ver | find "6.1" > nul && goto :windows-7
ver | find "6.3" > nul && goto :windows-9
ver | find "10.0.14393" > nul && goto :windows-A
ver | find "10.0.17134" > nul && goto :windows-X
goto :cleanup

:windows-7
dism /Online /English /LogLevel:1 /Add-Package /PackagePath:"%SYSTEMDRIVE%\OEM\Updates\Windows 7 - Online\%_arch%"
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2010 Standard SP2+\setup.exe" ^
/config "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2010 Standard SP2+\Unattend\config.xml"
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Security Essentials 4.10.209\MSEInstall_%_arch%.exe" /s /runwgacheck /o
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Tweaks /d "cmd /c reg import %SYSTEMROOT%\Setup\Scripts\Tweaks-7.reg"
goto :cleanup

:windows-9
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2013 Standard SP1+\setup.exe" ^
/config "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2013 Standard SP1+\unattend\config.xml"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Tweaks /d "cmd /c reg import %SYSTEMROOT%\Setup\Scripts\Tweaks-9.reg"
goto :cleanup

:windows-A
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2016 Standard SP0+\setup.exe" ^
/config "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2016 Standard SP0+\unattend\config.xml"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Tweaks /d "cmd /c reg import %SYSTEMROOT%\Setup\Scripts\Tweaks-A.reg"
goto :cleanup

:windows-X
start "" /w "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2016 Standard SP0+\setup.exe" ^
/config "%SYSTEMDRIVE%\OEM\Software\Microsoft Office 2016 Standard SP0+\unattend\config.xml"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Tweaks /d "cmd /c reg import %SYSTEMROOT%\Setup\Scripts\Tweaks-X.reg"
goto :cleanup

:cleanup
start "" /w "%SYSTEMDRIVE%\OEM\Activator\AAct_%_arch%.exe" /win=act /ofs=act
rd /s /q %SYSTEMDRIVE%\OEM
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Folder /d "cmd /c %SYSTEMROOT%\Setup\Scripts\UserFolders2D.cmd"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Remove /d "cmd /c rd /s /q %SYSTEMROOT%\Setup\Scripts"
