#!/bin/bash
sudo su
apt-get -y update
apt-get -y install nginx
sudo systemctl enable nginx
sudo systemctl start nginx