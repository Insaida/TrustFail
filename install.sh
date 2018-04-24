#!/bin/sh

#Development version
#git clone https://github.com/secdev/scapy


# latst release
# install scapy, matplotlib and cryptography 
pip install scapy
 
pip install matplotlib

pip install cryptography

git clone 

#Install Hashcat from Git hub
git clone https://github.com/hashcat/hashcat.git
mkdir -p hashcat/deps
git clone https://github.com/KhronosGroup/OpenCL-Headers.git hashcat/deps/OpenCL
cd hashcat/ && make
./hashcat --version
./hashcat -b -D 1,2
#./example0.sh

#Install hashcat utils
git clone https://github.com/hashcat/hashcat-utils.git
mkdir -p hashcat-utils
cd hashcat-utils && make

