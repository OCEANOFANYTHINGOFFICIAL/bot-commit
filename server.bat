@echo off
set loop=0

git add .
git commit -m "update"
:loop
set datetimef=%date:~0,2%%date:~3,2%%date:~-4%%time:~0,2%%time:~3,2%%time:~6,2%%random%

%datetimef% > data.txt
git add data.txt
git commit -m "%datetimef%"

set /a loop=%loop%+1 
if "%loop%"=="500" goto finish
goto loop

:finish
echo It's Done