---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
---

# Shipyard

Shipyard allows you to create Kubernetes and Consul service mesh clusters running locally with Docker.

## Installation

To install Shipyard run the following command in your terminal:

<h3>curl https://shipyard.demo.gs/install.sh | bash</h3>

Shipyard will download the latest version and install its configuration into `$HOME/.shipyard` and binary
file into `/usr/local/bin`.

```bash
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   555  100   555    0     0   2381      0 --:--:-- --:--:-- --:--:--  2381
Installing Consul K8s

#...


### Install application config to /Users/nicj/.shipyard

### Linking application to /usr/local/bin
#### You may be prompted for your password!###

## Instalation complete
To create a local Kubernetes and Consul cluster run:

yard up
```

## Quick Start
To create a Kubernetes cluster with Consul pre-installed use the following command:

```bash
$ yard up
```