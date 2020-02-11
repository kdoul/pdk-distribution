@echo off

SET PDK_PATH=%~dp0
SET PDK_PATH=%PDK_PATH:\bin\=%

SET COMMAND=%1

REM https://stackoverflow.com/a/935681
shift
set params=%1
:loop
shift
if [%1]==[] goto afterloop
set params=%params% %1
goto loop
:afterloop

"%PDK_PATH%\lib\jruby\bin\%COMMAND%" %RESTVAR%
