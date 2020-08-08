#!/bin/bash
redis-cli -h 192.168.20.243 slaveof redis-master 6379
exit
