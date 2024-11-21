.PHONY: configure
configure:
	cmake -B ./build

.PHONY: build
build:
	cmake --build ./build --target all

.PHONY: test
test:
	cmake --build ./build --target all --target test

.PHONY: run
run:
	./build/main
