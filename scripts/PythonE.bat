@echo off

:: Set Python download URL and installer file name
set PYTHON_URL=https://www.python.org/ftp/python/3.12.1/python-3.12.1-amd64.exe
set PYTHON_INSTALLER=python_installer.exe
set PYTHON_PATH=C:\Program Files\Python312

:: Check if Python is already installed
python --version > NUL 2>&1
if %errorlevel% equ 0 (
    echo Python is already installed.
    goto CheckPath
)

:: Download Python installer
echo Downloading Python...
powershell -Command "Invoke-WebRequest -Uri %PYTHON_URL% -OutFile %PYTHON_INSTALLER%"

:: Install Python
echo Installing Python...
start /wait %PYTHON_INSTALLER% /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

:: Check if Python installation was successful
python --version
if %errorlevel% neq 0 (
    echo Python installation failed.
    exit /b %errorlevel%
)

:CheckPath
:: Check if Python is in Path and add if not
echo Checking Python Path...
setx path "%path%;%PYTHON_PATH%" /M

:: Check and install tkinter if needed
python -m tkinter
if %errorlevel% neq 0 (
    echo Installing tkinter...
    python -m pip install tk
)

:: Display installation status and wait for 3 seconds
echo Installation complete. Waiting for 3 seconds...
timeout /t 3 /nobreak > NUL

echo Done.
