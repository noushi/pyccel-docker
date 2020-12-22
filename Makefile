

TARGET=pyccel

# for compatibility
CTR_RUNTIME=docker

build: clean
	$(CTR_RUNTIME) build -t $(TARGET) .


test:
	$(CTR_RUNTIME) run --rm -it $(TARGET) bash

clean:
	$(CTR_RUNTIME) rmi $(TARGET) || true


