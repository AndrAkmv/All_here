@echo off
setlocal enabledelayedexpansion

ver | find "10" > nul && set _win10=Y
ver > nul

for /f "Tokens=2 Delims==" %%i in ('wmic LogicalDisk where "DriveType=3" get Name /Format:Value') do call :syst %%i || goto :next

:syst
if %1 NEQ %SYSTEMDRIVE% set "_disk=%1" & exit /b 1
exit /b

:next
chcp 1251 > nul
net user Пользователь /add /passwordreq:no 1> nul 2> nul

if %ERRORLEVEL% EQU 0 (
wmic useraccount set passwordexpires=false /nointeractive > nul
chcp 866 > nul

for /f  "Skip=2 Tokens=3*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video"') do set _src=%%j
if "!_src!" NEQ "%_disk%\%USERNAME%\Videos" (
call :lxc "!_src!" "%_disk%\%USERNAME%\Videos"
md "%_disk%\%USERNAME%\Videos" 2> nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Video" /t REG_SZ /d "%_disk%\%USERNAME%\Videos" /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video" /t REG_EXPAND_SZ /d "%_disk%\%USERNAME%\Videos" /f > nul
if defined _win10 reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {35286a68-3c57-41a1-bbb1-0eae73d76c95} ^
/t REG_EXPAND_SZ /d "%_disk%\%USERNAME%\Videos" /f > nul
call :lrd "!_src!"
)

for /f  "Skip=2 Tokens=3*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures"') do set _src=%%j
if "!_src!" NEQ "%_disk%\%USERNAME%\Pictures" (
call :lxc "!_src!" "%_disk%\%USERNAME%\Pictures"
md "%_disk%\%USERNAME%\Pictures" 2> nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Pictures" /t REG_SZ /d "%_disk%\%USERNAME%\Pictures" /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /t REG_EXPAND_SZ /d "%_disk%\%USERNAME%\Pictures" /f > nul
if defined _win10 reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {0DDD015D-B06C-45D5-8C4C-F59713854639} ^
/t REG_EXPAND_SZ /d "%_disk%\%USERNAME%\Pictures" /f > nul
call :lrd "!_src!"
)

for /f  "Skip=2 Tokens=3*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music"') do set _src=%%j
if "!_src!" NEQ "%_disk%\%USERNAME%\Music" (
call :lxc "!_src!" "%_disk%\%USERNAME%\Music"
md "%_disk%\%USERNAME%\Music" 2> nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Music" /t REG_SZ /d "%_disk%\%USERNAME%\Music" /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /t REG_EXPAND_SZ /d "%_disk%\%USERNAME%\Music" /f > nul
if defined _win10 reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {A0C69A99-21C8-4671-8703-7934162FCF1D} ^
/t REG_EXPAND_SZ /d "%_disk%\%USERNAME%\Music" /f > nul
call :lrd "!_src!"
)

for /f  "Skip=2 Tokens=2*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" ^
/v {374DE290-123F-4565-9164-39C4925E467B}') do set _src=%%j
if "!_src!" NEQ "%_disk%\%USERNAME%\Downloads" (
call :lxc "!_src!" "%_disk%\%USERNAME%\Downloads"
md "%_disk%\%USERNAME%\Downloads" 2> nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v {374DE290-123F-4565-9164-39C4925E467B} ^
/t REG_SZ /d "%_disk%\%USERNAME%\Downloads" /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {374DE290-123F-4565-9164-39C4925E467B} ^
/t REG_EXPAND_SZ /d "%_disk%\%USERNAME%\Downloads" /f > nul
if defined _win10 reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {7D83EE9B-2244-4E70-B1F5-5393042AF1E4} ^
/t REG_EXPAND_SZ /d "%_disk%\%USERNAME%\Downloads" /f > nul
call :lrd "!_src!"
)

for /f  "Skip=2 Tokens=2*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Personal') do set _src=%%j
if "!_src!" NEQ "%_disk%\%USERNAME%\Documents" (
call :lxc "!_src!" "%_disk%\%USERNAME%\Documents"
md "%_disk%\%USERNAME%\Documents" 2> nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Personal /t REG_SZ /d "%_disk%\%USERNAME%\Documents" /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Personal /t REG_EXPAND_SZ /d "%_disk%\%USERNAME%\Documents" /f > nul
if defined _win10 reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {F42EE2D3-909F-4907-8871-4C22FC0BF756} ^
/t REG_EXPAND_SZ /d "%_disk%\%USERNAME%\Documents" /f > nul
call :lrd "!_src!"
)

for /f  "Skip=2 Tokens=2*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop') do set _src=%%j
if "!_src!" NEQ "%_disk%\%USERNAME%\Desktop" (
call :lxc "!_src!" "%_disk%\%USERNAME%\Desktop"
md "%_disk%\%USERNAME%\Desktop" 2> nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Desktop /t REG_SZ /d "%_disk%\%USERNAME%\Desktop" /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop /t REG_EXPAND_SZ /d "%_disk%\%USERNAME%\Desktop" /f > nul
call :lrd "!_src!"
)

icacls %USERPROFILE% /save %TEMP%\aclfile > nul
icacls %_disk%\ /restore %TEMP%\aclfile > nul
del %TEMP%\aclfile
echo Created

) else (

net user Пользователь /delete > nul
if %ERRORLEVEL% EQU 0 rd /s /q %SYSTEMDRIVE%\Users\Пользователь 2> nul
chcp 866 > nul
echo Deleted
)

timeout 3 > nul
exit

:lxc
xcopy %1 %2 /s /i /q /h /k /y 2> nul
exit /b

:lrd
rd /s /q %1 2> nul
exit /b
