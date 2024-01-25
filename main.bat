@echo off
cls

:MainMenu
echo Please select your language:
echo 1. English
echo 2. 中文
echo 0. Exit
echo.

choice /C 120 /N /M "Enter your choice: "
set LANGUAGE=%ERRORLEVEL%

if %LANGUAGE%==3 goto End

if %LANGUAGE%==1 goto EnglishMenu
if %LANGUAGE%==2 goto ChineseMenu

:EnglishMenu
echo You have selected English.
echo 1. Install Palworld server
echo 2. Install VC++ and DirectX
echo 3. Install python environment (Ediotr required)
echo 4. Run ini Editor
echo 0. Exit
echo.

choice /C 12340 /N /M "Enter your choice: "
set OPTION=%ERRORLEVEL%

if %OPTION%==5 goto MainMenu

if %OPTION%==1 powershell -ExecutionPolicy Bypass -File scripts\palserver.ps1
if %OPTION%==2 powershell -ExecutionPolicy Bypass -File scripts\VC+DX.ps1
if %OPTION%==3 start /wait scripts\PythonE.bat
if %OPTION%==4 python scripts\iniEditor.py
goto EnglishMenu

:ChineseMenu
echo 您已选择中文。
echo 1. 安装幻兽帕鲁服务器
echo 2. 安装服务器依赖VC++和DirectX
echo 3. 安装python环境 （编辑器需要）
echo 4. 运行配置文件编辑器
echo 0. 退出
echo.

choice /C 12340 /N /M "请输入您的选择: "
set OPTION=%ERRORLEVEL%

if %OPTION%==5 goto MainMenu

if %OPTION%==1 powershell -ExecutionPolicy Bypass -File scripts\palserver.ps1
if %OPTION%==2 powershell -ExecutionPolicy Bypass -File scripts\VC+DX.ps1
if %OPTION%==3 start /wait scripts\PythonE.bat
if %OPTION%==4 python scripts\iniEditor_CN.py
goto ChineseMenu

:End
echo Exiting...
