# Enable delayed expansion
Set-Local EnableDelayedExpansion

# Define download URL and target folder
$download_url = "https://codeload.github.com/G4Tim/PalworldTools/zip/refs/heads/main"
$zip_file = "C:\PalworldTools.zip"
$extract_folder = "C:\PalworldTools"

# Download zip file using Invoke-WebRequest
Write-Host "Downloading PalworldTools..."
Invoke-WebRequest -Uri $download_url -OutFile $zip_file

# Check if the zip file was successfully downloaded
if (-not (Test-Path $zip_file)) {
    Write-Host "Error: Download failed."
    exit
}

# Create extraction target folder if it does not exist
if (-not (Test-Path $extract_folder)) {
    New-Item -Path $extract_folder -ItemType Directory
}

# Extract zip file
Write-Host "Extracting files..."
Expand-Archive -Path $zip_file -DestinationPath $extract_folder

# Run main.ps1
Write-Host "Running main.ps1..."
& "$extract_folder\PalworldTools-main\main.ps1"

Write-Host "Done."
Pause
