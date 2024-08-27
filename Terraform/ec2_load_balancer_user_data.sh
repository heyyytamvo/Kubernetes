#!/bin/bash
sudo apt install -y nginx
sudo mkdir /etc/nginx/k8s-lb.d
touch /etc/nginx/k8s-lb.d/api-server.conf
echo "include /etc/nginx/k8s-lb.d/*" >> /etc/nginx/nginx.conf
sudo systemctl reload nginx