#!/usr/bin/env bash

# 创建目录
mkdir -p /home/peaksong/docker_vol/rocketmq/rmqs/logs
mkdir -p /home/peaksong/docker_vol/rocketmq/rmqs/store
mkdir -p /home/peaksong/docker_vol/rocketmq/rmq/logs
mkdir -p /home/peaksong/docker_vol/rocketmq/rmq/store

# 设置目录权限
chmod -R 777 /home/peaksong/docker_vol/rocketmq

# 下载并启动容器，且为 后台 自动启动
docker-compose up -d


# 显示 rocketmq 容器
docker ps |grep rocketmq