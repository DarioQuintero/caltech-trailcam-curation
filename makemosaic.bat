if "%~1"=="" (
    echo Usage: %~nx0 ^<inputs_folder^> ^<grid_width^> ^<grid_height^> ^<image_resolution^> ^<output_file^>
    exit /b 1
)
if "%~2"=="" (
    echo Usage: %~nx0 ^<inputs_folder^> ^<grid_width^> ^<grid_height^> ^<image_resolution^> ^<output_file^>
    exit /b 1
)
if "%~3"=="" (
    echo Usage: %~nx0 ^<inputs_folder^> ^<grid_width^> ^<grid_height^> ^<image_resolution^> ^<output_file^>
    exit /b 1
)
if "%~4"=="" (
    echo Usage: %~nx0 ^<inputs_folder^> ^<grid_width^> ^<grid_height^> ^<image_resolution^> ^<output_file^>
    exit /b 1
)
if "%~5"=="" (
    echo Usage: %~nx0 ^<inputs_folder^> ^<grid_width^> ^<grid_height^> ^<image_resolution^> ^<output_file^>
    exit /b 1
)

:: Assign command-line arguments to variables
set "inputs_folder=%~1"
set "grid_width=%~2"
set "grid_height=%~3"
set "image_resolution=%~4"
set "output_file=%~5"


magick montage %inputs_folder%/*.jpg -tile %grid_width%x%grid_height% -geometry %image_resolution%x%image_resolution%+0+0 -background black %output_file%