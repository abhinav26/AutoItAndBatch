@ECHO OFF
SET prog="notepad.exe"
IF "%1"=="" GOTO starting
SET prog="%1"

:starting
TASKLIST /FI "IMAGENAME eq %prog%" |FIND /i %prog% > nul
IF "%ERRORLEVEL%" == "1" GOTO launch
timeout /t 5
GOTO starting
:launch
start "" %prog%
timeout /t 2
GOTO starting
