@echo off
setlocal

REM Calculate start date as 30 days ago from current date
for /f "tokens=1-3 delims=/ " %%a in ('powershell -Command "(Get-Date).AddDays(-30).ToString('MM/dd/yyyy')"') do (
    set "startday=%%a"
    set "startmonth=%%b"
    set "startyear=%%c"
)
set "startdate=%startmonth%/%startday%/%startyear%"

REM Set filenames and folder paths
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set "hour=%%a"
    set "min=%%b"
)
set "logfilename=tableau_log_%endmonth%-%endday%-%endyear%_%hour%-%min%.zip"

set "logSourceFolder=E:\Tableau\data\tabsvc\files\log-archives"
set "logDestinationFolder=\\STEVPA-ETL\Tableau ZipLog"
set "excludeFile=permission.lock"

for /f "tokens=1,2 delims=:" %%a in ("%time%") do (
    set "timestamp=%%a:%%b"
)

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

endlocal
