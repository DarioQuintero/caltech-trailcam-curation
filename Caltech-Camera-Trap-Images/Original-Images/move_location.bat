@echo off
setlocal enabledelayedexpansion

:: Define the parent directory
set "sorted_dir=Sorted"
set "location_dir=Location_0"

:: Check if the "Sorted" directory exists
if not exist "%sorted_dir%" (
    echo Error: Directory "%sorted_dir%" does not exist.
    exit /b
)

:: Create "Location_0" directory if it doesn't exist
if not exist "%location_dir%" (
    mkdir "%location_dir%"
    echo Created "Location_0" directory.
)

:: Loop through each animal folder in "Sorted"
for /d %%A in ("%sorted_dir%\*") do (
    echo Processing folder: %%A

    :: Loop through each image filename in the COCO JSON file
    for /f "tokens=*" %%B in ('jq -r ".images[] | select(.location == \"0\") | .file_name" "%sorted_dir%\caltech.json"') do (
        :: Check if the image exists in the animal folder
        if exist "%%A\%%B" (
            echo Moving image: %%B from "%%A" to "%location_dir%"
            move "%%A\%%B" "%location_dir%"
        )
    )
)

echo Process complete.
endlocal
