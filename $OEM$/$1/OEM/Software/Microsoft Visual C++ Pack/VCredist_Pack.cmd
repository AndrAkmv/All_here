@echo off

set _arch=x64
if %PROCESSOR_ARCHITECTURE%==x86 if not defined PROCESSOR_ARCHITEW6432 set _arch=x86

echo Microsoft Visual C++ Redistributable Packages
echo -------------------------------------------------------------------------------
echo Microsoft Visual C++ 2005 Redistributable x86
start /w vcredist_x86_2005.exe /q
if %_arch%==x64 (
echo Microsoft Visual C++ 2005 Redistributable x64
start /w vcredist_x64_2005.exe /q
)
echo Microsoft Visual C++ 2008 Redistributable x86
start /w vcredist_x86_2008.exe /q
if %_arch%==x64 (
echo Microsoft Visual C++ 2008 Redistributable x64
start /w vcredist_x64_2008.exe /q
)
echo Microsoft Visual C++ 2010 Redistributable x86
start /w vcredist_x86_2010.exe /q
if %_arch%==x64 (
echo Microsoft Visual C++ 2010 Redistributable x64
start /w vcredist_x64_2010.exe /q
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
echo Microsoft Visual C++ 2017 Redistributable x86
start /w vcredist_x86_2017.exe /q
if %_arch%==x64 (
echo Microsoft Visual C++ 2017 Redistributable x64
start /w vcredist_x64_2017.exe /q
)
echo Visual Studio 2010 Tools for Office Runtime
start /w vstor_redist.exe /q
