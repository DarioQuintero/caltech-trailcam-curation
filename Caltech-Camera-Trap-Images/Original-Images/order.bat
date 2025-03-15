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
    echo Processing folder: %%A

    :: Count the number of files in the folder
    set file_count=0
    for %%B in ("%%A\*") do (
        if exist "%%B" set /a file_count+=1
    )

    :: Rename the folder to "n-animal_name" if there are files
    if !file_count! gtr 0 (
        set "folder_name=%%~nxA"
        ren "%%A" "!file_count!-!folder_name!"
        echo Renamed folder "%%A" to "!file_count!-!folder_name!"
    ) else (
        echo Skipping empty folder: %%A
    )
)

echo Ordering complete.
endlocal
