# Setting target directories
$steamCmdDir = "C:\steamcmd"
$palworldDir = "C:\PalWorld" # Adding Palworld directory
$steamCmdZip = "C:\steamcmd\steamcmd.zip"
$steamCmdExe = "C:\steamcmd\steamcmd.exe"

# Create directories
try {
    # Check and create steamCmdDir
    if (-not (Test-Path -Path $steamCmdDir)) {
        New-Item -ItemType Directory -Path $steamCmdDir
        Write-Host "Directory created at $steamCmdDir"
    } else {
        Write-Host "Directory already exists at $steamCmdDir"
    }

    # Check and create palworldDir
    if (-not (Test-Path -Path $palworldDir)) {
        New-Item -ItemType Directory -Path $palworldDir
        Write-Host "Directory created at $palworldDir"
    } else {
        Write-Host "Directory already exists at $palworldDir"
    }
} catch {
    Write-Host "Error creating directory: $_"
    exit
}

# Download SteamCMD
try {
    Invoke-WebRequest -Uri "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip" -OutFile $steamCmdZip
    Write-Host "SteamCMD downloaded successfully"
} catch {
    Write-Host "Error downloading SteamCMD: $_"
    exit
}

# Extract SteamCMD
try {
    Expand-Archive -Path $steamCmdZip -DestinationPath $steamCmdDir
    Write-Host "SteamCMD extracted successfully"
} catch {
    Write-Host "Error extracting SteamCMD: $_"
    exit
}

# Run SteamCMD to install the game
try {
    & $steamCmdExe +force_install_dir $palworldDir +login anonymous +app_update 2394010 +quit
    Write-Host "Game installed successfully at $palworldDir"
} catch {
    Write-Host "Error running SteamCMD: $_"
}

# Displaying SteamCMD and Palworld Paths
Write-Host "SteamCMD is located at: $steamCmdDir"
Write-Host "Palworld is installed at: $palworldDir"
