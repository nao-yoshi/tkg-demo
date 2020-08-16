# Yelb Demo Application
Yelb is a simple demo application provided by [here](https://github.com/mreferre/yelb). It contains UI server(JS and Nginx), App server(Ruby), Postgesql DB and Redis Cache. With this repo, you can deploy Yelb on your Kubernetes cluster.

## Description
You can deploy container based Yelb application on your Tanzu Kubernetes Grid(TKG) cluster. This repo intends to perform a demonstration or practice for operation on Kubernetes.

## Requirement
- Your Linux PC with TKG CLI installed
- TKG cluster running on vSphere or [VMC](https://cloud.vmware.com/jp/vmc-aws) 
  - Management/Workload clusters are deployed
  - TKG Network for Workload cluster with DHCP enabled (ex. 192.168.0.0/24)

## Usage
Clone this repo on your terminal. Then, run commands listed below.
1. Open lb.yaml file, then add IP range that you want to apply for External IPs.
2. Deploy MetalLB
    ```
    kubectl create ns metallb-system
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="\$(openssl rand -base64 128)"
    kubectl apply -n metallb-system -f lb.yaml
    kubectl apply -n metallb-system -f lb-config.yaml
    ```
3. Deploy Yelb
    ```
    kubectl create ns yelb
    kubectl apply -n yelb -f yelb-lb.yaml
    kubectl -n yelb get svc  #You can check the ExternalIP
    ```
4. Access http://ExternalIP

## Clean up
Delete all deployments, services and namespaces which you have deployed above.
```
kubectl delete -n metallb-system -f lb.yaml
kubectl delete -n metallb-system -f lb-config.yaml
kubectl delete -n yelb -f yelb-lb.yaml
kubectl delete ns yelb
kubectl delete ns metallb-system
```

## Author
nao-yoshi
