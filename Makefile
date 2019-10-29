VERSION=0.2.0
IMAGE_TOOLS=nicholasjackson/consul-k8s-tools
IMAGE_VSCODE=nicholasjackson/code-server

build_tools:
	docker build -t $(IMAGE_TOOLS):$(VERSION) -f ./dockerfiles/Dockerfile-tools ./dockerfiles
	docker tag $(IMAGE_TOOLS):$(VERSION) $(IMAGE_TOOLS):latest

push_tools:
	docker push $(IMAGE_TOOLS):$(VERSION)
	docker push $(IMAGE_TOOLS):latest

build_and_push_tools: build_tools push_tools

build_vscode:
	docker build -t $(IMAGE_VSCODE):$(VERSION) -f ./dockerfiles/Dockerfile-vscode ./dockerfiles
	docker tag $(IMAGE_VSCODE):$(VERSION) $(IMAGE_VSCODE):latest

push_vscode:
	docker push $(IMAGE_VSCODE):$(VERSION)
	docker push $(IMAGE_VSCODE):latest

build_and_push_vscode: build_vscode push_vscode

update_version:
	sed -i.bak 's/^VERSION=.*/VERSION=$(version)/' ./Makefile
	rm ./Makefile.bak

	sed -i.bak 's/^VERSION=.*/VERSION=$(version)/' ./docs/install.sh
	rm ./docs/install.sh.bak

	sed -i.bak 's/^VERSION=.*/VERSION=$(version)/' ./install/yard
	rm ./install/yard.bak
	
	sed -i.bak 's/^\*\*VERSION=.*/\*\*VERSION=$(version)\*\*/' ./docs/index.md
	rm ./docs/index.md.bak

update_version_number_and_push: 
ifndef version
	$(error version is not set)
endif
	
	echo "Updating to version: $(version)"
	
	echo "$(version)" > ./docs/latest_version.html

	$(MAKE) update_version version=$(version)
	$(MAKE) build_and_push_vscode 
	$(MAKE) build_and_push_tools

	git add .
	git commit -m "Update version $(version)"
	git push
	git tag v$(version)
	git push origin v$(version)
