# 1、 构建镜像获取证书
docker run --name es -e ES_JAVA_OPTS="-Xms512m -Xmx512m" -e "discovery.type=single-node" --rm elasticsearch:7.12.1


docker exec -it es01 /bin/bash

bin/elasticsearch-certutil ca
bin/elasticsearch-certutil cert --ca elastic-stack-ca.p12
exit

docker cp es0:/usr/share/elasticsearch/elastic-certificates.p12 ~/

# 2、 构建包含证书和ik分词器的镜像
docker build -f DockerFile -t elasticsearch-ik:7.12.1 .


# 2、在宿主机执行
vi /etc/sysctl.conf  # 添加以下配置 如果是集群，数字可以更大
  vm.max_map_count=655360

sysctl -p



