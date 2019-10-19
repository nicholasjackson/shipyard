VERSION=0.1.5
IMAGE_TOOLS=nicholasjackson/consul-k8s-tools
IMAGE_VSCODE=nicholasjackson/code-server

build_tools:
	docker build -t $(IMAGE_TOOLS):$(VERSION) -f ./dockerfiles/Dockerfile-tools .
	docker tag $(IMAGE_TOOLS):$(VERSION) $(IMAGE_TOOLS):latest

push_tools:
	docker push $(IMAGE_TOOLS):$(VERSION)
	docker push $(IMAGE_TOOLS):latest

build_and_push_tools: build_tools push_tools

build_vscode:
	docker build -t $(IMAGE_VSCODE):$(VERSION) -f ./dockerfiles/Dockerfile-vscode .
	docker tag $(IMAGE_VSCODE):$(VERSION) $(IMAGE_VSCODE):latest

push_vscode:
	docker push $(IMAGE_VSCODE):$(VERSION)
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
