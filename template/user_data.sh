#!/bin/bash
sudo su
yum -y update
yum -y install nginx
sudo systemctl enable nginx
sudo systemctl start nginx