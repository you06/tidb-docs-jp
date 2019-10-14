.PHONY: prepare doc

default: all

all: prepare doc

prepare:
	cargo install mdbook --vers '0.3.1' --debug --force
	cargo install mdbook-linkcheck --vers '0.3.1' --debug --force

doc:
	mdbook build
