#!/bin/bash

# yum -y zsh git gcc gcc-c++ clang clang-devel autoconf libtool automake make kernel-devel cmake python-devel python36-devel boost clang-devel ncurses-devel tmux
# apt -y install zsh git gcc gcc-c++ clang clang-devel autoconf libtool automake make kernel-devel cmake python-devel python36-devel boost clang-devel ncurses-devel tmux

pushd ~/


if [ -f /etc/redhat-release ]; then
  sudo yum install -y centos-release-dotnet
  sudo yum install -y rh-dotnet50-dotnet

  if [ -f ~/.zshrc ]; then
    sed -i '/source \/opt\/rh\/rh-dotnet50\/enable/d' ~/.zshrc
    sh -c 'echo "source /opt/rh/rh-dotnet50/enable" >> ~/.zshrc'
  else
    sed -i '/source \/opt\/rh\/rh-dotnet50\/enable/d' ~/.bash_profile
    sh -c 'echo "source /opt/rh/rh-dotnet50/enable" >> ~/.bash_profile'
  fi

  source /opt/rh/rh-dotnet50/enable
  # 全局生效 写入 /etc/profile 重启机器
fi

if [ -f /etc/lsb-release ]; then
    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
    sudo apt-get update
    sudo apt-get install -y apt-transport-https
    sudo apt-get update
    sudo apt-get install -y dotnet-sdk-5.0
fi

popd

