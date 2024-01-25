@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: 定义下载链接和目标文件夹
SET download_url=https://codeload.github.com/G4Tim/PalworldTools/zip/refs/heads/main
SET zip_file=C:\PalworldTools.zip
SET extract_folder=C:\PalworldTools

:: 使用 curl 下载 zip 文件
echo Downloading PalworldTools...
curl -o "%zip_file%" "%download_url%"

:: 检查 zip 文件是否成功下载
IF NOT EXIST "%zip_file%" (
    echo Error: Download failed.
    goto end
)

:: 创建解压目标文件夹（如果不存在）
IF NOT EXIST "%extract_folder%" (
    mkdir "%extract_folder%"
)

:: 解压 zip 文件
echo Extracting files...
powershell -command "Expand-Archive -Path '%zip_file%' -DestinationPath '%extract_folder%'"

:: 运行 main.bat
echo Running main.bat...
call "%extract_folder%\PalworldTools-main\main.bat"

:end
echo Done.
pause
