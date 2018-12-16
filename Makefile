VERSION = $(shell git describe --tags)
PACKAGE = github.com/darxkies/freezer
BUILD_IMAGE = darxkies/freezer-build

compile:
	docker build -t $(BUILD_IMAGE) -f docker/build.dockerfile .
	docker run --rm -v $$(pwd):/go/src/$(PACKAGE) $(BUILD_IMAGE)

build-binaries:
	CGO_ENABLED=0 go build -ldflags "-X ${PACKAGE}/version.Version=${VERSION} -s -w" -o freezer ${PACKAGE}/cmd/freezer

watch-and-compile:
	go get github.com/cespare/reflex
	reflex -r '\.go$$' -R '^vendor' -R '^utils/a_utils-packr\.go$$' make build-binaries

clean:
	sudo rm -Rf bin vendor

.PHONY: build clean
