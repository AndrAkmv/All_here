@echo off
title Getting information from Windows image

set _file=install.wim
set _img=Online
set _mnt=mount
set _word=Wim

dism /English /LogLevel:1 /Get-Help | find "Version: 6.1" > nul || set _word=Image

:pre_menu
cls
if not exist %_file% goto :adv_menu
dism /English /LogLevel:1 /Get-%_word%Info /%_word%File:%_file%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & exit
set /p _ind=Input index or press [Enter] for quit: || exit
if %_ind% EQU 0 goto :adv_menu
if %_ind% GTR 0 if %_ind% LEQ 24 goto :ind_menu
goto :pre_menu

:ind_menu
cls
dism /English /LogLevel:1 /Get-%_word%Info /%_word%File:%_file% /Index:%_ind%
echo -------------------------------------------------------------------------------
if %ERRORLEVEL% NEQ 0 pause & goto :pre_menu
choice /c abcdefghijklmnopqrstuvwxyz /n /m "Mount selected image? [m] "
if %ERRORLEVEL% EQU 13 goto :mount
goto :pre_menu

:adv_menu
cls
if %_img%==Online (echo DISM: Online Servicing)^
else (dism /English /LogLevel:1 /Get-Mounted%_word%Info)
echo -------------------------------------------------------------------------------
echo ~~~~Menu~~~~
echo [d] drivers ([D] - export)
echo [p] packages ([P] - export)
echo [f] features ([F] - export)
echo [l] languages
echo [e] editions
echo [a] app
if %_word%==Image echo [x] appx ([X] - export)
if %_word%==Image echo [s] assoc ([S] - export)
echo [q] quit (unmount)
echo -------------------------------------------------------------------------------
choice /c dDpPfFleaxXsSq /n /cs /m "Your choice: "
if %ERRORLEVEL% EQU 1 goto :drivers
if %ERRORLEVEL% EQU 2 goto :drivers-export
if %ERRORLEVEL% EQU 3 goto :packages
if %ERRORLEVEL% EQU 4 goto :packages-export
if %ERRORLEVEL% EQU 5 goto :features
if %ERRORLEVEL% EQU 6 goto :features-export
if %ERRORLEVEL% EQU 7 goto :languages
if %ERRORLEVEL% EQU 8 goto :editions
if %ERRORLEVEL% EQU 9 goto :app
if %ERRORLEVEL% EQU 10 if %_word%==Image (goto :appx) else (goto :adv_menu)
if %ERRORLEVEL% EQU 11 if %_word%==Image (goto :appx-export) else (goto :adv_menu)
if %ERRORLEVEL% EQU 12 if %_word%==Image (goto :assoc) else (goto :adv_menu)
if %ERRORLEVEL% EQU 13 if %_word%==Image (goto :assoc-export) else (goto :adv_menu)
goto :unmount

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

:languages
cls
dism /%_img% /English /LogLevel:1 /Get-Intl
echo -------------------------------------------------------------------------------
choice /c b /n /m "Back [b] "
goto :adv_menu

:editions
cls
dism /%_img% /English /LogLevel:1 /Get-CurrentEdition
echo -------------------------------------------------------------------------------
dism /%_img% /English /LogLevel:1 /Get-TargetEditions
echo -------------------------------------------------------------------------------
choice /c b /n /m "Back [b] "
goto :adv_menu

:app
cls
if %_img%==Online goto :adv_menu
dism /%_img% /English /LogLevel:1 /Get-Apps
echo -------------------------------------------------------------------------------
dism /%_img% /English /LogLevel:1 /Get-AppPatches
echo -------------------------------------------------------------------------------
choice /c b /n /m "Back [b] "
goto :adv_menu

:appx
cls
dism /%_img% /English /LogLevel:1 /Get-ProvisionedAppxPackages | more
echo -------------------------------------------------------------------------------
choice /c b /n /m "Back [b] "
goto :adv_menu

:appx-export
cls
if exist appxes%_numx%.txt set /a _numx+=1 & goto :appx-export
echo Getting list of appx. Please wait...
dism /%_img% /English /LogLevel:1 /Get-ProvisionedAppxPackages > appxes%_numx%.txt
goto :adv_menu

:assoc
cls
dism /%_img% /English /LogLevel:1 /Get-DefaultAppAssociations | more
echo -------------------------------------------------------------------------------
choice /c b /n /m "Back [b] "
goto :adv_menu

:assoc-export
cls
if exist associat%_nums%.txt set /a _nums+=1 & goto :assoc-export
echo Getting list of assoc. Please wait...
dism /%_img% /English /LogLevel:1 /Get-DefaultAppAssociations > associat%_nums%.txt
goto :adv_menu

:mount
cls
md %_mnt%
dism /English /LogLevel:1 /Mount-%_word% /%_word%File:%_file% /Index:%_ind% /MountDir:%_mnt% /ReadOnly
if %ERRORLEVEL% NEQ 0 rd %_mnt% & pause & exit
set _img=Image:%_mnt%
goto :adv_menu

:unmount
cls
if not exist %_file% exit
if not %_img%==Online (
dism /English /LogLevel:1 /Unmount-%_word% /MountDir:%_mnt% /Discard
rd %_mnt%
)
set _img=Online
goto :pre_menu
