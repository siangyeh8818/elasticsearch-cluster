# elasticsearch-cluster

額外安裝插件 : 
------
  elasticsearch-head : UI管理的插件
  

Image位址 : https://hub.docker.com/r/siangyeh8818/elasticsearch-head/

注意事項:
------
運行時發生max virtual memory areas vm.max_map_count [65530] likely too low, increase to at least [262144]  的錯誤的話 <br>
請調整系統參數 <br>

                sudo sysctl -w vm.max_map_count=262144  或是 vim /etc/sysctl.conf  加入vm.max_map_count=262144

max_map_count文件包含限制一个process可以拥有的VMA的數量,process到了VMA上限但又只能釋放少量的memory给其他的kernel-process使用时，就引發錯誤<br>

運行參數設定:
------
<br>

    vi docker-compose.yaml

command修改下列參數 : <br>
node.name=運行的機器IP <br>
discovery.zen.ping.unicast.hosts=整個集群的ip跟port, ex : 10.0.0.1:9300,10.0.0.2:9300 <br>
<br>
environment修改下列參數 : <br>
ES_JAVA_OPTS , 看你的需求設定,沒要求就用預設即可 <br>
HEAD_MINUTOR_IP:運行的機器IP或是domain name , 這個變數是會影響看elasticsearch-head的URL <br>
<br>

運行方式:
------
單台host的elasticsearch:
  進到docker-compose/single-node 下:

    docker-compose -f docker-compose.yaml up -d
    
三台host的elasticsearch cluster: <br>
  分別到這三台的機器上運行各自的docker-compose.yml <br>
  進到docker-compose/multi-node 下, <br>
  host1:
  
    docker-compose -f docker-compose.yaml up -d
  host2:
    
    docker-compose -f docker-compose.yaml up -d
  host3:
    
    docker-compose -f docker-compose.yaml up -d
