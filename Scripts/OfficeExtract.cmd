@echo off
title Extracting updates for Microsoft Office

for /f "tokens=*" %%i in ('dir x86 /b') do call :extract %%i
timeout 3 > nul
exit

:extract
set /a _num+=1
echo %_num% Extract: %1
start /w x86\%1 /extract:x86-msp /quiet
exit /b
