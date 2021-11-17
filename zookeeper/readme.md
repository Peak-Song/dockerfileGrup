### 注意事项
- 本镜像源由于在大陆构建的关系, 所以使用清华的debian apt源  
- docker-compose的volume映射可根据自身操作系统实际进行调整  

### 启动命令
docker-compose up -d

### 部分参数解释  
- ZOO_TICK_TIME   
  默认为2000。zk的tickTime，以毫秒为单位。
  ZK中所有时间都是以这个时间单元为基础，进行整数倍配置。

- ZOO_INIT_LIMIT   
  默认为5。zk的initLimit。  
  Zookeeper等待客户端初始化连接的响应时，最长能等待多少个tickTime。  
  例如默认设置为 5，表示超过5个心跳的时间（也就是ZOO_TICK_TIME）长度后，Zookeeper 服务器还没有收到客户端的返回信息，就认为这个客户端连接失败。  
  总的超时时间等于ZOO_INIT_LIMIT_ZOO_TICK_TIME=5_2000=10000毫秒。  

- ZOO_SYNC_LIMIT  
  默认为2。zk的syncLimit。  
  Leader 与 Follower 之间发送消息，请求和应答时间长度，最长不能超过多少个 tickTime。  
  例如默认设置为2，表示超过2个心跳的时间（也就是ZOO_TICK_TIME）长度后 ，Leader 与 Follower通信超时。 

- ZOO_MAX_CLIENT_CNXNS  
  默认为60。zk的maxClientCnxns。  
  单个客户端与单台zk服务器之间的连接数的限制，是ip级别的，如果设置为0，那么表明不作任何限制。

### 参考链接
- [Docker下安装zookeeper（单机 & 集群）](https://www.cnblogs.com/LUA123/p/11428113.html)  
- [使用 Docker 一步搞定 ZooKeeper 集群的搭建](https://www.cnblogs.com/kingkoo/p/8732448.html)  
- [Volume binding using docker compose on Windows](https://stackoverflow.com/questions/41334021/volume-binding-using-docker-compose-on-windows)  
- [官方dockerfile参考](https://github.com/31z4/zookeeper-docker/blob/2373492c6f8e74d3c1167726b19babe8ac7055dd/3.6.2/Dockerfile)  
- [Debian apt清华镜像](https://mirrors.tuna.tsinghua.edu.cn/help/debian/)  

