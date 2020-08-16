#!/bin/bash

wget https://github.com/vmware-tanzu/octant/releases/download/v0.15.0/octant_0.15.0_Linux-64bit.rpm
sudo rpm -i octant_0.15.0_Linux-64bit.rpm
OCTANT_LISTENER_ADDR=127.0.0.1:7777 ./octant
