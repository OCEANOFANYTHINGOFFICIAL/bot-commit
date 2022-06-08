@echo off
set loop=0

git add .
git commit -m "update"
:loop
set datetimef=%date:~0,2%_%date:~3,2%_%date:~-4%__%time:~0,2%_%time:~3,2%_%time:~6,2%__%random%
set datetimef=%datetimef: =%
echo %datetimef% > data.txt
git add data.txt
git commit -m %datetimef%

set /a loop=%loop%+1 
if "%loop%"=="500" goto finish
goto loop

:finish
echo It's Done