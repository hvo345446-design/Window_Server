@echo off
title Kiem tra trang thai Web Server IIS
echo ===================================================
echo           KIEM TRA TRANG THAI IIS SERVER
echo ===================================================
echo.

echo [1] Kiem tra dich vu World Wide Web Publishing Service...
sc query w3svc | findstr STATE
echo.

echo [2] Kiem tra cac Port dang lang nghe (Listening)...
:: Port 80 cho HTTP và 443 cho HTTPS
netstat -an | findstr ":80 :443"
echo.

echo [3] Thu ket noi den trang Web Local (localhost)...
powershell -Command "Invoke-WebRequest -Uri http://localhost -UserAgent 'Wget' | Select-Object StatusCode, StatusDescription"
echo.

echo ===================================================
pause