#!/bin/bash
VERSION=0.1.1

echo "## Installing Consul K8s"
echo ""

echo "### Remove existing install"
rm -rf $HOME/.consul_k8s
rm -f /usr/local/bin/consul-k8s-dev
echo ""

echo "### Download application"
wget https://github.com/nicholasjackson/consul-k8s-dev/archive/v$VERSION.tar.gz -O /tmp/consul-k8s.tar.gz
tar -zxf /tmp/consul-k8s.tar.gz -C /tmp/
echo ""

echo "### Install application config to $HOME/.consul_k8s"
mv /tmp/consul-k8s-dev-$VERSION/install $HOME/.consul_k8s
echo ""

echo "### Linking application to /usr/local/bin"
echo "#### You may be prompted for your password!###"
sudo ln -s $HOME/.consul_k8s/consul-k8s-dev /usr/local/bin
echo ""

echo "## Instalation complete"
echo "To create a local Kubernetes and Consul cluster run:"
echo ""
echo "consul-k8s-dev up"
