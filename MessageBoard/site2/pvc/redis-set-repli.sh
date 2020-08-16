#!/bin/bash
redis-cli -h 192.168.20.243 slaveof 192.168.10.242 6379
exit
