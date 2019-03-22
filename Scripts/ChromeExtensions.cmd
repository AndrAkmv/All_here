@echo off
title Managing Google Chrome extensions

set _arch=\Wow6432Node
if %PROCESSOR_ARCHITECTURE%==x86 if not defined PROCESSOR_ARCHITEW6432 set _arch=""

:menu
choice /c abcdefghijklmnopqrstuvwxyz /n /m "Add [a] or Delete [d] Chrome extension pack?"
if %ERRORLEVEL% EQU 1 goto :add
if %ERRORLEVEL% EQU 4 goto :del
exit

:add
cls
:: echo Google Translate
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\aapbdbdomjkkjkaonfhkkikfgjllcleb /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

rem ADs
:: echo Adblock Plus
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\cfhdojbkjhnklbpkdaibdccddilifddb /v update_url /d https://clients2.google.com/service/update2/crx /f > nul
echo uBlock Origin
reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\cjpalhdlnbpafiamejdnhcphjbkeiagm /v update_url /d https://clients2.google.com/service/update2/crx /f > nul
:: echo AdGuard
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\bgnkhhnnamicmpeenaelnjfhikgbkllg /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

rem Eyes
:: echo Dark Reader
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\eimadpbcbfnmbkopoojfekhnkhdbieeh /v update_url /d https://clients2.google.com/service/update2/crx /f > nul
:: echo Night Reader
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\hmafjphdklmdjfcnljjeonfpgafanjjc /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

rem Theme
:: echo Material Dark
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\npadhaijchjemiifipabpmeebeelbmpd /v update_url /d https://clients2.google.com/service/update2/crx /f > nul
:: echo pro grey
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\enhpebdanojkmhbbneclbkmpleemilaj /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

rem Mouse
:: echo CrxMouse Chrome Gestures
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\jlgkpaicikihijadgifklkbpdajbkhjo /v update_url /d https://clients2.google.com/service/update2/crx /f > nul
:: echo Simple Mouse Gestures
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\cpbbhbiceidealbcfgodcffnfneffopd /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

rem SEO
:: echo SimilarWeb
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\hoklmmgfnpapgjgcpechhaamimifchmp /v update_url /d https://clients2.google.com/service/update2/crx /f > nul
:: echo SimilarSites
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\necpbmbhhdiplmfhmjicabdeighkndkn /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

rem VPN
:: echo Fast Proxy
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\mkelkmkgljeohnaeehnnkmdpocfmkmmf /v update_url /d https://clients2.google.com/service/update2/crx /f > nul
:: echo UnBlock VK
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\acjkjigmbpdbehmojceoibdegihpgole /v update_url /d https://clients2.google.com/service/update2/crx /f > nul
echo Yandex Access
reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\oakfpjifgmfpainopanfgfckhkcfgacb /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

echo Tab Activate
reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\jlmadbnpnnolpaljadgakjilggigioaj /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

rem Find
:: echo Selection Search
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\gipnlpdeieaidmmeaichnddnmjmcakoe /v update_url /d https://clients2.google.com/service/update2/crx /f > nul
:: echo Selection Context Search
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\kplgehmegmjifbhioeldcnphfkcfckjj /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

rem Tabs
:: echo Duplicate Tab Helper
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\oaceoebbkmkgfjhmngdinoclnionlgoh /v update_url /d https://clients2.google.com/service/update2/crx /f > nul
:: echo No Dupe Tabs
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\fajkhkmabkgflclnlmfdafpikejjncca /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

timeout 3 > nul
exit

:del
reg delete HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions /f > nul
