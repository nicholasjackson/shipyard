# Consul K8s Dev
Run Consul and Kubernetes locally in Docker

## Installation
To install run the following command in your terminal:

```
➜ curl http://consul-k8s.demo.gs/install.sh | bash
```

```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   555  100   555    0     0   2381      0 --:--:-- --:--:-- --:--:--  2381
Installing Consul K8s

#...

Remove existing install
Copying config
Instalation complete
To a local Kubernetes cluster run:

consul-k8s-dev up
```

## Running Consul and Kubernetes locally
To start a Kubernetes cluster in Docker with Consul pre-installed run the following command:

```
➜ consul-k8s-dev up
```

```
Creating K8s cluster in Docker and installing Consul
Starting test environment, this process will take approximately 2 minutes
Creating cluster "kind" ...
 ✓ Ensuring node image (kindest/node:v1.15.3) 🖼

#...

Setup complete:

To interact with Kubernetes set your KUBECONFIG environment variable
export KUBECONFIG=\"$HOME/.consul_k8s/kubeconfig.yml

Consul can be accessed at: http://localhost:8500

When finished use ./run.sh down to cleanup and remove resources
```

## Removing your dev cluster

```
➜ consul-k8s-dev down
```

```
Stopping Kubernetes and cleaning resources
Deleting cluster "kind" ...
```

## Tools
If you do not have `kubectl` or `consul` installed you can use the built in tools. The tools run in an interactive
Docker shell and can be accessed by running the command:

```

```
