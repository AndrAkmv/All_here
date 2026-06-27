@echo off

ver | find "6.1" > nul
if %ERRORLEVEL% EQU 0 (
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v WMPSho /d ^
"cmd /c reg delete \"HKCR\SystemFileAssociations\Directory.Audio\shellex\ContextMenuHandlers\WMPShopMusic\" /f"

reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Accept /d ^
"cmd /c reg add \"HKCU\Software\Microsoft\MediaPlayer\Preferences\" /v AcceptedPrivacyStatement /t REG_DWORD /d 1 /f"

reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v ChFreq /d ^
"cmd /c reg add \"HKCU\Software\Microsoft\MediaPlayer\Preferences\" /v UpgradeCheckFrequency /t REG_DWORD /d 2 /f"
)
ver | find "10" > nul
if %ERRORLEVEL% EQU 0 (
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Histor /d ^
"cmd /c reg add \"HKCU\Software\Microsoft\Windows\CurrentVersion\Search\" /v DeviceHistoryEnabled /t REG_DWORD /d 0 /f"
) else (
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Favori /d ^
"cmd /c reg delete \"HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband\" /f"
)
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v MinAni /d ^
"cmd /c reg add \"HKCU\Control Panel\Desktop\WindowMetrics\" /v MinAnimate /d 0 /f"

reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Shadow /d ^
"cmd /c reg add \"HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\" /v ListviewShadow /t REG_DWORD /d 0 /f"

reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Tskbar /d ^
"cmd /c reg add \"HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\" /v TaskbarAnimations /t REG_DWORD /d 0 /f"

reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v UsrMsk /d ^
"cmd /c reg add \"HKCU\Control Panel\Desktop\" /v UserPreferencesMask /t REG_BINARY /d 9012038012000000 /f"

ver | find "10.0.19044" > nul
if %ERRORLEVEL% NEQ 0 (
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v WMILog /d ^
"cmd /c reg add \"HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener\" /v Start /t REG_DWORD /d 0 /f"
) else (
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Histor /d ^
"cmd /c reg add \"HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings\" /v IsDeviceSearchHistoryEnabled /t REG_DWORD /d 0 /f" /f

reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v WMILog /d ^
"cmd /c reg add \"HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Diagtrack-Listener\" /v Start /t REG_DWORD /d 0 /f"
)
timeout 3 > nul
