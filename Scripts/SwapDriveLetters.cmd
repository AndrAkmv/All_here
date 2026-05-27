@echo off

for /f "Tokens=1 Delims=:" %%i in ('wmic LogicalDisk where "DriveType=2" get Name ^| find ":"') do set _flash=%%i
for /f "Tokens=1 Delims=:" %%i in ('wmic LogicalDisk where "DriveType=3" get Name ^| find ":"') do set _lhard=%%i

if not defined _flash exit
if not defined _lhard exit

if "%_flash%" lss "%_lhard%" (
> dp.txt (
echo select volume=%_flash%
echo assign letter=T
echo select volume=%_lhard%
echo assign letter=%_flash%
echo select volume=T
echo assign letter=%_lhard%
)
diskpart /s dp.txt && del dp.txt
)

timeout 3 > nul
