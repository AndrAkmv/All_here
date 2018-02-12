@echo off
title Exporting Windows image to another file (optimize)

set _file=install.wim

ver | find "6.1" > nul && exit

:pre_menu
cls
if not exist %_file% exit
dism /English /LogLevel:1 /Get-ImageInfo /ImageFile:%_file%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & exit
set /p _ind=Input index or press [Enter] for quit: || exit
if %_ind% GTR 0 if %_ind% LEQ 24 goto :exp_menu
goto :pre_menu

:exp_menu
cls
dism /English /LogLevel:1 /Get-ImageInfo /ImageFile:%_file% /Index:%_ind%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & goto :pre_menu
choice /c ew /n /m "Export selected image to .esd [e] or to .wim [w]? "
if %ERRORLEVEL% EQU 1 goto :recovery
goto :maximum

:recovery
cls
if exist install%_num%.esd set /a _num+=1 & goto :recovery
dism /English /LogLevel:1 /Export-Image /SourceImageFile:%_file% /SourceIndex:%_ind% /DestinationImageFile:install%_num%.esd /Compress:recovery
goto :pre_menu

:maximum
cls
if exist install%_num%.wim set /a _num+=1 & goto :maximum
dism /English /LogLevel:1 /Export-Image /SourceImageFile:%_file% /SourceIndex:%_ind% /DestinationImageFile:install%_num%.wim /Compress:maximum
goto :pre_menu
