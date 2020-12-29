@echo off

SET PDK_PATH=%~dp0
SET PDK_PATH=%PDK_PATH:\bin\=%
SET JAVA_HOME=%PDK_PATH%\lib\adaptopenjdk
SET SAXON_HOME=%PDK_PATH%\lib\saxon

"%PDK_PATH%\lib\jruby\bin\jruby.exe" "%PDK_PATH%\lib\jruby\bin\pdk" %*