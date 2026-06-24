@echo off
title Kiem tra nhan IP tu DHCP Server
echo ===================================================
echo         KIEM TRA TRANG THAI NHAN IP TU DHCP
echo ===================================================
echo.

echo [1] Dang thuc hien lam moi (Renew) lai IP tu DHCP...
ipconfig /renew
echo.

echo [2] Thong tin chi tiet card mang sau khi nhan:
ipconfig /all | findstr /I "IPv4 Subnet Gateway DHCP.Server DNS.Servers"
echo.

echo ===================================================
pause