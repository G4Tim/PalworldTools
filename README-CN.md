*palserver.ps1* 是一个用于在 Windows 系统上部署幻兽帕鲁服务器的 PowerShell 脚本。
*VC+DX.ps1* 是一个用于安装运行幻兽帕鲁服务器所需的 VC++ Runtime 和 DirectX® Runtime 的 PowerShell 脚本。

咋用捏：
1. 打开 PowerShell 并执行 *palserver.ps1*。
   1.1 在 *palserver.ps1* 的路径前使用 "&" 符号。
2. 安装完成后尝试运行 PalServer.exe。
   2.1 PalServer.exe 的默认路径是 "C:\palworld\PalServer.exe"。
3. 如果出现关于 VC++ 或 DirectX 的错误，请执行 *VC+DX.ps1*。
4. 现在，你应该能够正常运行服务器了。
