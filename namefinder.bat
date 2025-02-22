@echo off
setlocal enabledelayedexpansion

set "outputFile=%USERPROFILE%\Desktop\car_models.txt"
if exist "%outputFile%" del "%outputFile%"

for /r %%d in (*) do (
    if /I "%%~nxd"=="vehicles.meta" (
        for /f "tokens=2 delims=>" %%a in ('findstr /i "<modelName>" "%%d"') do (
            for /f "tokens=1 delims=<" %%b in ("%%a") do (
                echo %%b >> "%outputFile%"
            )
        )
    )
)

echo Fertig! Ergebnisse in %outputFile%
endlocal
