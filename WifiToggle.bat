@echo off

goto check_Permissions

:check_Permissions
echo Administrative permissions required. Detecting permissions...

net session >nul 2>&1
if %errorLevel% == 0 (
    goto before
) else (
    cls
    echo Failure: You MUST run this as administator, otherwise netsh will fail. 
)

pause >nul

:before
cls
echo.
echo ----------------------------------------------------------------
echo            Toggles your wifi connection immediantly.
echo                     Must run as administator.
echo ----------------------------------------------------------------
echo                      Press [Y] to turn on.
echo                      Press [U] to turn off.
echo ----------------------------------------------------------------
choice /c YU
if %errorlevel%==1 goto enable
if %errorlevel%==2 goto disable

:enable
netsh interface set interface Wi-Fi enable
goto after1


:disable
netsh interface set interface Wi-Fi disable
goto after2

:after1
cls
echo.
echo ----------------------------------------------------------------
echo                          Wifi Enabled!
echo ----------------------------------------------------------------
echo            Toggles your wifi connection immediantly.
echo                     Must run as administator.
echo ----------------------------------------------------------------
echo                      Press [Y] to turn on.
echo                      Press [U] to turn off.
echo ----------------------------------------------------------------
choice /c YU
if %errorlevel%==1 goto enable
if %errorlevel%==2 goto disable


:after2
cls
echo.
echo ----------------------------------------------------------------
echo                          Wifi Disabled!
echo ----------------------------------------------------------------
echo            Toggles your wifi connection immediantly.
echo                     Must run as administator.
echo ----------------------------------------------------------------
echo                      Press [Y] to turn on.
echo                      Press [U] to turn off.
echo ----------------------------------------------------------------
choice /c YU
if %errorlevel%==1 goto enable
if %errorlevel%==2 goto disable