@echo off

ver | find "6.1" > nul || goto exit

set _arch=x64
if %PROCESSOR_ARCHITECTURE%==x86 if not defined PROCESSOR_ARCHITEW6432 set _arch=x86

echo Microsoft .NET Framework Russian
echo -------------------------------------------------------------------------------
echo .NET Framework 4.7.2
start /w ndp472-kb4054530-x86-x64-allos-enu.exe /passive /norestart
echo Russian Language Pack
start /w ndp472-kb4054530-x86-x64-allos-rus.exe /passive /norestart
echo Rollup updates (Feb 2019)
start /w ndp46-kb4483451-%_arch%.exe /passive /norestart
