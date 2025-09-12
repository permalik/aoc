{
  description = "aoc-cpp";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        name = "aoc-cpp";
        src = ./.;
        pkgs = nixpkgs.legacyPackages.${system};
        # buildInputs = with pkgs; [];
        nativeBuildInputs = with pkgs; [clang-tools];
      in {
        packages = {
          default = let
            inherit (pkgs) clangStdenv;
          in
            clangStdenv.mkDerivation {
              name = "aoc-cpp";
              src = pkgs.lib.cleanSource ./.;
              # buildInputs = with pkgs; [];

              buildPhase = with pkgs; ''
                clang++ ./src/main.cpp -o aoc-cpp
              '';

              installPhase = ''
                mkdir -p $out/bin
                cp aoc-cpp $out/bin/aoc-cpp
              '';
            };
        };

        devShells.default = pkgs.mkShell.override {stdenv = pkgs.clangStdenv;} {
          packages = with pkgs; [pkg-config clang-tools alejandra pre-commit];
          inputsFrom = [self.packages.${system}.default];
          # buildInputs = [
          #   pkgs.alejandra
          #   pkgs.gcc
          #   pkgs.gnumake
          #   pkgs.pkg-config
          #   pkgs.llvmPackages_19.clang-tools
          #   # pkgs.gdb
          #   # pkgs.valgrind
          # ];

          shellHook = with pkgs; ''
            cd aoc-cpp

            . .bashrc
          '';
        };
      }
    );
}
