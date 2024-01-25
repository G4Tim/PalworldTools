@echo off
cls

:MainMenu
echo Please select your language:
echo 1. English
echo 2. ����
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
echo ����ѡ�����ġ�
echo 1. ��װ������³������
echo 2. ��װ����������VC++��DirectX
echo 3. ��װpython���� ���༭����Ҫ��
echo 4. ���������ļ��༭��
echo 0. �˳�
echo.

choice /C 12340 /N /M "����������ѡ��: "
set OPTION=%ERRORLEVEL%

if %OPTION%==5 goto MainMenu

if %OPTION%==1 powershell -ExecutionPolicy Bypass -File scripts\palserver.ps1
if %OPTION%==2 powershell -ExecutionPolicy Bypass -File scripts\VC+DX.ps1
if %OPTION%==3 start /wait scripts\PythonE.bat
if %OPTION%==4 python scripts\iniEditor_CN.py
goto ChineseMenu

:End
echo Exiting...
