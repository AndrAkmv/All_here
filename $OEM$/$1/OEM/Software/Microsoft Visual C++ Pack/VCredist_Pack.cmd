@echo off

set _arch=x64
if %PROCESSOR_ARCHITECTURE%==x86 if not defined PROCESSOR_ARCHITEW6432 set _arch=x86

echo Microsoft Visual C++ Redistributable Packages
echo -------------------------------------------------------------------------------
echo Visual Studio 2010 Tools for Office Runtime
start /w vstor_redist.exe /q
echo Microsoft Visual C++ 2010 Redistributable x86
if %_arch%==x64 (
echo Microsoft Visual C++ 2010 Redistributable x64
)
echo Microsoft Visual C++ 2012 Redistributable x86
start /w vcredist_x86_2012.exe /q
if %_arch%==x64 (
echo Microsoft Visual C++ 2012 Redistributable x64
start /w vcredist_x64_2012.exe /q
)
echo Microsoft Visual C++ 2013 Redistributable x86
start /w vcredist_x86_2013.exe /q
if %_arch%==x64 (
echo Microsoft Visual C++ 2013 Redistributable x64
start /w vcredist_x64_2013.exe /q
)
echo Microsoft Visual C++ 2015-2022 Redistributable x86
start /w vcredist_x86_2015-2022.exe /q
if %_arch%==x64 (
echo Microsoft Visual C++ 2015-2022 Redistributable x64
start /w vcredist_x64_2015-2022.exe /q
)
