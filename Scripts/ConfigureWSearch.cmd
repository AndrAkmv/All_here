@echo off

ver | find "6.1" > nul || exit

for /f "skip=3 delims=" %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search\CrawlScopeManager\Windows\SystemIndex\WorkingSetRules"') do (
reg query "%%i" /f csc > nul && reg add "%%i" /v Include /t REG_DWORD /d 0 /f)

for /f "skip=3 delims=" %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search\CrawlScopeManager\Windows\SystemIndex\WorkingSetRules"') do (
reg query "%%i" /f iehistory > nul && reg add "%%i" /v Include /t REG_DWORD /d 0 /f)

for /f "skip=3 delims=" %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search\CrawlScopeManager\Windows\SystemIndex\WorkingSetRules"') do (
reg query "%%i" /f visio > nul && reg add "%%i" /v Include /t REG_DWORD /d 0 /f)

for /f "skip=3 delims=" %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search\CrawlScopeManager\Windows\SystemIndex\WorkingSetRules"') do (
reg query "%%i" /f favorites > nul && reg add "%%i" /v Include /t REG_DWORD /d 0 /f)

for /f "delims=" %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search\Gather\Windows\SystemIndex\Sites" ^| find /v "LocalHost"') do (
reg delete "%%i" /f)

for /f "skip=3 delims=" %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search\Gather\Windows\SystemIndex\Sites\LocalHost\Paths"') do (
reg query "%%i" /f visio > nul && reg add "%%i" /v Included /t REG_DWORD /d 0 /f)

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search\Gather\Windows\SystemIndex\StartPages\4" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search\Gather\Windows\SystemIndex\StartPages\3" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search\Gather\Windows\SystemIndex\StartPages\2" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search\Gather\Windows\SystemIndex\StartPages" /v NewStartPageIdentifier /t REG_DWORD /d 2 /f

timeout 3 > nul
