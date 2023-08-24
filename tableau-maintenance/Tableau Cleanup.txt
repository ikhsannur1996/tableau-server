@echo off
setlocal

for /f "tokens=1,2 delims=:" %%a in ("%time%") do (
    set "timestamp=%%a:%%b"
)

echo === Starting Cleanup : %date% %timestamp% ===
call tsm maintenance cleanup
echo === Finished Cleanup : %date% %timestamp% ===

echo === All Task Complete: %date% %timestamp% ===

endlocal
