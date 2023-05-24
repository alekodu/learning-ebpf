#!/bin/sh

sudo apt-get update -y

## Setup python and dependencies
# Make sure python3 is already installed
sudo apt install python3-pip -y
sudo apt install python3-bpfcc

## Install make and other essential tools
sudo apt-get install build-essential -y
sudo apt install linux-tools-common
sudo apt install linux-cloud-tools-generic
sudo apt install linux-tools-5.15.0-72-generic -y
sudo apt install linux-cloud-tools-5.15.0-72-generic -y


## Building libbpf and installing header files
# Install libbpf dependencies
sudo apt-get install -y libelf-dev
sudo apt-get install -y zlib
sudo apt-get install -y pkg-config
sudo apt-get install -y gcc-multilib

# Compile and install libbpf
cd ../libbpf/src
sudo mkdir build root
sudo BUILD_STATIC_ONLY=y OBJDIR=build DESTDIR=root make install

# Compile and install bpftool
cd ..
#git clone --recurse-submodules https://github.com/libbpf/bpftool.git
cd bpftool/src 
sudo make install

# Install clang
sudo apt-get install clang -y
sudo apt install libbpf-dev -y
sudo apt install llvm -y