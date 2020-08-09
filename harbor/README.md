harbor


https://github.com/goharbor/harbor-helm



helm install harbor --namespace harbor-system harbor/harbor \
  --set expose.type=loadBalancer \
  --set expose.tls.enabled=false \
  --set persistence.enabled=false \
  --set externalURL=http://$Worker_IP:80 \
  --set harborAdminPassword=VMware1!


Delete
helm delete harbor --namespace harbor-system harbor/harbor
