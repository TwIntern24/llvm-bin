#!/usr/bin/env bash
set -e

# Always run relative to this script's directory
cd "$(dirname "$(realpath "$0")")"

# Clone LLVM
if [ ! -d "llvm-project" ]; then
    git clone --depth 1 https://github.com/llvm/llvm-project.git
fi

# Enter LLVM dir
cd llvm-project

# Configure LLVM
cmake -S llvm -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
    --log-level=DEBUG

# Build
cmake --build build --parallel
