# yelb demo
Yelb is a simple demo application provided by [here](https://github.com/mreferre/yelb). It contains UI server(JS and Nginx), App server(Ruby), Postgesql DB and Redis Cache. 

## Description
You can deploy container based application on your Kubernetes cluster easily. This repo intends to perform a demonstration or practice for operation on Kubernetes.

## Requirement
- Kubernetes cluster

## Usage
Copy this repo on your terminal. Then, run commands listed below.

```
kuberctl create ns yelb
kuberctl create ns metallb-system
kuberctl create secret generic -n metallb-system memberlist --from-literal=secretkey="\$(openssl rand -base64 128)"
kuberctl apply -n metallb-system -f lb.yaml
kuberctl apply -n metallb-system -f lb-config.yaml
kuberctl apply -n yelb -f yelb-lb.yaml
kuberctl -n yelb get svc
```

## Clean up
Run commands listed below.
```
kuberctl delete -n metallb-system -f lb.yaml
kuberctl delete -n metallb-system -f lb-config.yaml
kuberctl delete -n yelb -f yelb-lb.yaml
kuberctl delete ns yelb
kuberctl delete ns metallb-system
```

## Author
nao-yoshi
