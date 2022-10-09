@echo off

set docker_proxy=http://host.docker.internal:7890
set image_name=lyf-screep-server

docker build --build-arg http_proxy=%docker_proxy% --build-arg https_proxy=%docker_proxy% ^
    --build-arg HTTP_PROXY=%docker_proxy% --build-arg HTTPS_PROXY=%docker_proxy% -t %image_name% .