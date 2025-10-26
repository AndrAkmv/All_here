@echo off
title Exporting Windows image to another file (optimize)

set _file=install.wim
set _type=maximum
set _ext=wim

dism /English /LogLevel:1 /Get-Help | find "Version: 6.1" > nul && exit

if not exist %_file% exit
dism /English /LogLevel:1 /Get-ImageInfo /ImageFile:%_file%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & exit
set /p _ind=Input index or press [Enter] for quit: || exit

cls
dism /English /LogLevel:1 /Get-ImageInfo /ImageFile:%_file% /Index:%_ind%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & exit
choice /c ew /n /m "Export selected image to .esd [e] or to .wim [w]? "
if %ERRORLEVEL% EQU 1 set _type=recovery & set _ext=esd

:export
cls
if exist install%_num%.wim set /a _num+=1 & goto :export
dism /English /LogLevel:1 /Export-Image /SourceImageFile:%_file% /SourceIndex:%_ind% /DestinationImageFile:install%_num%.%_ext% /Compress:%_type%
if %ERRORLEVEL% NEQ 0 pause
