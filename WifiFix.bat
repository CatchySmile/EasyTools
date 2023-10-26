@echo off

goto check_Permissions

:check_Permissions
echo Administrative permissions required. Detecting permissions...

net session >nul 2>&1
if %errorLevel% == 0 (
    goto before
) else (
    cls
    echo Failure: You MUST run this as administator, otherwise commands will fail. 
)

pause >nul

:before
cls
echo.
echo ----------------------------------------------------------------
echo             Requires a current internet connection.
echo                     Must run as administator.
echo ----------------------------------------------------------------
echo                     Press [Y] to begin fix.
echo                       Press [N] to exit.
echo ----------------------------------------------------------------
choice /c YN
if %errorlevel%==1 goto fix
if %errorlevel%==2 goto exit

:fix
cls
echo.
echo ----------------------------------------------------------------
echo                   This can take 1-2 minutes.
echo                       Please let it load.
echo ----------------------------------------------------------------
echo                        Estimated time :
echo                           35 Seconds
echo ----------------------------------------------------------------
echo.
ipconfig /flushdns
echo Loading...
ipconfig /renew
echo Loading...
netsh int ip reset 
echo Loading...
netsh winsock reset
timeout 2 > NUL
cls
echo.
echo ----------------------------------------------------------------
echo                       Successfully fixed! 
echo ----------------------------------------------------------------
echo                     Please restart your pc.
echo                    Press [R] to restart now.
echo ----------------------------------------------------------------
echo.
choice /c RN
if %errorlevel%==1 goto restart
if %errorlevel%==2 goto exit

:restart
cls
echo.
echo Restarting in 5 seconds!
echo.
echo Press [R] to cancel.
shutdown -r -t 5
choice /c R
if %errorlevel%==1 goto exit
if %errorlevel%==2 goto exit

:exit
shutdown -a
exit