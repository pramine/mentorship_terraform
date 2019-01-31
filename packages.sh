#!/bin/bash
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

yum update -y
yum install httpd -y 
systemctl start httpd && systemctl enable httpd 