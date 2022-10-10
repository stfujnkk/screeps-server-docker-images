#!/bin/sh

docker pull node:10-buster-slim 
docker run --name screeps-server -itd -p 8385:21025 -p 8386:21026 -p 8387:21027 node:10-buster-slim bash
docker cp screeps-server.tar.gz screeps-server:/
docker exec -it screeps-server tar -zxvf screeps-server.tar.gz /