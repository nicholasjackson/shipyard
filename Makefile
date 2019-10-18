VERSION=0.1.3
IMAGE_TOOLS=nicholasjackson/consul-k8s-tools
IMAGE_VSCODE=nicholasjackson/code-server

build_tools:
	docker build -t $(IMAGE_TOOLS):$(VERSION) -f ./dockerfiles/Dockerfile-tools .

push_tools:
	docker push $(IMAGE_TOOLS):$(VERSION)

build_and_push_tools: build_tools push_tools

build_vscode:
	docker build -t $(IMAGE_VSCODE):latest -f ./dockerfiles/Dockerfile-vscode .

push_vscode:
	docker push $(IMAGE_VSCODE):latest

build_and_push_vscode: build_vscode push_vscode

update_version_number:
	sed -i.bak 's/^VERSION=.*/VERSION=$(version)/' ./Makefile
	rm ./Makefile.bak

	sed -i.bak 's/^VERSION=.*/VERSION=$(version)/' ./docs/install.sh
	rm ./docs/install.sh.bak

	sed -i.bak 's/^VERSION=.*/VERSION=$(version)/' ./install/consul-k8s-dev
	rm ./install/consul-k8s-dev.bak
	
	echo "$(version)" > ./docs/latest_version.html
