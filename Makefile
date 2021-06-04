.PHONY: all

GOLANG_VERSION ?= 1.16.4
CUE_VERSION ?= 0.4.1-beta.1
BUILDDIR ?= bin
# darwin/amd64 or linux/amd64 (or both)
PLATFORM ?= local

all: | $(BUILDDIR)
	docker buildx build \
		--target=cue-releaser \
		--output=type=local,dest=$(BUILDDIR)/ \
		--platform $(PLATFORM) \
		--build-arg GOLANG_VERSION=$(GOLANG_VERSION) \
		--build-arg CUE_VERSION=$(CUE_VERSION) \
		-f Dockerfile.multiarch \
		.

$(BUILDDIR):
	mkdir -p $@
