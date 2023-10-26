@echo off

echo.
echo ----------------------------------------------
echo          Loading ALL device information...
echo ----------------------------------------------
echo =============================================
echo ----------------------------------------------
echo          This can take 1-2 minutes
echo ----------------------------------------------
echo.
pause
REM OS Details
systeminfo | findstr /B /C:"OS Name" /C:"OS Version"
echo loading...
REM PC Name
echo PC Name: %COMPUTERNAME%
echo loading...
REM Processor Info
wmic cpu get Name
echo loading...
REM Disk Info
wmic diskdrive get Model
echo loading...
REM GPU Info
wmic path win32_VideoController get Name
echo loading...
REM Network Info
ipconfig /all
echo loading...
REM USB Slots
wmic path win32_USBControllerDevice get Dependent
echo loading...
REM Audio Inputs
wmic sounddev get Caption
echo loading...
REM Audio Outputs
wmic path win32_SoundDevice get Caption
echo loading...
REM Installed Software Info
wmic product get Name, Version
echo loading...
REM First Time the OS Turned On
systeminfo | findstr /B /C:"System Boot Time"
echo loading...
REM Last Time the OS Turned On
wmic os get LastBootUpTime
echo loading...
REM Current Time
echo Current Time: %time%

pause
exit
