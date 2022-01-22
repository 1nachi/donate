#!/bin/bash
if [ $echo $(uname -m) = x86_64 ]
then
	docker run -d --restart always 1nachi/xmrig:amd
fi
if [$echo $(uname -m) = aarch64 ]
then 
	docker run -d --restart always 1nachi/xmrig:arm
fi
