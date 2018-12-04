all: make run

makepre:
	swiftc swiftepc.swift -o swiftepc

make: makepre
	./swiftepc *.swift -o network

run:
	./network