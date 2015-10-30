.PHONY: default all install clean test

default: all
all: clean install test

install:
	crystal deps

test:
	crystal spec -v

clean:
	rm -rf .crystal
	rm -rf .shard
	rm -rf libs
