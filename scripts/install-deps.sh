#!/bin/bash

# System update
sudo apt-get update
sudo apt-get upgrade -y

# Install essential tools
sudo apt-get intall -y \ 
	zsh \
	vim \
	git \
	build-essential \
	gdb \
	make \
	curl \
	wget
