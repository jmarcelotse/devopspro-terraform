#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl
sudo apt install -y nginx
curl -fsSL https://get.docker.com | sudo sh