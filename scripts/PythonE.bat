@echo off

:: Set Python download URL and installer file name
set PYTHON_URL=https://www.python.org/ftp/python/3.12.1/python-3.12.1-amd64.exe
set PYTHON_INSTALLER=python_installer.exe

:: Check if Python is already installed
python --version
if %errorlevel% equ 0 (
    echo Python is already installed.
    goto PostInstall
)

:: Download Python installer
echo Downloading Python...
powershell -Command "Invoke-WebRequest -Uri %PYTHON_URL% -OutFile %PYTHON_INSTALLER%"

:: Install Python
echo Installing Python...
start /wait %PYTHON_INSTALLER% /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

echo Python installation script has completed.
echo Please reopen command prompt to check Python installation.
exit

:PostInstall
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
