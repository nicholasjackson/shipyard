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

## Demo

<iframe width="560" height="315" src="https://www.youtube.com/embed/FK0LtLDQLJc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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
Docker shell and can be accessed by running the `tools` sub command with an optional path which is mapped to the 
container `/work` folder. If no path is specified then the current path is mapped to work.

```
➜ consul-k8s-dev tools $GOPATH/src/github.com/nicholasjackson/demo-consul-service-mesh/kubernetes/traffic_splitting
Running tools container

Mapping local folder to tools container
root@docker-desktop:/work# kubectl get pods
NAME                                                              READY   STATUS      RESTARTS   AGE
api-deployment-v1-5bd59988f8-sfx46                                2/2     Running     0          11m
api-deployment-v2-6dd66bdb6f-h6m92                                2/2     Running     0          11m
central-config-split-fmb4m                                        0/1     Completed   0          11m
consul-consul-connect-injector-webhook-deployment-c46d9888vzkpb   1/1     Running     0          22m
consul-consul-qpj6v                                               1/1     Running     0          22m
consul-consul-server-0                                            1/1     Running     0          22m
web-deployment-66488ddb9-vsf4n                                    2/2     Running     0          11m
root@docker-desktop:/work#
```
