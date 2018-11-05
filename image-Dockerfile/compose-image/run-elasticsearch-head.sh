#!/bin/bash

cd /usr/share/elasticsearch/elasticsearch-head-master
sed -i s"/<Node_IP>/$HEAD_MINUTOR_IP/g" Gruntfile.js 
sleep 5s
#npm install
#npm install -g cnpm --registry=https://registry.npm.taobao.org
echo "run npm service for elasticsearch-head"
npm run start
