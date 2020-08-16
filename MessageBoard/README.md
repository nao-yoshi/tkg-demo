# Message Board 
This is an example message board application with PHP and Redis running on Kubernetes cluster. This repo intends to perform a demonstration or practice of operation on Kubernetes environment.

## Description
If you deploy the Message Board application on the two site, written massage data can be replicated between both sites.

### Deployment
Idias of the deployment is shown below.

![Deployment1](pics/Deployment.png)

![Deployment2](pics/2sites_Deployment.png)

### Replication
Massages you submitted are replicated by Redis from the production site to failover site immediately.
![Replication](pics/step2.png)

## Requirement
- Your Linux PC with TKG CLI installed
- TKG cluster running on vSphere or VMC
  - Management/Workload clusters are deployed
  - TKG Network for Workload cluster with DHCP enabled (ex. 192.168.0.0/24)

## Usage
### Initial deployment
1. Deploy MetalLB on both sites.
2. Deploy Message Board application on both site.
3. Change the replication target of Redis-slave server on the fialover site from Redis-master to the Redis-master on the production site.

### Failover
1. Stop the frontend service on the production site.
2. Change the replication target of Redis-slave server on the failover site from Redis-master on the production site to the failover (local) site.

## Clean up
1. Delete Message Board application.
2. Delete MetalLB.

## Author
nao-yoshi
