#!/bin/bash

if [ -f /etc/redhat-release ]; then
    # su root
    wget --no-check-certificate -O /opt/bbr.sh https://github.com/brinkqiang/across/raw/master/bbr.sh
    chmod 755 /opt/bbr.sh
    /opt/bbr.sh

    # reboot
    # sysctl net.ipv4.tcp_available_congestion_control
    # sysctl net.ipv4.tcp_congestion_control
    # sysctl net.core.default_qdisc
    # lsmod | grep bbr

    # view
    # net.ipv4.tcp_available_congestion_control = bbr cubic reno
    # net.ipv4.tcp_congestion_control = bbr
    # net.core.default_qdisc = fq
    # tcp_bbr                20480  3
fi

if [ -f /etc/lsb-release ]; then
    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
    sudo apt-get update
    sudo apt-get install -y apt-transport-https
    sudo apt-get update
    sudo apt-get install -y dotnet-sdk-5.0
fi
