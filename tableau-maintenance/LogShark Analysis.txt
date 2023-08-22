@echo off
setlocal enabledelayedexpansion

REM Set the target directory
set "targetDir=E:\Tableau ZipLog"
set "scriptDir=E:\Tableau LogShark"

REM Change to the target directory
cd /d "%targetDir%"

REM Find the newest .zip file
set "newestFile="
for /f "delims=" %%F in ('dir /b /o:-d /a-d *.zip') do (
    set "newestFile=%%F"
    goto :FoundNewest
)

:FoundNewest

REM Check if a .zip file was found
if not defined newestFile (
    echo No .zip files found in %targetDir%.
    exit /b
)

REM Change back to the script directory
cd /d "%scriptDir%"

REM Run LogShark with the newest .zip file
logshark "%targetDir%\!newestFile!"
