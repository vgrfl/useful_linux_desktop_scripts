#!/bin/bash
# This script assumes that there is no swap space or file currently in use.
# Also please ensure that enough disk space is available in the root partition to accomodate a swap file of size specified below
swap_file_size=8G   # set file size as required
sudo fallocate -l $swap_file_size /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
# Make settings permanent
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
