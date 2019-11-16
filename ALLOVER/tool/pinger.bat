echo pinger tool
title Pinging The Bitch
echo off & cls
color E
set /p IP=Enter IP To Ping:
:top
PING -n 2 %IP% | FIND "TTL="
title :: Pinging: %IP% ::
IF ERRORLEVEL 2 (SET in=04 & echo Client Offline.) 
set /a num=(%Random%%%9)+1
color %num%
ping -t 2 0 10 127.0.0.1 >nul
GoTo top