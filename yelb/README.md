# yelb demo
Sample yaml for yelb application.

```
k create ns yelb
k create ns metallb-system
k create secret generic -n metallb-system memberlist --from-literal=secretkey="\$(openssl rand -base64 128)"
k apply -n metallb-system -f lb.yaml
k apply -n metallb-system -f lb-config.yaml
k apply -f yelb-lb.yaml
k -n yelb get svc

ssh root@[TKG-DEMO-APPLIANCE-IP] -L 8081:192.168.2.245:80
```
