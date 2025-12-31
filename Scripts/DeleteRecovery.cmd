@echo off
title Deleting Recovery Environment from Windows image

set _file=install.wim
set _mnt=mount
set _word=Wim

dism /English /LogLevel:1 /Get-Help | find "Version: 6.1" > nul || set _word=Image

if not exist %_file% reagentc /disable & goto :delete
dism /English /LogLevel:1 /Get-%_word%Info /%_word%File:%_file%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & exit
set /p _ind=Input index or press [Enter] for quit: || exit

cls
dism /English /LogLevel:1 /Get-%_word%Info /%_word%File:%_file% /Index:%_ind%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & exit
choice /c abcdefghijklmnopqrstuvwxyz /n /m "Mount selected image? [m] "
if %ERRORLEVEL% NEQ 13 exit

cls
md %_mnt%
dism /English /LogLevel:1 /Mount-%_word% /%_word%File:%_file% /Index:%_ind% /MountDir:%_mnt%
if %ERRORLEVEL% NEQ 0 rd %_mnt% & pause & exit

:delete
if not exist %_file% set _mnt=%SYSTEMDRIVE%
del %_mnt%\Windows\System32\Recovery\Winre.wim
timeout 3 > nul

cls
if not exist %_file% exit
dism /English /LogLevel:1 /Unmount-%_word% /MountDir:%_mnt% /Commit
if %ERRORLEVEL% NEQ 0 pause
rd %_mnt%
