@echo off
setlocal enabledelayedexpansion

set "outputFile=%USERPROFILE%\Desktop\car_models.txt"
if exist "%outputFile%" del "%outputFile%"

set /a count=0

echo Searching for vehicles...

for /r %%d in (*) do (
    if /I "%%~nxd"=="vehicles.meta" (
        for /f "tokens=2 delims=>" %%a in ('findstr /i "<modelName>" "%%d"') do (
            for /f "tokens=1 delims=<" %%b in ("%%a") do (
                echo %%b >> "%outputFile%"
                set /a count+=1
                echo Vehicles found: !count!
            )
        )
    )
)

echo Done! Total vehicles found: %count%
echo Results saved in %outputFile%
endlocal
