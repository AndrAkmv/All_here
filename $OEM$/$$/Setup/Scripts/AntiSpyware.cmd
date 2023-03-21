@echo off

ver | find "10" > nul || exit

for /f %%i in ('reg query HKLM\SYSTEM\CurrentControlSet\Services /k /f BcastDVRUserService ^| find "BcastDVRUserService"') do (
reg add %%i /v Start /t REG_DWORD /d 4 /f)                                                                                                  &rem - C
for /f %%i in ('reg query HKLM\SYSTEM\CurrentControlSet\Services /k /f BluetoothUserService ^| find "BluetoothUserService"') do (
reg add %%i /v Start /t REG_DWORD /d 4 /f)                                                                                                  &rem - C

for /f %%i in ('reg query HKLM\SYSTEM\CurrentControlSet\Services /k /f CaptureService ^| find "CaptureService"') do (
reg add %%i /v Start /t REG_DWORD /d 4 /f)                                                                                                  &rem - C
for /f %%i in ('reg query HKLM\SYSTEM\CurrentControlSet\Services /k /f cbdhsvc ^| find "cbdhsvc"') do (
reg add %%i /v Start /t REG_DWORD /d 4 /f)                                                                                                  &rem - C
for /f %%i in ('reg query HKLM\SYSTEM\CurrentControlSet\Services /k /f CDPUserSvc ^| find "CDPUserSvc"') do (
reg add %%i /v Start /t REG_DWORD /d 4 /f)                                                                                                  &rem B C
for /f %%i in ('reg query HKLM\SYSTEM\CurrentControlSet\Services /k /f ConsentUxUserSvc ^| find "ConsentUxUserSvc"') do (
reg add %%i /v Start /t REG_DWORD /d 4 /f)                                                                                                  &rem - C

for /f %%i in ('reg query HKLM\SYSTEM\CurrentControlSet\Services /k /f DevicePickerUserSvc ^| find "DevicePickerUserSvc"') do (
reg add %%i /v Start /t REG_DWORD /d 4 /f)                                                                                                  &rem - C
for /f %%i in ('reg query HKLM\SYSTEM\CurrentControlSet\Services /k /f DevicesFlowUserSvc ^| find "DevicesFlowUserSvc"') do (
reg add %%i /v Start /t REG_DWORD /d 4 /f)                                                                                                  &rem - C

for /f %%i in ('reg query HKLM\SYSTEM\CurrentControlSet\Services /k /f MessagingService ^| find "MessagingService"') do (
reg add %%i /v Start /t REG_DWORD /d 4 /f)                                                                                                  &rem B C

for /f %%i in ('reg query HKLM\SYSTEM\CurrentControlSet\Services /k /f OneSyncSvc ^| find "OneSyncSvc"') do (
reg add %%i /v Start /t REG_DWORD /d 4 /f)                                                                                                  &rem B C

for /f %%i in ('reg query HKLM\SYSTEM\CurrentControlSet\Services /k /f PimIndexMaintenanceSvc ^| find "PimIndexMaintenanceSvc"') do (
reg add %%i /v Start /t REG_DWORD /d 4 /f)                                                                                                  &rem B C
for /f %%i in ('reg query HKLM\SYSTEM\CurrentControlSet\Services /k /f PrintWorkflowUserSvc ^| find "PrintWorkflowUserSvc"') do (
reg add %%i /v Start /t REG_DWORD /d 4 /f)                                                                                                  &rem - C

for /f %%i in ('reg query HKLM\SYSTEM\CurrentControlSet\Services /k /f UnistoreSvc ^| find "UnistoreSvc"') do (
reg add %%i /v Start /t REG_DWORD /d 4 /f)                                                                                                  &rem B C
for /f %%i in ('reg query HKLM\SYSTEM\CurrentControlSet\Services /k /f UserDataSvc ^| find "UserDataSvc"') do (
reg add %%i /v Start /t REG_DWORD /d 4 /f)                                                                                                  &rem B C

for /f %%i in ('reg query HKLM\SYSTEM\CurrentControlSet\Services /k /f WpnUserService ^| find "WpnUserService"') do (
reg add %%i /v Start /t REG_DWORD /d 4 /f)                                                                                                  &rem B C

timeout 3 > nul
