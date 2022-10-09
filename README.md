# screeps-server-docker-images
Screeps World server 's docker image

## Build

```bash
./build
```

## Server launch

```bash
docker run -p 21825:21025 -p 21826:21026 -itd lyf-screep-server sh
docker exec -it dbb33d5645e4b56428 screeps init
docker exec -itd dbb33d5645e4b56428 screeps start
```
## Connect


Connect with steam client
![图片](https://user-images.githubusercontent.com/52458236/194771785-ec3bff66-d541-4895-a507-3fc08717e9c0.png)


## [MORE](https://github.com/screeps/screeps#readme)
