@echo off
setlocal enabledelayedexpansion

:: Define the parent directory
set "sorted_dir=Sorted"

:: Check if sorted directory exists
if not exist "%sorted_dir%" (
    echo Error: Directory "%sorted_dir%" does not exist.
    exit /b
)

:: Loop through each animal folder in "sorted"
for /d %%A in ("%sorted_dir%\*") do (
    echo Flattening: %%A

    :: Loop through each sorting folder inside the animal folder
    for /d %%B in ("%%A\*") do (
        echo Processing sorting folder: %%B

        :: Move all files from the sorting folder to the animal folder
        move "%%B\*" "%%A\" >nul 2>&1

        :: Remove the now-empty sorting folder
        rd "%%B" 2>nul && echo Deleted empty folder: %%B
    )
)

echo Flattening complete.
endlocal
