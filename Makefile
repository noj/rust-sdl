RUSTC ?= rustc
RUSTFLAGS ?=

RUST_SRC = $(shell find . -type f -name '*.rs')

.PHONY: all
all: libsdl.dummy

libsdl.dummy: sdl.rc $(RUST_SRC)
	$(RUSTC) $(RUSTFLAGS) $< -o $@
	touch $@

sdl-test: sdl.rc $(RUST_SRC)
	$(RUSTC) $(RUSTFLAGS) $< -o $@ --test

check: sdl-test
	./sdl-test

.PHONY: clean
clean:
	rm -f sdl-test *.so *.dylib *.dll *.dummy
