THIS_GOVERSION=$(shell go version)
THIS_GOOS=$(word 1,$(subst /, ,$(lastword $(THIS_GOVERSION))))
THIS_GOARCH=$(word 2,$(subst /, ,$(lastword $(THIS_GOVERSION))))
GOOS=$(THIS_GOOS)
GOARCH=$(THIS_GOARCH)
ifeq ($(GOOS),windows)
EXT=.exe
else
EXT=
endif

PRODUCT=hello
BUILD_DIR=$(CURDIR)/build
TARGET_DIR=$(BUILD_DIR)/$(PRODUCT)-$(GOOS)-$(GOARCH)
EXEFILE=$(TARGET_DIR)/hello$(EXT)

.PHONY: test
test:
	go test ./...

.PHONY: run
run:
	go run ./cmd/hello/main.go

.PHONY: build
build: $(EXEFILE)

$(EXEFILE):
	echo $(GOOS) $(GOARCH)
	go build -o $@ ./cmd/hello

.PHONY: clean
clean:
	rm -fR $(BUILD_DIR)
