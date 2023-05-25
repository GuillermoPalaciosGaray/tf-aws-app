#!/bin/bash
sudo su
yum -y update
amazon-linux-extras install nginx1 -y
sudo systemctl enable nginx
sudo systemctl start nginx