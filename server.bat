@echo off
set loop=0
set maxLoop = 10

git add . > nul
git commit -m "update" > nul
:loop
set datetimef=%date:~0,2%_%date:~3,2%_%date:~-4%__%time:~0,2%_%time:~3,2%_%time:~6,2%__%random%
set datetimef=%datetimef: =%
echo %datetimef% > data.txt > nul
git add data.txt >nul
git commit -m %datetimef% > nul
set /a loop=%loop%+1 
echo [%loop%] Commit Created At: %datetimef%
if "%loop%"==%maxLoop% goto commit
goto loop

:commit
echo Commiting All Changes...
git push -u origin main >nul
echo x=msgbox("Succesfully Commited %maxLoop% Contributes !!!",, "Success !!!") > success.vbs > nul
cscript //Nologo success.vbs > nul
echo .
echo .
echo Press Any Key To Exit...
pause >nul