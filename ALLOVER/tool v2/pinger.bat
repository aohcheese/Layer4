@echo off
color 08
title (MADE BY @your_offline)
cls
echo               ...
echo             ;::::;
echo           ;::::; :;
echo         ;:::::'   :;
echo        ;:::::;     ;.
echo       ,:::::'       ;           OOO\
echo       ::::::;       ;          OOOOO\
echo       ;:::::;       ;         OOOOOOOO
echo      ,;::::::;     ;'         / OOOOOOO
echo    ;:::::::::`. ,,,;.        /  / DOOOOOO
echo  .';:::::::::::::::::;,     /  /     DOOOO
echo ,::::::;::::::;;;;::::;,   /  /        DOOO
echo;`::::::`'::::::;;;::::: ,#/  /          DOOO
echo:`:::::::`;::::::;;::: ;::#  /            DOOO
echo::`:::::::`;:::::::: ;::::# /              DOO
echo :`:::::::`;:::::: ;::::::#/               DOO
echo :::`:::::::`;; ;:::::::::##                OO
echo ::::`:::::::`;::::::::;:::#                OO
echo `:::::`::::::::::::;'`:;::#                O
echo  `:::::`::::::::;' /  / `:#
echo   ::::::`:::::;'  /  /   `#
echo ----------------------------------------------
@echo off 
color 10
:reboot
echo off
color 08
set /p IP=ENTER SKIDS IP:
:top
PING  -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 echo ungv SLAMED %IP% 
color 08
ping -t 2 0 1 127.0.0.1 >nul
color 03
ping -t 2 0 1 127.0.0.1 >nul
color 07
ping -t 2 0 1 127.0.0.1 >nul
color 02
ping -t 2 0 1 127.0.0.1 >nul
color 03
ping -t 2 0 1 127.0.0.1 >nul
color 07 
ping -t 2 0 1 127.0.0.1 >nul
color 02
GoTo top

