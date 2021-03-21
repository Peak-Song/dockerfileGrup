最后创建集群的关键步骤


- docker network inspect redis-cluster
  观察所有redis节点的分布状态
  
- docker exec -it redis-node-0 /bin/bash
  随机进入一个redis节点
  
- ./redis-cli -a redis2021 --cluster create 172.24.0.4:7000 172.24.0.2:7002 172.24.0.3:7001 172.24.0.6:7005 172.24.0.5:7004 172.24.0.7:7003 --cluster-replicas 1
  执行创建集群命令
  