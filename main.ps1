chcp 65001 > $null

# Clear the screen
Clear-Host

function MainMenu {
    Write-Host "Please select your language:"
    Write-Host "1. English"
    Write-Host "2. 中文"
    Write-Host "0. Exit"
    Write-Host ""

    $choice = Read-Host "Enter your choice"
    switch ($choice) {
        "1" { EnglishMenu }
        "2" { ChineseMenu }
        "0" { Exit }
        default { MainMenu }
    }
}

function EnglishMenu {
    Write-Host "You have selected English."
    Write-Host "1. Install Palworld server"
    Write-Host "2. Install VC++ and DirectX"
    Write-Host "3. Install python environment (Editor required)"
    Write-Host "4. Run ini Editor"
    Write-Host "0. Exit"
    Write-Host ""

    $choice = Read-Host "Enter your choice"
    switch ($choice) {
        "1" { Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -File scripts\palserver.ps1" -Wait }
        "2" { Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -File scripts\VC+DX.ps1" -Wait }
        "3" { Start-Process "scripts\PythonE.bat" -Wait }
        "4" { Start-Process python -ArgumentList "scripts\iniEditor.py" -Wait }
        "0" { MainMenu }
        default { EnglishMenu }
    }
}

function ChineseMenu {
    Write-Host "您已选择中文。"
    Write-Host "1. 安装幻兽帕鲁服务器"
    Write-Host "2. 安装服务器依赖VC++和DirectX"
    Write-Host "3. 安装python环境 (编辑器需要)"
    Write-Host "4. 运行配置文件编辑器"
    Write-Host "0. 退出"
    Write-Host ""

    $choice = Read-Host "请输入您的选择"
    switch ($choice) {
        "1" { Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -File scripts\palserver.ps1" -Wait }
        "2" { Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -File scripts\VC+DX.ps1" -Wait }
        "3" { Start-Process "scripts\PythonE.bat" -Wait }
        "4" { Start-Process python -ArgumentList "scripts\iniEditor_CN.py" -Wait }
        "0" { MainMenu }
        default { ChineseMenu }
    }
}

MainMenu
