@echo off
title Splitting Windows image into parts for FAT32

set _file=install.wim

dism /English /LogLevel:1 /Get-Help | find "Version: 6.1" > nul && exit

if not exist %_file% exit
dism /English /LogLevel:1 /Get-ImageInfo /ImageFile:%_file%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & exit
choice /c abcdefghijklmnopqrstuvwxyz /n /m "Split image into parts? [s] "
if %ERRORLEVEL% NEQ 19 exit

cls
dism /English /LogLevel:1 /Split-Image /ImageFile:%_file% /SWMFile:install.swm /FileSize:4090
if %ERRORLEVEL% NEQ 0 pause
