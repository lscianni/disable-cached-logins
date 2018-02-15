@ECHO off
SETLOCAL
:: 2018-02-15
:: Louis Scianni
::Must be ran as Administrator::

::Globals
set KEY="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
set VALUE=CachedLogonsCount
set VALUE_DATA = 0

:main
for /f "tokens=3" %%i in ('reg QUERY %KEY% /v %VALUE%') do set CURRENT_DATA=%%i
echo %CURRENT_DATA%
:: add /f to force overwrite of CachedLogonsCount after testing
IF NOT %CURRENT_DATA% == %VALUE_DATA%  regedit add %KEY% /v %VALUE% /t REG_SZ /d %VALUE_DATA%
IF %CURRENT_DATA% == %VALUE_DATA% echo "CachedLogonsCount already set to '0'... Exiting" 



:EOF

