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
rem ADs
:: echo Adblock Plus
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\cfhdojbkjhnklbpkdaibdccddilifddb /v update_url /d https://clients2.google.com/service/update2/crx /f > nul
echo uBlock Origin
reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\cjpalhdlnbpafiamejdnhcphjbkeiagm /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

rem Context
echo Selection Search
reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\gipnlpdeieaidmmeaichnddnmjmcakoe /v update_url /d https://clients2.google.com/service/update2/crx /f > nul
:: echo Simple = Select + Search
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\aagminaekdpcfimcbhknlgjmpnnnmooo /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

rem Dislike
echo Return YouTube Dislike
reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\gebbhagfogifgggkldgodflihgfeippi /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

rem Eyes
echo Dark Reader
reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\eimadpbcbfnmbkopoojfekhnkhdbieeh /v update_url /d https://clients2.google.com/service/update2/crx /f > nul
:: echo Night Reader
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\hmafjphdklmdjfcnljjeonfpgafanjjc /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

rem Lang
echo Google Translate
reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\aapbdbdomjkkjkaonfhkkikfgjllcleb /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

rem Mouse
echo CrxMouse Chrome Gestures
reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\jlgkpaicikihijadgifklkbpdajbkhjo /v update_url /d https://clients2.google.com/service/update2/crx /f > nul
:: echo smartUp Gestures
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\bgjfekefhjemchdeigphccilhncnjldn /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

rem Similar
echo SimilarSites
reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\necpbmbhhdiplmfhmjicabdeighkndkn /v update_url /d https://clients2.google.com/service/update2/crx /f > nul
:: echo SimilarWeb
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\hoklmmgfnpapgjgcpechhaamimifchmp /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

rem Tabs
echo Prevent Duplicate Tabs
reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\eednccpckdkpojaiemedoejdngappaag /v update_url /d https://clients2.google.com/service/update2/crx /f > nul
echo Tab Activate
reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\jlmadbnpnnolpaljadgakjilggigioaj /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

rem VPN
echo Brisk VPN
reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\ciifcakemmcbbdpmljdohdmbodagmela /v update_url /d https://clients2.google.com/service/update2/crx /f > nul
:: echo Browsec VPN
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\omghfjlpggmjjaagoclmmobgdodcjboh /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

rem Window
echo Material Dark
reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\npadhaijchjemiifipabpmeebeelbmpd /v update_url /d https://clients2.google.com/service/update2/crx /f > nul
:: echo pro grey
:: reg add HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions\enhpebdanojkmhbbneclbkmpleemilaj /v update_url /d https://clients2.google.com/service/update2/crx /f > nul

timeout 3 > nul
exit

:del
reg delete HKLM\SOFTWARE%_arch%\Google\Chrome\Extensions /f > nul
