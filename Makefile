.PHONY: default all install test

default: all
all: install test

install:
	crystal deps

test:
	crystal spec -v
