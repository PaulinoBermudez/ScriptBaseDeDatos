#!/bin/bash

sudo cd /etc/systemd/system/

sudo systemctl stop oracle.service
sudo systemctl start oracle.service
sudo systemctl enable oracle.service
sudo systemctl daemon-reload