{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
    buildInputs = with pkgs; [
        cmake
        git
        ninja
        zig
        python314
        python314Packages.pygments
        python314Packages.pyyaml
        flock
        libxml2.dev
        zlib
        xz.dev
    ];

    shellHook = ''
        export LIBXML2_LIBRARY="${pkgs.libxml2.dev}/lib"
        export ZLIB_LIBRARY="${pkgs.zlib}/lib"
        export LIBLZMA_LIBRARY="${pkgs.xz.dev}/lib"

	export CC="${pkgs.zig}/bin/zig cc"
	export CXX="${pkgs.zig}/bin/zig c++"
	export CFLAGS="-target x86_64-windows-gnu"
	export CXXFLAGS="-target x86_64-windows-gnu"

        export CMAKE_PREFIX_PATH="${pkgs.zlib}:${pkgs.xz}:${pkgs.libxml2}:$CMAKE_PREFIX_PATH"
    '';
}
