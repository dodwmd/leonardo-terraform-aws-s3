# Makefile for Terratest

.PHONY: test

# Install necessary Go modules
install:
	go mod tidy

# Run Terratest
test:
	go test -v ./tests
