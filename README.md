[English](README-EN.md)<br>

*iniEditor.py* 一个完全中文的幻兽帕鲁配置文件编辑器<br>

咋用捏:<br>
1. 确保安装 Python 3 (最小版本 Python 3.5, 推荐使用 Python 3.12).
2. 确保 *Dic_EN-CN.txt* 字典文件与 *iniEditor.py* 在同一目录
3. 运行 *iniEditor.py*, 点击 <加载> 以进行编辑 .ini 文件.[fig](Editor-CN_0.1.png)
4. 点击 <保存> 以保存配置文件.

*palserver.ps1* 是一个用于在 Windows 系统上部署幻兽帕鲁服务器的 PowerShell 脚本。<br>
*VC+DX.ps1* 是一个用于安装运行幻兽帕鲁服务器所需的 VC++ Runtime 和 DirectX® Runtime 的 PowerShell 脚本。<br>

咋用捏：<br>
1. 打开 PowerShell 并执行 *palserver.ps1*。<br>
   1.1 在 *palserver.ps1* 的路径前使用 "&" 符号。<br>
2. 安装完成后尝试运行 PalServer.exe。<br>
   2.1 PalServer.exe 的默认路径是 "C:\palworld\PalServer.exe"。<br>
3. 如果出现关于 VC++ 或 DirectX 的错误，请执行 *VC+DX.ps1*。<br>
4. 现在，你应该能够正常运行服务器了。<br>
