[中文说明](README.md)<br>

*iniEditor.py* is a Python script providing a user interface to assist in editing Palworld .ini files.<br>

How to use:<br>
1. Ensure Python 3 is installed (minimum Python 3.5, recommended Python 3.12).
2. Run *iniEditor.py*, click <Load Settings> to load and edit .ini files.[fig](pics\Editor_0.1.png)
3. After making the desired changes, click the 'Save' button to save your modifications to the specified file.

*palserver.ps1* is a PowerShell script designed to assist in deploying a Palworld server on Windows.<br>
*VC+DX.ps1* is another PowerShell script that facilitates the installation of the "Visual C++ Redistributable Packages" and "Microsoft DirectX® End-User Runtime," both required dependencies for the Palworld server.<br>

How to use:<br>
1. Open PowerShell and execute *palserver.ps1*.<br>
   1.1 Use the "&" symbol before the path to *palserver.ps1* to run the script.<br>
2. After completing the server installation, try running PalServer.exe.<br>
   2.1 The default location of PalServer.exe is "C:\palworld\PalServer.exe".<br>
3. If you encounter an error related to VC++ or DirectX, execute *VC+DX.ps1*.<br>
4. You should now be able to run the Palworld server.<br>
