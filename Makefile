GO     ?= go
TAGS   ?=
GOFLAGS = $(if $(TAGS),-tags $(TAGS))

.PHONY: build vet test lint fmt

build:
	$(GO) build $(GOFLAGS) ./...

vet:
	$(GO) vet $(GOFLAGS) ./...

test:
	$(GO) test $(GOFLAGS) -race -count=1 ./...

lint:
	$(GO) tool staticcheck $(GOFLAGS) ./...

fmt:
	$(GO) tool goimports -w .
