

IMAGE=pyccel
TAG=beta
TARGET=$(IMAGE):$(TAG)

REGISTRIES=docker.io/pyccel ghcr.io/pyccel


# for compatibility
CTR_RUNTIME=docker

prepare:
	sudo apt-get install -y jq git

full-cycle: build-all push-all

build-all:
	bin/build-all

push-all:
	bin/push-all

build: clean
	$(CTR_RUNTIME) build -t $(TARGET) .

tag:
	for t in $(REGISTRIES) ; do \
	  $(CTR_RUNTIME) tag $(TARGET) $$t/$(TARGET) ; \
	done

untag:
	for t in $(REGISTRIES) ; do \
	  $(CTR_RUNTIME) rmi $$t/$(TARGET) || true ; \
	done

push:
	for t in $(REGISTRIES) ; do \
	  $(CTR_RUNTIME) push $$t/$(TARGET) ; \
	done


test:
	$(CTR_RUNTIME) run --rm -it $(TARGET) bash

clean:
	$(CTR_RUNTIME) rmi $(TARGET) || true


