@echo off
setlocal enabledelayedexpansion

:: Check if user provided two arguments
if "%~1"=="" (
    echo Usage: %~nx0 ^<input_folder^> ^<output_folder^> ^<resolution^>
    exit /b 1
)

if "%~2"=="" (
    echo Usage: %~nx0 ^<input_folder^> ^<output_folder^> ^<resolution^>
    exit /b 1
)

if "%~3"=="" (
    echo Usage: %~nx0 ^<input_folder^> ^<output_folder^> ^<resolution^>
    exit /b 1
)

:: Assign command-line arguments to variables
set "input_folder=%~1"
set "output_folder=%~2"
set "res=%~3"


:: Create output folder if it doesn't exist
if not exist "%output_folder%" mkdir "%output_folder%"

:: Loop through each .jpg file in the input folder
for %%f in ("%input_folder%\*.jpg") do (
    echo Processing "%%f"

    :: Run ffmpeg to crop and resize the image
    ffmpeg -i "%%f" -vf "crop='min(in_w, in_h)':'min(in_w, in_h)':'(in_w - min(in_w, in_h)) / 2':'(in_h - min(in_w, in_h)) / 2',scale=%res%:%res%" "%output_folder%\%%~nf_resized.jpg"
)

echo Done processing all images.
endlocal
