{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
    buildInputs = with pkgs; [
        cmake
        dos2unix
        git
        flock
        libxml2
        ninja
        python314
        python314Packages.pygments
        python314Packages.pyyaml
        zig
        zlib
        xz
    ];

    shellHook = ''
        export CMAKE_PREFIX_PATH="${pkgs.zlib}:${pkgs.xz}:${pkgs.libxml2}:$CMAKE_PREFIX_PATH"
    '';
}