#!/bin/bash
sudo yum update -y
sudo yum install -y vim
sudo yum install -y httpd
sudo cd /home/ec2-user
sudo touch test{1..5}.txt