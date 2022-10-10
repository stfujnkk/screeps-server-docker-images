#!/bin/sh

proxy=http://host.docker.internal:7890
work_dir=screeps-srv 
work_dir=$(readlink -f $work_dir) 
export http_proxy=$proxy https_proxy=$proxy HTTP_PROXY=$proxy HTTPS_PROXY=$proxy

sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
apk update
apk --no-cache add nodejs
apk --no-cache add build-base python2 npm
mkdir $work_dir
cd $work_dir
npm init -y
npm install screeps@4.2.14 --registry=https://registry.npm.taobao.org 
ln -sf $work_dir/node_modules/.bin/screeps /bin/screeps
# npm prune --production && npm prune && npm dedupe
