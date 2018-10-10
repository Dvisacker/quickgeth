#! /bin/sh
# Ubuntu 16.04

echo HI DAVID!
echo THIS IS YOUR SERVER CONFIG BUDDY
echo 8============D

# Setting Environment Variables

USERNAME="david"

# Defining Access Control Group for UFW

CLIENT_SERVER_IP = "*"
OFFICE_IP = "121.129.31.23"
# MORE_IP = <IP ADDRESS>


ACCESS_CONTROL_GROUP = (CLIENT_SERVER_IP OFFICE_IP)
# Updating OS

sudo apt-get update

# Installing nginx

sudo apt-get install nginx

# Setting up nginx config with Python
# Using Python here for more elegant string manipulations
sudo apt-get isntall python
python config_nginx.py

# Creating Password
sudo htpasswd -c /etc/nginx/protected.htpasswd $USERNAME

# Installing Certbot

sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install python-certbot-nginx

# Installing Geth

sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum

# Installing Uncomplicated Firewall

sudo apt-get install ufw

# Negative-based security for the win!

sudo ufw default deny incoming
sudo ufw default allow outgoing

# Turning on firewall for Access Control Group

for ip in "${ACCESS_CONTROL_GROUP[@]}"
do
  sudo ufw alow from $ip to any port 8545
done

sudo ufw enable

# Startup Geth in Background

geth &
