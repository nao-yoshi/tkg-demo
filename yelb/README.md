# Yelb Demo Application
Yelb is a simple demo application provided by [here](https://github.com/mreferre/yelb). It contains UI server(JS and Nginx), App server(Ruby), Postgesql DB and Redis Cache. 

## Description
You can deploy container based application on your Kubernetes cluster easily. This repo intends to perform a demonstration or practice for operation on Kubernetes.

## Requirement
- Kubernetes cluster

## Usage
Copy this repo on your terminal. Then, run commands listed below.

```
kubectl create ns yelb
kubectl create ns metallb-system
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="\$(openssl rand -base64 128)"
kubectl apply -n metallb-system -f lb.yaml
kubectl apply -n metallb-system -f lb-config.yaml
kubectl apply -n yelb -f yelb-lb.yaml
kubectl -n yelb get svc
```

## Clean up
Run commands listed below.
```
kubectl delete -n metallb-system -f lb.yaml
kubectl delete -n metallb-system -f lb-config.yaml
kubectl delete -n yelb -f yelb-lb.yaml
kubectl delete ns yelb
kubectl delete ns metallb-system
```

## Author
nao-yoshi
