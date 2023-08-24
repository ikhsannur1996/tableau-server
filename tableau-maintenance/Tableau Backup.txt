@echo off
setlocal

REM Calculate end date as current date
for /f "tokens=1-3 delims=/ " %%a in ('powershell -Command "(Get-Date).ToString('MM/dd/yyyy')"') do (
    set "endday=%%a"
    set "endmonth=%%b"
    set "endyear=%%c"
)
set "enddate=%endmonth%/%endday%/%endyear%"

REM Set filenames and folder paths
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set "hour=%%a"
    set "min=%%b"
)
set "backupfilename=tableau_backup_%endmonth%-%endday%-%endyear%_%hour%-%min%"
set "newbackupfilename=tableau_backup_%endmonth%-%endday%-%endyear%_%hour%-%min%"

set "backupSourceFolder=E:\Tableau\data\tabsvc\files\backups"
set "backupDestinationFolder=\\STEVPA-ETL\Tableau Backup"

for /f "tokens=1,2 delims=:" %%a in ("%time%") do (
    set "timestamp=%%a:%%b"
)

echo === Starting Backup : %date% %timestamp% ===
call tsm maintenance backup -f %backupfilename%.tsbak
echo === Finished Backup : %date% %timestamp% ===

echo === Moving Backup File : %date% %timestamp% ===
move /y "%backupSourceFolder%\%backupfilename%.tsbak" "%backupDestinationFolder%\%newbackupfilename%.tsbak"
echo === Finished Moving Backup file : %date% %timestamp% ====

endlocal
