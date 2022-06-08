@echo off
set loop=0

git add . > nul
git commit -m "update" > nul
:loop
set datetimef=%date:~0,2%_%date:~3,2%_%date:~-4%__%time:~0,2%_%time:~3,2%_%time:~6,2%__%random%%random%+%random%
set datetimef=%datetimef: =%
echo %datetimef% > data.txt > nul
git add data.txt >nul
git commit -m %datetimef% > nul
set /a loop=%loop%+1 
echo [%loop%] Commit Created At: %datetimef%
if "%loop%"=="10" goto final
goto loop

:final
echo Pushing All Changes...
git push -u origin main >nul
echo.
echo.
echo Done.
echo.
echo.
echo Press Any Key To Exit...
pause >nul