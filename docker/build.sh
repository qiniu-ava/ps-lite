#!/bin/bash
docker build -t ps-lite:test -f dockerfile ..

if [ "$1" = "--push" ]; then
	VERSION=$(date -u '+%Y%m%d')-$(git rev-parse --short HEAD)
	docker tag ps-lite:test reg-xs.qiniu.io/atlab/ps-lite:$VERSION
	docker push reg-xs.qiniu.io/atlab/ps-lite:$VERSION
fi
