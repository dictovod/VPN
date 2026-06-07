@echo off
set /p SEC=Interval (seconds): 
:loop
for /f "tokens=*" %%a in ('curl -s https://api.ipify.org') do set IP=%%a
echo %date% %time% IP: %IP%
timeout /t %SEC% /nobreak >nul
goto loop
