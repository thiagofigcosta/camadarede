all: make run

makepre:
	swiftc swiftepc.swift -o swiftepc

make: makepre
	./swiftepc rede.swift -o network

run:
	./network