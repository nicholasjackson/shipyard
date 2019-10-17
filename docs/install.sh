#!/bin/bash
VERSION=0.1.1

echo "Installing Consul K8s"

echo "Copy Assets"
wget https://github.com/nicholasjackson/consul-k8s-dev/archive/v$VERSION.tar.gz -O /tmp/consul-k8s.tar.gz
tar -zxf /tmp/consul-k8s.tar.gz -C /tmp/

echo "Remove existing install"
rm -rf $HOME/.consul_k8s
rm -f /usr/local/bin/consul-k8s-dev

echo "Copying config"
mv /tmp/consul-k8s-dev-$VERSION/install $HOME/.consul_k8s
ln -s $HOME/.consul_k8s/consul-k8s-dev /usr/local/bin
