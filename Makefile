VERSION=0.1.2
IMAGE=nicholasjackson/consul-k8s-tools

build_tools:
	docker build -t $(IMAGE):$(VERSION) -f ./dockerfiles/Dockerfile-tools .

push_tools:
	docker push $(IMAGE):$(VERSION)

build_and_push: build_tools push_tools

update_version_number:
	sed -i.bak 's/^VERSION=.*/VERSION=$(version)/' ./Makefile
	rm ./Makefile.bak

	sed -i.bak 's/^VERSION=.*/VERSION=$(version)/' ./docs/install.sh
	rm ./docs/install.sh.bak

	sed -i.bak 's/^VERSION=.*/VERSION=$(version)/' ./install/consul-k8s-dev
	rm ./install/consul-k8s-dev.bak
	
	echo "$(version)" > ./docs/latest_version.html
