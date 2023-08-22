@echo off
setlocal

REM Calculate end date as current date
for /f "tokens=1-3 delims=/ " %%a in ('powershell -Command "(Get-Date).ToString('MM/dd/yyyy')"') do (
    set "endday=%%a"
    set "endmonth=%%b"
    set "endyear=%%c"
)
set "enddate=%endmonth%/%endday%/%endyear%"

REM Calculate start date as 30 days ago from current date
for /f "tokens=1-3 delims=/ " %%a in ('powershell -Command "(Get-Date).AddDays(-30).ToString('MM/dd/yyyy')"') do (
    set "startday=%%a"
    set "startmonth=%%b"
    set "startyear=%%c"
)
set "startdate=%startmonth%/%startday%/%startyear%"

REM Get current time for start date's time
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set "starthour=%%a"
    set "startmin=%%b"
)

REM Set log and backup filenames with date and time
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set "hour=%%a"
    set "min=%%b"
)
set "logfilename=tableau_log_%endmonth%-%endday%-%endyear%_%hour%-%min%.zip"
set "newlogfilename=tableau_log_%endmonth%-%endday%-%endyear%_%hour%-%min%_backup.zip"
set "backupfilename=tableau_backup_%endmonth%-%endday%-%endyear%_%hour%-%min%"
set "newbackupfilename=tableau_backup_%endmonth%-%endday%-%endyear%_%hour%-%min%"

REM Set folder paths
set "logSourceFolder=E:\Tableau\data\tabsvc\files\log-archives"
set "logDestinationFolder=\\STEVPA-ETL\Tableau ZipLog"
set "backupSourceFolder=E:\Tableau\data\tabsvc\files\backups"
set "backupDestinationFolder=\\STEVPA-ETL\Tableau Backup"
set "excludeFile=permission.lock"

for /f "tokens=1,2 delims=:" %%a in ("%time%") do (
    set "timestamp=%%a:%%b"
)

echo === Starting Backup : %date% %timestamp% ===
call tsm maintenance backup -f %backupfilename%.tsbak
echo === Finished Backup : %date% %timestamp% ===

echo === Moving Backup File : %date% %timestamp% ===
move /y "%backupSourceFolder%\%backupfilename%.tsbak" "%backupDestinationFolder%\%newbackupfilename%.tsbak"
echo === Finished Moving Backup file : %date% %timestamp% ====

echo === Starting Ziplog : %date% %timestamp% ===
echo Ziplog Start Date: %startdate% %timestamp%
echo Ziplog End Date: %enddate% %timestamp%

REM Use PowerShell to execute the ziplogs command with formatted dates
powershell -Command "Invoke-Expression 'tsm maintenance ziplogs -f \"%logfilename%\" --startdate \"%startday%/%startmonth%/%startyear% %timestamp%\" --enddate \"%endday%/%endmonth%/%endyear% %timestamp%\"'"

echo === Finished Ziplog task : %date% %timestamp% ===

echo === Moving ziplog files : %date% %timestamp% ===
for %%F in ("%logSourceFolder%\*") do (
    if /I not "%%~nxF"=="%excludeFile%" (
        echo Moving "%%~nxF"...
        move "%%F" "%logDestinationFolder%\%%~nxF"
    ) else (
        echo Skipping "%excludeFile%"...
    )
)
echo === Finished Moving ziplog files : %date% %timestamp% ===

echo === Starting Cleanup : %date% %timestamp% ===
call tsm maintenance cleanup
echo === Finished Cleanup : %date% %timestamp% ===

echo === All Task Complete: %date% %timestamp% ===

endlocal
