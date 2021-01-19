
**docker-hugo-go-git**
===========

[![](https://img.shields.io/badge/docker-hugo%2d-go%2d-git-099cec?logo=docker)](https://hub.docker.com/r/twbworld/hugo-go-git)


## 构建镜像
例 :
```shell
docker build -f dockerfile -t twbworld/hugo-go-git:latest .
```

## 使用

### Command line
```shell
docker run --rm -it --name hugo -p 1313:1313 -v ${PWD}:/src:rw twbworld/hugo-go-git:latest
```

### docker-compose

```shell
version: "3.8"
services:
    blog:
        image: twbworld/hugo-go-git:latest
        container_name: hugo
        command: server
        ports:
            - 1313:1313 #如果宿主机端口不是1313,会出现调试模式失效(不能自动刷新)的问题
        volumes:
            - ${PWD}:/src:rw #hugo项目的根目录
        environment:
            - TZ=Asia/Shanghai
            - HUGO_BIND=0.0.0.0
            - HUGO_ENV=DEV #DEV  || production
        restart: always
```

> 浏览器访问宿主机和该容器监听端口,即可; 例 : `http://domain.com:1313`



