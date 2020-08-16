#!/bin/bash

### edit dowonloaded filename
TKGCLI="tkg-linux-amd64-v1.1.2-vmware.1.gz"
CLI="tkg-linux-amd64-v1.1.2-vmware.1"

gzip -d $TKGCLI
mv ./$CLI /usr/local/bin/tkg
chmod +x /usr/local/bin/tkg
