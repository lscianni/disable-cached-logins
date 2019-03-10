@ECHO off
SETLOCAL
:: 2018-02-15
::Must be ran as Administrator::
::
:: ---------------------------------------------------------------------------
::Copyright (c) 2019, Louis Scianni
::All rights reserved.
::
::Redistribution and use in source and binary forms, with or without
::modification, are permitted provided that the following conditions are met:
::
::1. Redistributions of source code must retain the above copyright notice, this
::   list of conditions and the following disclaimer.
::2. Redistributions in binary form must reproduce the above copyright notice,
::   this list of conditions and the following disclaimer in the documentation
::   and/or other materials provided with the distribution.
::
::THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
::AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
::IMPLIEDWARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
::AREDISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
::LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
::CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
::SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
::INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
::CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
::ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF 
::THE POSSIBILITY OF SUCH DAMAGE.
::
::The views and conclusions contained in the software and documentation are 
::those of the authors and should not be interpreted as representing official 
::policies, either expressed or implied, of the <project name> project.
:: ---------------------------------------------------------------------------


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

