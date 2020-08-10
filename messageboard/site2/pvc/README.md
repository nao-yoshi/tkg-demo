# Message Board with Persistent Volume on vSphere

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
3. Create Storage Class(SC), Persistent Volume Clame(PVC) and Persistent Volume(PV). 
    - Open cs.yaml file, then add your "datastoreurl". 
    - Open pvc.yaml file, then edit disk size and other values if you want. Then, run commands listed below.
    ```
    kubectl apply -f cs.yaml
    kubectl apply -f pvc.yaml
    kubectl get cs   ## Check your CS
    kubectl get pv   ## Check your PV
    kubectl get pvc   ## Check your PVC
    ```
4. Deploy Yelb
    ```
    kubectl apply -f all-in-site2-pvc.yaml
    kubectl get svc  #You can check the ExternalIP
    ```
4. Access http://ExternalIP

## Clean up
Delete all deployments, services and namespaces which you have deployed above.
```
kubectl delete -f all-in-site2-pvc.yaml
kubectl delete -f lb-config.yaml
kubectl delete -f pvc.yaml
kubectl delete -f cs.yaml
kubectl delete ns metallb-system
```

## Author
nao-yoshi
