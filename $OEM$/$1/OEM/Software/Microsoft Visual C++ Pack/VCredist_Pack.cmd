@echo off

echo Microsoft Visual C++ Redistributable Packages
echo -------------------------------------------------------------------------------
echo Microsoft Visual C++ 2012 Redistributable x86
start /w vcredist_x86_2012.exe /q
echo Microsoft Visual C++ 2012 Redistributable x64
start /w vcredist_x64_2012.exe /q
echo Microsoft Visual C++ 2013 Redistributable x86
start /w vcredist_x86_2013.exe /q
echo Microsoft Visual C++ 2013 Redistributable x64
start /w vcredist_x64_2013.exe /q
ver | find "10" > nul
if %ERRORLEVEL% EQU 0 (
echo Microsoft Visual C++ 2017-2026 Redistributable x86
start /w vcredist_x86_2017-2026.exe /q
echo Microsoft Visual C++ 2017-2026 Redistributable x64
start /w vcredist_x64_2015-2022.exe /q
) else (
echo Microsoft Visual C++ 2015-2022 Redistributable x86
start /w vcredist_x86_2015-2022.exe /q
echo Microsoft Visual C++ 2015-2022 Redistributable x64
start /w vcredist_x64_2015-2022.exe /q
)
