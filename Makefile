BIN_NAME=drstd_demo
OUTPUT_DIR=$(DADK_BUILD_CACHE_DIR_DRSTD_DEMO_0_1_0)

TMP_INSTALL_DIR=$(OUTPUT_DIR)/tmp_install
BIN_DIR=$(OUTPUT_DIR)/bin

all: build

build:
	cargo -Z build-std=core,alloc,compiler_builtins build --target ./x86_64-unknown-dragonos.json --release

install:
	cargo -Z build-std=core,alloc,compiler_builtins install --target ./x86_64-unknown-dragonos.json --path . --root $(TMP_INSTALL_DIR)
	mv $(TMP_INSTALL_DIR)/bin/$(BIN_NAME) $(BIN_DIR)/$(BIN_NAME)
	rm -rf $(TMP_INSTALL_DIR)

clean:
	cargo clean

fmt:
	cargo fmt

fmt-check:
	cargo fmt --check

check:
	cargo -Z build-std=core,alloc,compiler_builtins check --workspace --message-format=json --target ./x86_64-unknown-dragonos.json
