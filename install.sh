#!/bin/bash

if [ -f /etc/redhat-release ]; then
    sudo yum install -y centos-release-dotnet
    sudo yum install -y rh-dotnet50-dotnet
fi

if [ -f /etc/lsb-release ]; then
    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
    sudo apt-get update
    sudo apt-get install -y apt-transport-https
    sudo apt-get update
    sudo apt-get install -y dotnet-sdk-5.0
fi
