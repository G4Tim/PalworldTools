# Define Python download URL and installer file name
$PYTHON_URL = "https://www.python.org/ftp/python/3.12.1/python-3.12.1-amd64.exe"
$PYTHON_INSTALLER = "python_installer.exe"

# Check if Python is already installed
try {
    $pythonVersion = python --version
    Write-Host "Python is already installed: $pythonVersion"
    Goto PostInstall
} catch {
    Write-Host "Python is not installed"
}

# Download Python installer
Write-Host "Downloading Python..."
Invoke-WebRequest -Uri $PYTHON_URL -OutFile $PYTHON_INSTALLER

# Install Python
Write-Host "Installing Python..."
Start-Process -FilePath $PYTHON_INSTALLER -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1 Include_test=0" -Wait

Write-Host "Python installation script has completed."
Write-Host "Please reopen command prompt to check Python installation."
exit

:PostInstall
# Check and install tkinter if needed
try {
    python -m tkinter
} catch {
    Write-Host "Installing tkinter..."
    python -m pip install tk
}

# Display installation status and wait for 3 seconds
Write-Host "Installation complete. Waiting for 3 seconds..."
Start-Sleep -Seconds 3

Write-Host "Done."
