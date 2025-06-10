@echo off
Title Clock
@mode con cols=30 lines=7
color 03
:main
cls
echo.

:: Get current hour, minute, second, and milliseconds
for /f "tokens=1-4 delims=:., " %%a in ("%time%") do (
    set hour=%%a
    set minute=%%b
    set second=%%c
    set millisecond=%%d
)

:: Convert 24-hour to 12-hour format and set AM/PM
if %hour% geq 12 (
    set ampm=PM
    if %hour% gtr 12 set /a hour=%hour%-12
) else (
    set ampm=AM
    if %hour%==00 set hour=12
)

:: Display the formatted time with milliseconds
echo Time: %hour%:%minute%:%second%.%millisecond% %ampm%
echo.
echo Date: %date%
echo.
ping -n 2 0.0.0.0>nul
goto main
