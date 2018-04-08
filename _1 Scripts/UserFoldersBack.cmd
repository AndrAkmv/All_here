@echo off

ver | find "10" > nul && set _win10=Y

for /f "Skip=2 Tokens=3*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video"') do set _src=%%j
if "%_src%" NEQ "%USERPROFILE%\Videos" (
call :lxc "%_src%" "%USERPROFILE%\Videos"
md "%USERPROFILE%\Videos" 2> nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Video" /t REG_SZ /d "%USERPROFILE%\Videos" /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Videos" /f > nul
if defined _win10 reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {35286a68-3c57-41a1-bbb1-0eae73d76c95} /f > nul
call :lrd "%_src%"
)

for /f "Skip=2 Tokens=3*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures"') do set _src=%%j
if "%_src%" NEQ "%USERPROFILE%\Pictures" (
call :lxc "%_src%" "%USERPROFILE%\Pictures"
md "%USERPROFILE%\Pictures" 2> nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Pictures" /t REG_SZ /d "%USERPROFILE%\Pictures" /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Pictures" /f > nul
if defined _win10 reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {0DDD015D-B06C-45D5-8C4C-F59713854639} /f > nul
call :lrd "%_src%"
)

for /f "Skip=2 Tokens=3*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music"') do set _src=%%j
if "%_src%" NEQ "%USERPROFILE%\Music" (
call :lxc "%_src%" "%USERPROFILE%\Music"
md "%USERPROFILE%\Music" 2> nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Music" /t REG_SZ /d "%USERPROFILE%\Music" /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Music" /f > nul
if defined _win10 reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {A0C69A99-21C8-4671-8703-7934162FCF1D} /f > nul
call :lrd "%_src%"
)

for /f "Skip=2 Tokens=2*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" ^
/v {374DE290-123F-4565-9164-39C4925E467B}') do set _src=%%j
if "%_src%" NEQ "%USERPROFILE%\Downloads" (
call :lxc "%_src%" "%USERPROFILE%\Downloads"
md "%USERPROFILE%\Downloads" 2> nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v {374DE290-123F-4565-9164-39C4925E467B} /t REG_SZ ^
/d "%USERPROFILE%\Downloads" /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {374DE290-123F-4565-9164-39C4925E467B} /t REG_EXPAND_SZ ^
/d "%%USERPROFILE%%\Downloads" /f > nul
if defined _win10 reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {7D83EE9B-2244-4E70-B1F5-5393042AF1E4} /f > nul
call :lrd "%_src%"
)

for /f "Skip=2 Tokens=2*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Personal') do set _src=%%j
if "%_src%" NEQ "%USERPROFILE%\Documents" (
call :lxc "%_src%" "%USERPROFILE%\Documents"
md "%USERPROFILE%\Documents" 2> nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Personal /t REG_SZ /d "%USERPROFILE%\Documents" /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Personal /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Documents" /f > nul
if defined _win10 reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {F42EE2D3-909F-4907-8871-4C22FC0BF756} /f > nul
call :lrd "%_src%"
)

for /f "Skip=2 Tokens=2*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop') do set _src=%%j
if "%_src%" NEQ "%USERPROFILE%\Desktop" (
call :lxc "%_src%" "%USERPROFILE%\Desktop"
md "%USERPROFILE%\Desktop" 2> nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Desktop /t REG_SZ /d "%USERPROFILE%\Desktop" /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Desktop" /f > nul
call :lrd "%_src%"
)

timeout 3 > nul
exit

:lxc
xcopy %1 %2 /s /i /q /h /k /y 2> nul
exit /b

:lrd
rd /s /q %1 2> nul
exit /b
