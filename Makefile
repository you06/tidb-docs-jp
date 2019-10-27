.PHONY: prepare doc

default: all

all: prepare doc

prepare:
	cargo install mdbook --debug --force
	cargo install mdbook-linkcheck --debug --force

doc:
	mdbook build
