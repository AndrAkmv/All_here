@echo off
title Getting information from Windows image

set _file=install.wim
set _img=Online
set _mnt=mount
set _word=Wim

dism /English /LogLevel:1 /Get-Help | find "Version: 6.1" > nul || set _word=Image

if not exist %_file% goto :adv_menu
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
dism /English /LogLevel:1 /Mount-%_word% /%_word%File:%_file% /Index:%_ind% /MountDir:%_mnt% /ReadOnly
if %ERRORLEVEL% NEQ 0 rd %_mnt% & pause & exit
set _img=Image:%_mnt%

:adv_menu
cls
if %_img%==Online (echo DISM: Online Servicing)^
else (dism /English /LogLevel:1 /Get-Mounted%_word%Info)
echo -------------------------------------------------------------------------------
echo ~~~~Menu~~~~
echo [e] editions
echo [l] languages
echo [d] drivers ([D] - export)
echo [p] packages ([P] - export)
echo [f] features ([F] - export)
if %_word%==Image echo [c] capabils ([C] - export)
if %_word%==Image echo [s] associat ([S] - export)
if %_word%==Image echo [x] appxes ([X] - export)
echo [q] quit (unmount)
echo -------------------------------------------------------------------------------
choice /c eldDpPfFcCsSxXq /n /cs /m "Your choice: "
if %ERRORLEVEL% EQU 1 goto :editions
if %ERRORLEVEL% EQU 2 goto :languages
if %ERRORLEVEL% EQU 3 goto :drivers
if %ERRORLEVEL% EQU 4 goto :drivers-export
if %ERRORLEVEL% EQU 5 goto :packages
if %ERRORLEVEL% EQU 6 goto :packages-export
if %ERRORLEVEL% EQU 7 goto :features
if %ERRORLEVEL% EQU 8 goto :features-export
if %ERRORLEVEL% EQU 9 if %_word%==Image (goto :capabils) else (goto :adv_menu)
if %ERRORLEVEL% EQU 10 if %_word%==Image (goto :capabils-export) else (goto :adv_menu)
if %ERRORLEVEL% EQU 11 if %_word%==Image (goto :associat) else (goto :adv_menu)
if %ERRORLEVEL% EQU 12 if %_word%==Image (goto :associat-export) else (goto :adv_menu)
if %ERRORLEVEL% EQU 13 if %_word%==Image (goto :appxes) else (goto :adv_menu)
if %ERRORLEVEL% EQU 14 if %_word%==Image (goto :appxes-export) else (goto :adv_menu)
goto :unmount

:editions
cls
dism /%_img% /English /LogLevel:1 /Get-CurrentEdition
echo -------------------------------------------------------------------------------
dism /%_img% /English /LogLevel:1 /Get-TargetEditions
echo -------------------------------------------------------------------------------
choice /c b /n /m "Back [b] "
goto :adv_menu

:languages
cls
dism /%_img% /English /LogLevel:1 /Get-Intl
echo -------------------------------------------------------------------------------
choice /c b /n /m "Back [b] "
goto :adv_menu

:drivers
cls
dism /%_img% /English /LogLevel:1 /Get-Drivers /All | more
echo -------------------------------------------------------------------------------
choice /c b /n /m "Back [b] "
goto :adv_menu

:drivers-export
cls
if exist drivers%_numd%.txt set /a _numd+=1 & goto :drivers-export
echo Getting list of drivers. Please wait...
dism /%_img% /English /LogLevel:1 /Get-Drivers /All /Format:Table > drivers%_numd%.txt
goto :adv_menu

:packages
cls
dism /%_img% /English /LogLevel:1 /Get-Packages | more
echo -------------------------------------------------------------------------------
choice /c b /n /m "Back [b] "
goto :adv_menu

:packages-export
cls
if exist packages%_nump%.txt set /a _nump+=1 & goto :packages-export
echo Getting list of packages. Please wait...
dism /%_img% /English /LogLevel:1 /Get-Packages /Format:Table > packages%_nump%.txt
goto :adv_menu

:features
cls
dism /%_img% /English /LogLevel:1 /Get-Features | more
echo -------------------------------------------------------------------------------
choice /c b /n /m "Back [b] "
goto :adv_menu

:features-export
cls
if exist features%_numf%.txt set /a _numf+=1 & goto :features-export
echo Getting list of features. Please wait...
dism /%_img% /English /LogLevel:1 /Get-Features /Format:Table > features%_numf%.txt
goto :adv_menu

:capabils
cls
dism /%_img% /English /LogLevel:1 /Get-Capabilities /LimitAccess | more
echo -------------------------------------------------------------------------------
choice /c b /n /m "Back [b] "
goto :adv_menu

:capabils-export
cls
if exist capabils%_numc%.txt set /a _numc+=1 & goto :capabils-export
echo Getting list of capabils. Please wait...
dism /%_img% /English /LogLevel:1 /Get-Capabilities /LimitAccess /Format:Table > capabils%_numc%.txt
goto :adv_menu

:associat
cls
dism /%_img% /English /LogLevel:1 /Get-DefaultAppAssociations | more
echo -------------------------------------------------------------------------------
choice /c b /n /m "Back [b] "
goto :adv_menu

:associat-export
cls
if exist associat%_nums%.txt set /a _nums+=1 & goto :associat-export
echo Getting list of associat. Please wait...
dism /%_img% /English /LogLevel:1 /Get-DefaultAppAssociations > associat%_nums%.txt
goto :adv_menu

:appxes
cls
dism /%_img% /English /LogLevel:1 /Get-ProvisionedAppxPackages | more
echo -------------------------------------------------------------------------------
choice /c b /n /m "Back [b] "
goto :adv_menu

:appxes-export
cls
if exist appxes%_numx%.txt set /a _numx+=1 & goto :appxes-export
echo Getting list of appxes. Please wait...
dism /%_img% /English /LogLevel:1 /Get-ProvisionedAppxPackages > appxes%_numx%.txt
goto :adv_menu

:unmount
cls
if not exist %_file% exit
dism /English /LogLevel:1 /Unmount-%_word% /MountDir:%_mnt% /Discard
if %ERRORLEVEL% NEQ 0 pause
rd %_mnt%
