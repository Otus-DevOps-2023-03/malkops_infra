#!/bin/bash
sleep 90
set -e
sudo mv /etc/mongod.conf /etc/mongod.conf_orig
sudo mv /tmp/mongod.conf /etc/mongod.conf
sudo systemctl restart mongod
