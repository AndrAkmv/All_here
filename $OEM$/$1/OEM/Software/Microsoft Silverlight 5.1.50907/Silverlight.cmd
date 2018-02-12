@echo off
set _arch=x64
if %PROCESSOR_ARCHITECTURE%==x86 if not defined PROCESSOR_ARCHITEW6432 set _arch=x86
echo Microsoft Silverlight 5.1.50907.0
start /w Silverlight_%_arch%.exe /q
