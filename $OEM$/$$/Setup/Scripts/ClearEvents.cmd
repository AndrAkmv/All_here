@echo off

ver | find "10" > nul || exit

wevtutil cl Application                                                                                                                              &rem B ? D
wevtutil cl Microsoft-Windows-AppReadiness/Admin                                                                                                     &rem - ? D
wevtutil cl Microsoft-Windows-PrintService/Admin                                                                                                     &rem B ? ?
wevtutil cl Microsoft-Windows-SMBWitnessClient/Admin                                                                                                 &rem B ? -
wevtutil cl Microsoft-Windows-DeviceSetupManager/Admin                                                                                               &rem B ? ?
wevtutil cl Microsoft-Windows-Kernel-EventTracing/Admin                                                                                              &rem B ? -
wevtutil cl Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider/Admin                                                                 &rem B ? D

reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v AppMod /d "cmd /c wevtutil cl Microsoft-Windows-AppModel-Runtime/Admin"            &rem B ? D
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v System /d "cmd /c wevtutil cl System"                                              &rem B ? D

timeout 3 > nul
