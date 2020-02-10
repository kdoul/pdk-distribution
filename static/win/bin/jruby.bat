@echo off

SET PDK_PATH=%~dp0
SET PDK_PATH=%PDK_PATH:\bin\=%
SET JAVA_HOME=%PDK_PATH%\lib\corretto

"%PDK_PATH%\lib\jruby\bin\jruby.exe" %*