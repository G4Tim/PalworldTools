# Define download path
$steamCmdDir = "C:\steamcmd\others"

# Attempt to create download directory
try {
    if (-not (Test-Path -Path $steamCmdDir)) {
        New-Item -ItemType Directory -Path $steamCmdDir
        Write-Host "Directory created at $steamCmdDir"
    } else {
        Write-Host "Directory already exists at $steamCmdDir"
    }
} catch {
    Write-Host "Error creating directory: $_"
    exit
}

# Define download URLs
$vcRuntimeUrl = "https://aka.ms/vs/17/release/vc_redist.x64.exe"
$directXUrl = "https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe"

# Download VC Runtime installer
try {
    $vcRuntimePath = Join-Path $steamCmdDir "vc_redist.x64.exe"
    Invoke-WebRequest -Uri $vcRuntimeUrl -OutFile $vcRuntimePath
    Write-Host "VC Runtime downloaded successfully"
} catch {
    Write-Host "Error downloading VC Runtime: $_"
    exit
}

# Execute VC Runtime installation
try {
    Start-Process -FilePath $vcRuntimePath -Args '/install', '/quiet', '/norestart' -Wait
    Write-Host "VC Runtime installed successfully"
} catch {
    Write-Host "Error installing VC Runtime: $_"
    exit
}

# Download DirectX Redistributable installer
try {
    $directXPath = Join-Path $steamCmdDir "directx_redist.exe"
    Invoke-WebRequest -Uri $directXUrl -OutFile $directXPath
    Write-Host "DirectX Redistributable downloaded successfully"
} catch {
    Write-Host "Error downloading DirectX Redistributable: $_"
    exit
}

# Extract DirectX Redistributable
try {
    $extractDir = Join-Path $steamCmdDir "DirectX"
    New-Item -ItemType Directory -Path $extractDir -Force
    Start-Process -FilePath $directXPath -Args "/Q /T:$extractDir" -Wait
    Write-Host "DirectX Redistributable extracted to $extractDir"
} catch {
    Write-Host "Error extracting DirectX Redistributable: $_"
    exit
}

# Execute DirectX installation
try {
    $setupPath = Join-Path $extractDir "DXSETUP.exe"
    Start-Process -FilePath $setupPath -Args "/silent" -Wait
    Write-Host "DirectX installed successfully"
} catch {
    Write-Host "Error installing DirectX: $_"
    exit
}
