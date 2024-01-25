# Enable delayed expansion
Set-StrictMode -Version 2.0

# Define download link and target folder
$downloadUrl = "https://codeload.github.com/G4Tim/PalworldTools/zip/refs/heads/main"
$zipFile = "C:\PalworldTools.zip"
$extractFolder = "C:\PalworldTools"

# Downloading zip file using Invoke-WebRequest
Write-Host "Downloading PalworldTools..."
Invoke-WebRequest -Uri $downloadUrl -OutFile $zipFile

# Check if zip file was successfully downloaded
if (-Not (Test-Path $zipFile)) {
    Write-Host "Error: Download failed."
    exit
}

# Create target folder for extraction if it doesn't exist
if (-Not (Test-Path $extractFolder)) {
    New-Item -ItemType Directory -Path $extractFolder
}

# Extracting files
Write-Host "Extracting files..."
Expand-Archive -Path $zipFile -DestinationPath $extractFolder

# Running main.bat
Write-Host "Running main.bat..."
& "$extractFolder\PalworldTools-main\main.bat"

# End of script
Write-Host "Done."
Read-Host -Prompt "Press Enter to exit"
