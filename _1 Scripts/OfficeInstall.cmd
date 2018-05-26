@echo off
echo Installing updates for Microsoft Office
echo -------------------------------------------------------------------------------
for /f "tokens=*" %%i in ('dir x86 /b') do call :install %%i
timeout 3 > nul
exit

:install
set /a _num+=1
echo %_num% Install: %1
start /w x86\%1 /quiet /passive
exit /b
