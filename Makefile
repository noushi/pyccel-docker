

IMAGE=pyccel
TAG=beta
TARGET=$(IMAGE):$(TAG)

REGISTRIES=docker.io/pyccel ghcr.io/pyccel


# for compatibility
CTR_RUNTIME=docker

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


