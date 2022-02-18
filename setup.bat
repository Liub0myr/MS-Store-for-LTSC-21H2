@echo off
rem https://github.com/Liub0myr/MS-Store-for-LTSC-21H2
title Microsoft Store for LTSC 21H2 by Liub0myr
call :arch
call :install
echo.
echo Everything is done !
pause
exit


:arch
wmic os get Caption | findstr "LTSC" > nul
if not %errorLevel% == 0 (goto no_need)
wmic os get BuildNumber | findstr "19044" > nul
if not %errorLevel% == 0 (goto no_need)
wmic os get osarchitecture | findstr "64-bit" > nul
if %errorLevel% == 0 (set arch=x64) else (set arch=x86)
exit /b



:no_need
echo It looks like you've run the program on a PC that doesn't need this fix
pause
exit



:install
echo Preparing...
powershell Get-AppxPackage > temp.list
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo -------------------------------------------
echo Installing necessary libraries
echo -------------------------------------------

findstr /l /c:"Microsoft.VCLibs.140.00_14.0.30704.0_%arch%__8wekyb3d8bbwe" temp.list > nul
if %errorLevel% == 0 (echo VCLibs already installed and skipped) else powershell Add-AppxPackage Microsoft.VCLibs.140.00_14.0.30704.0_%arch%__8wekyb3d8bbwe.appx

findstr /l /c:"Microsoft.UI.Xaml.2.4_2.42007.9001.0_%arch%__8wekyb3d8bbwe" temp.list > nul
if %errorLevel% == 0 (echo UI.Xaml already installed and skipped) else powershell Add-AppxPackage Microsoft.UI.Xaml.2.4_2.42007.9001.0_%arch%__8wekyb3d8bbwe.appx

findstr /l /c:"Microsoft.NET.Native.Framework.2.2_2.2.29512.0_%arch%__8wekyb3d8bbwe" temp.list > nul
if %errorLevel% == 0 (echo NET.Native.Framework already installed and skipped) else powershell Add-AppxPackage Microsoft.NET.Native.Framework.2.2_2.2.29512.0_%arch%__8wekyb3d8bbwe.appx

findstr /l /c:"Microsoft.NET.Native.Runtime.2.2_2.2.28604.0_%arch%__8wekyb3d8bbwe" temp.list > nul
if %errorLevel% == 0 (echo NET.Native.Runtime already installed and skipped) else powershell Add-AppxPackage Microsoft.NET.Native.Runtime.2.2_2.2.28604.0_%arch%__8wekyb3d8bbwe.appx

findstr /l /c:"Microsoft.VCLibs.140.00.UWPDesktop_14.0.30704.0_%arch%__8wekyb3d8bbwe" temp.list > nul
if %errorLevel% == 0 (echo VCLibs.UWPDesktop already installed and skipped) else powershell Add-AppxPackage Microsoft.VCLibs.140.00.UWPDesktop_14.0.30704.0_%arch%__8wekyb3d8bbwe.appx
echo.
echo Done!
echo.
echo -------------------------------------------
echo Installing Microsoft Store components
echo -------------------------------------------
findstr /l /c:"Microsoft.WindowsStore_12107.1001.15.0_%arch%__8wekyb3d8bbwe" temp.list > nul
if %errorLevel% == 0 (echo WindowsStore already installed and skipped) else powershell Add-AppxPackage Microsoft.WindowsStore_12107.1001.15.0_neutral___8wekyb3d8bbwe.AppxBundle

findstr /l /c:"Microsoft.StorePurchaseApp_12109.1001.10.0_%arch%__8wekyb3d8bbwe" temp.list > nul
if %errorLevel% == 0 (echo StorePurchaseApp already installed and skipped) else powershell Add-AppxPackage Microsoft.StorePurchaseApp_12109.1001.10.0_neutral___8wekyb3d8bbwe.AppxBundle

findstr /l /c:"Microsoft.DesktopAppInstaller_1.11.13404.0_%arch%__8wekyb3d8bbwe" temp.list > nul
if %errorLevel% == 0 (echo DesktopAppInstaller already installed and skipped) else powershell Add-AppxPackage Microsoft.DesktopAppInstaller_2021.1207.203.0_neutral___8wekyb3d8bbwe.AppxBundle

findstr /l /c:"Microsoft.XboxIdentityProvider_12.85.31001.0_%arch%__8wekyb3d8bbwe" temp.list > nul
if %errorLevel% == 0 (echo XboxIdentityProvider already installed and skipped) else powershell Add-AppxPackage Microsoft.XboxIdentityProvider_12.85.31001.0_neutral___8wekyb3d8bbwe.AppxBundle

del /q temp.list

exit /b