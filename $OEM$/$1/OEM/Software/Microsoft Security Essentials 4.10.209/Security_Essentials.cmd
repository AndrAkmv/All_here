@echo off
set _arch=x64
if %PROCESSOR_ARCHITECTURE%==x86 if not defined PROCESSOR_ARCHITEW6432 set _arch=x86
echo Microsoft Security Essentials 4.10.209
start /w MSEInstall_%_arch%.exe /s /runwgacheck /o
