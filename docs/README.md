# Shipyard - Beta

**VERSION=0.1.6**

Run disposable Consul Service Mesh and Kubernetes environments locally in Docker with either Rancher K3s or official
Kubernetes distributions.

**Note:** This tool has currently been tested on Mac OS Catalina, and Ubuntu 19.04.

## Installation
To install run the following command in your terminal:

```bash
➜ curl https://shipyard.demo.gs/install.sh | bash
```

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

## Demo

<iframe width="560" height="315" src="https://www.youtube.com/embed/FK0LtLDQLJc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Running Consul and Kubernetes locally
To start a Kubernetes cluster in Docker with Consul pre-installed run the following command:

```bash
➜ yard up
```

Note: The default is to use the K3s distribution for official Kubernetes use `yard up k8s`

```bash
## Creating K8s cluster in Docker and installing Consul

### Creating Kubernetes cluster, this process will take approximately 2 minutes
#### Create Kubernetes cluster in Docker

Creating cluster "kind" ...
 ✓ Ensuring node image (kindest/node:v1.15.3) 🖼
 ✓ Preparing nodes 📦📦
 ✓ Creating kubeadm config 📜
 ✓ Starting control-plane 🕹️
 ✓ Installing CNI 🔌
 ✓ Installing StorageClass 💾
 ✓ Joining worker nodes 🚜
Cluster creation complete. You can now use the cluster with:

export KUBECONFIG="$(kind get kubeconfig-path --name="kind")"
kubectl cluster-info
#### Waiting for Kubernetes to start

#...

### Setup complete:

To interact with Kubernetes set your KUBECONFIG environment variable
export KUBECONFIG="$HOME/.shipyard/kubeconfig.yml"

Consul can be accessed at: http://localhost:8500

When finished use "yard down" to cleanup and remove resources
```

## Removing your dev cluster

```bash
➜ yard down
```

```bash
Stopping Kubernetes and cleaning resources
Deleting cluster "kind" ...
```

## Tools
If you do not have `kubectl` or `consul` installed you can use the built in tools. The tools run in an interactive
Docker shell and can be accessed by running the `tools` sub command.

This command can also be run with an optional path which is mapped to the 
containers `/work` folder. If no path is specified then the current path is mapped to work.

On Linux environments the tools container runs using the host network, any port on the local system is accessible
from the tools container. All ports exposed in the container i.e. `kubectl port-forward` will be accessible to the
local machine.

Due to limitations of Docker Host networks on Mac platforms Host networking can not be used. Tools on Mac instead
expose the ports 10000-10100 to the local system. To access the host machine the DNS name `host.docker.internal` can
be used.

```bash
➜ yard tools $GOPATH/src/github.com/nicholasjackson/demo-consul-service-mesh/kubernetes/traffic_splitting
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

## Exposing Kubernetes services
To access services and pods running in the Kubernetes cluster `kubectl port-forward` can be used.

Assuming a service called `web-service` which is accessible on port `80` is running in Kubernetes, the following
command can be used to access the service locally using the address `localhost:10000`.

The command will work either using a local version of `kubectl` or using `kubectl` inside the tools container.

```
kubectl port-forward --address 0.0.0.0 svc/web-service 10000:80
```

## Dashboards
The Kubernetes Dashboard and the Consul UI are available to view in your browser

### Kubernetes Dashboard
Point your browser at: [http://localhost:8443](http://localhost:8443)

![](/images/k8s_dashboard.png)

### Consul UI
Point your browser at [http://localhost:8500/ui](http://localhost:8500/ui)

![](/images/consul_ui.png)

## VS Code integration - EXPERIMENTAL
Consul K8s Dev even has integration with VS Code running in your browser.

To start VS Code run:

```
➜ yard vscode
## Starting VSCode in a browser
Starting VS Code

When finished you can stop the VSCode server using the command:
docker kill vscode

affa50cf1b37a95531bc7bf75d503acdf6aaae1374557a3685c87c33817c99b5
```

You can then edit files and use the terminal from a browser based VS Code instance.


![](/images/vscode.png)
