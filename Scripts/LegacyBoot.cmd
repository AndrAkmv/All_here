@echo off

ver | find "6.1" > nul && exit

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Configuration Manager\LastKnownGood" /v Enabled /t REG_DWORD /d 1 /f
bcdedit /set {current} bootmenupolicy legacy
timeout 3 > nul
