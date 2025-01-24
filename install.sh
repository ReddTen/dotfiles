#!/bin/bash

set -e # Exit on error

echo "Starting development environment setup..."

# Install system dependencies
./scripts/install-deps.sh

# Setup shell environment
./scripts/setup-env.sh

# Install fonts
/fonts/install-fonts.sh
