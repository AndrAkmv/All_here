@echo off

ver | find "6.1" > nul || goto exit

set _arch=x64
if %PROCESSOR_ARCHITECTURE%==x86 if not defined PROCESSOR_ARCHITEW6432 set _arch=x86

echo Microsoft .NET Framework Russian
echo -------------------------------------------------------------------------------
echo .NET Framework 4.8
start /w ndp48-x86-x64-allos-enu.exe /passive /norestart
echo Russian Language Pack
start /w ndp48-x86-x64-allos-rus.exe /passive /norestart
echo Rollup updates (Dec 2019)
start /w ndp48-kb4532941-%_arch%.exe /passive /norestart
