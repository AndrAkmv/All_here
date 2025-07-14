@echo off
setlocal enabledelayedexpansion

for %%F in ("%cd%") do set "root_folder=%%~nxF"
set "output_file=%cd%\%root_folder%.txt"
type nul > "%output_file%"
dir /b /a-d | findstr /v /c:"%~nx0" /c:"%root_folder%.txt" >> "%output_file%" && echo. >> "%output_file%"

for /d /r %%D in (*) do (
set "full_path=%%D"
set "relative_path=!full_path:%cd%\=!"
pushd "%%D"
dir /b /a-d >nul 2>nul && echo [!relative_path!] >> "%output_file%" && dir /b /a-d >> "%output_file%" && echo. >> "%output_file%"
popd
)
