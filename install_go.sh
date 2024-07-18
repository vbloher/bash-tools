#!/bin/bash

wget https://golang.org/dl/go1.17.7.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.17.7.linux-amd64.tar.gz
sudo rm go1.17.7.linux-amd64.tar.gz

mkdir -p $HOME/go/bin
PATH=$PATH:/usr/local/go/bin
echo "export PATH=$PATH:$(go env GOPATH)/bin" >> ~/.profile
echo "export GOPATH=$HOME/go" >> ~/.profile
source ~/.profile
