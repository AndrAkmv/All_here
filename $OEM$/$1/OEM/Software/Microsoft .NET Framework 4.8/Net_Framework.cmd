@echo off

ver | find "6.1" > nul || goto exit

echo Microsoft .NET Framework Russian
echo -------------------------------------------------------------------------------
echo .NET Framework 4.8
ndp48-x86-x64-allos-enu.exe /passive /norestart
echo Russian Language Pack
ndp48-x86-x64-allos-rus.exe /passive /norestart
echo Rollup updates (Dec 2019)
ndp48-kb4532941-x64.exe /passive /norestart
