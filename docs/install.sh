#!/bin/bash

echo "Installing Consul K8s"

echo "Copy Assets"
wget https://github.com/nicholasjackson/consul-k8s-dev/archive/v0.1.0.tar.gz -O /tmp/consul-k8s.tar.gz
tar -zxf /tmp/consul-k8s.tar.gz

mkdir $HOME/.consul_k8s

mv /tmp/consul-k8s/install/* $HOME/.consul_k8s
ln -s $HOME/.consul_k8s/consul-k8s /usr/local/bin
