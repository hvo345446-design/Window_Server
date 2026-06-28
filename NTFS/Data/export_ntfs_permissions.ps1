Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "   QUET VA XUAT CHI TIET PHAN QUYEN NTFS TOAN BO" -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host ""

# Ð?i du?ng d?n này thành du?ng d?n d?n thu m?c G?C ch?a d?ng file bài lab c?a b?n
$TargetFolder = "C:\NTFS\Data"

if (Test-Path $TargetFolder) {
    # 1. Xu?t quy?n c?a chính thu m?c g?c
    Write-Host "[+] Quyen tai thu muc goc: $TargetFolder" -ForegroundColor Green
    (Get-Acl $TargetFolder).Access | Select-Object IdentityReference, FileSystemRights, AccessControlType | Format-Table -AutoSize
    Write-Host ("-" * 60) -ForegroundColor Gray

    # 2. T? d?ng quét sâu vào t?t c? các thu m?c con và file bên trong
    $AllItems = Get-ChildItem -Path $TargetFolder -Recurse
    
    foreach ($Item in $AllItems) {
        Write-Host "[>] Dang quet phan quyen cua: $($Item.FullName)" -ForegroundColor Yellow
        (Get-Acl $Item.FullName).Access | Select-Object IdentityReference, FileSystemRights, AccessControlType | Format-Table -AutoSize
        Write-Host ("-" * 60) -ForegroundColor Gray
    }
} else {
    Write-Host "[ERROR] Khong tim thay duong dan: $TargetFolder" -ForegroundColor Red
}

Write-Host "===================================================" -ForegroundColor Cyan
Read-Host "An Enter de thoat..."