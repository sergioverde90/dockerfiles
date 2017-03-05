## PRE-REQUISITES
* Docker-engine 1.13+    -> https://github.com/docker/docker/blob/master/CHANGELOG.md
* Docker-compose 1.10.0+ -> https://github.com/docker/compose/releases

## BUILDING CLUSTER
* Build Dockerfile
``` bash
docker build -t elasticstack .
```
* init docker in swarm mode
``` bash
docker swarm init
```
* deploy the stack and check the stack status
``` bash
docker stack deploy --compose-file docker-compose.yml elasticstack
docker service ls
ID            NAME                MODE        REPLICAS  IMAGE
cilvnrpcoj1n  elasticstack_el     replicated  1/1       elasticstack
shppa9h4wi7k  elasticstack_nginx  replicated  1/1       nginx:1
```
* enable dns round robin (at this time is not supported by docker-compose.yml file)
```bash
docker service update --endpoint-mode dnsrr elasticstack_el
```
* check cluster status
``` bash
curl http://localhost:9200/_cluster/health?pretty
{
  "cluster_name" : "elasticsearch",
  "status" : "green",
  "timed_out" : false,
  "number_of_nodes" : 1,
  "number_of_data_nodes" : 1,
  "active_primary_shards" : 0,
  "active_shards" : 0,
  "relocating_shards" : 0,
  "initializing_shards" : 0,
  "unassigned_shards" : 0,
  "delayed_unassigned_shards" : 0,
  "number_of_pending_tasks" : 0,
  "number_of_in_flight_fetch" : 0,
  "task_max_waiting_in_queue_millis" : 0,
  "active_shards_percent_as_number" : 100.0
}
```
* scale cluster
```bash
docker service scale elasticstack_el=2
docker service ls
ID            NAME                MODE        REPLICAS  IMAGE
cilvnrpcoj1n  elasticstack_el     replicated  2/2       elasticstack
shppa9h4wi7k  elasticstack_nginx  replicated  1/1       nginx:1
```
* check that second container is join to the previous cluster
```bash
docker logs elasticstack_el.2.{GENERATED_ID}
```
you will see something like this
```bash
[2017-03-04 19:42:23,003][INFO ][cluster.service] [Angela Del Toro] detected_master {Iron Monger}{Sc-o1kPKSeaNTL4b69x64Q}{10.0.0.2}{10.0.0.2:9300}, added {{Iron Monger}{Sc-o1kPKSeaNTL4b69x64Q}{10.0.0.2}{10.0.0.2:9300},}, reason: zen-disco-receive(from master [{Iron Monger}{Sc-o1kPKSeaNTL4b69x64Q}{10.0.0.2}{10.0.0.2:9300}])
```
* check cluster again
```bash
curl http://localhost:9200/_cluster/health?pretty
{                                            
  "cluster_name" : "elasticsearch",          
  "status" : "green",                        
  "timed_out" : false,                       
  "number_of_nodes" : 2,                     
  "number_of_data_nodes" : 2,                
  "active_primary_shards" : 0,               
  "active_shards" : 0,                       
  "relocating_shards" : 0,                   
  "initializing_shards" : 0,                 
  "unassigned_shards" : 0,                   
  "delayed_unassigned_shards" : 0,           
  "number_of_pending_tasks" : 0,             
  "number_of_in_flight_fetch" : 0,           
  "task_max_waiting_in_queue_millis" : 0,    
  "active_shards_percent_as_number" : 100.0  
}                                            
```
