if not exist "llvm-project\" (
    git clone --depth 1 https://github.com/llvm/llvm-project.git
)

# Enter LLVM dir
cd llvm-project

# Configure LLVM
cmake -S llvm -B build `
    -G Ninja `
    -DCMAKE_BUILD_TYPE=Release `
    --log-level=DEBUG

# Build
cmake --build build --parallel