@echo off
set "target_folder=E:\Tableau Backup"
forfiles /p %target_folder% /s /m *.* /d -60 /c "cmd /c del @path"
