#!/bin/bash
VERSION=0.2.4

echo "## Installing Shipyard Version: $VERSION" 
echo ""

echo "### Remove existing install"
echo "#### You may be prompted for your password!###"
sudo rm -f /usr/local/bin/yard
sudo rm -rf $HOME/.shipyard
echo ""

echo "### Download application"
wget https://github.com/nicholasjackson/shipyard/archive/v$VERSION.tar.gz -O /tmp/shipyard.tar.gz
tar -zxf /tmp/shipyard.tar.gz -C /tmp/
echo ""

echo "### Install application config to $HOME/.shipyard"
mv /tmp/shipyard-$VERSION/install $HOME/.shipyard
echo ""

echo "### Linking application to /usr/local/bin"
echo "#### You may be prompted for your password!###"
sudo ln -s $HOME/.shipyard/yard /usr/local/bin
echo ""

echo "## Instalation complete"
echo "To create a local Kubernetes and Consul cluster run:"
echo ""
echo "yard up"
