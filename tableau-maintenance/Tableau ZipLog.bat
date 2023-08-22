@echo off
set "sourceFolder=E:\Tableau\data\tabsvc\files\log-archives"
set "destinationFolder=\\STEVPA-ETL\Tableau ZipLog"
set "excludeFile=permission.lock"

echo Moving files from %sourceFolder% to network storage...

for %%F in ("%sourceFolder%\*") do (
    if /I not "%%~nxF"=="%excludeFile%" (
        echo Moving "%%~nxF"...
        move "%%F" "%destinationFolder%\%%~nxF"
    ) else (
        echo Skipping "%excludeFile%"...
    )
)

echo All files moved (excluding %excludeFile%) successfully.
pause
