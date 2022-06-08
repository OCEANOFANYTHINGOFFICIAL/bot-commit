@echo off
set loop=0

git add .
git commit -m "update"
:loop
set datetimef=%date:~0,2%_%date:~3,2%_%date:~-4%__%time:~0,2%_%time:~3,2%_%time:~6,2%__%random%
set datetimef=%datetimef: =%
echo %datetimef% > data.txt >nul
git add data.txt >nul
git commit -m %datetimef% >nul
set /a loop=%loop%+1 
echo [%loop%] Commit Created At: %datetimef%
if "%loop%"=="10" goto finish
goto loop

:finish
git push -u origin main
echo It's Done