@echo off

rem Set the name of the shortcut file
set shortcut_name=LongvinterServer.exe - Shortcut.lnk
set program_shipping_name=LongvinterServer-Win64-Shipping.exe
rem Get the script's location
set script_location=%~dp0

rem Build the full path to the shortcut
set end_path=Longvinter\Binaries\Win64\
set shortcut_location=%script_location%%shortcut_name%
set exe_location=%script_location%Longvinter\Binaries\Win64\

echo %script_location%%end_path%
for /f "tokens=2 delims=," %%a in ('tasklist /fi "imagename eq %program_shipping_name%" /v /fo csv ^| find /i "%script_location%%end_path%"') do (
  echo %%a
)

rem Check if the program is running
tasklist /fi "imagename eq %program_shipping_name%" /v /fo csv ^ | find /i "%script_location%%end_path%" > NUL
echo Error level = %ERRORLEVEL%
if %errorlevel% == 1 (
    echo Program is not running
	Start "?" "%shortcut_location%"
) else (
    echo Program is running
)