# Symbolic Link Instructions
* **NOTE:** May require `cmd.exe /c mklink` or just `mklink` AND %CMDER_ROOT% might NOT resolve!*
- `cmd.exe /c mklink %CMDER_ROOT%\config\user_aliases.cmd  C:\projects\Windows\Cmder\user_aliases.cmd`
- `cmd.exe /c mklink %CMDER_ROOT%\config\user_profile.cmd  C:\projects\Windows\Cmder\user_profile.cmd`
- `cmd.exe /c mklink %CMDER_ROOT%\vendor\conemu-maximus5\ConEmu.xml  C:\Projects\Windows\Cmder\ConEmu.xml`
- `cmd.exe /c mklink %APPDATA%\SpeedCrunch\SpeedCrunch.ini   C:\projects\Windows\SpeedCrunch\SpeedCrunch.ini`
- `cmd.exe /c mklink /D %APPDATA%\SpeedCrunch\ C:\projects\Windows\SpeedCrunch\`
- `cmd.exe /c mklink %APPDATA%\Voidstar\FilePilot\FPilot-Config.json C:\projects\Windows\FilePilot\FPilot-Config.json`
- `cmd.exe /c mklink %HOME%\.minttyrc C:\projects\Windows\.minttyrc`

# Environment Variables
1. Edit Path and add `C:\Projects\Windows\bin`
