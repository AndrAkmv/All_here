@echo off

wevtutil cl Microsoft-Windows-PrintService/Admin                                                                                                 &rem - - B C -
wevtutil cl Microsoft-Windows-SMBWitnessClient/Admin                                                                                             &rem - - B C -
wevtutil cl Microsoft-Windows-Kernel-EventTracing/Admin                                                                                          &rem - - B - D
wevtutil cl Microsoft-Windows-Provisioning-Diagnostics-Provider/AutoPilot                                                                        &rem - - - C D
wevtutil cl Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider/Admin                                                             &rem - - B - D

reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Device /d "cmd /c wevtutil cl Microsoft-Windows-DeviceSetupManager/Admin"      &rem - 9 B C D
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Modela /d "cmd /c wevtutil cl Microsoft-Windows-AppModel-Runtime/Admin"        &rem - - B C D
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Readin /d "cmd /c wevtutil cl Microsoft-Windows-AppReadiness/Admin"            &rem - 9 - C D
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v Applic /d "cmd /c wevtutil cl Application"                                     &rem 7 9 B C D
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v System /d "cmd /c wevtutil cl System"                                          &rem 7 9 B C D

timeout 3 > nul
