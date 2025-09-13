{
  description = "aoc-ocaml";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pname = "aoc-ocaml";
        version = "0.0.1";
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = false;
        };
      in {
        packages.default = pkgs.stdenv.mkDerivation {
          pname = pname;
          version = version;
          src = ./aoc_ocaml;

          buildInputs = [pkgs.ocaml pkgs.dune_3];

          buildPhase = ''
            dune build
          '';

          installPhase = ''
            dune install --prefix $out
          '';
        };

        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.alejandra
            pkgs.ocaml
            pkgs.dune_3
          ];

          shellHook = ''
            cd aoc-ocaml
            . .bashrc
          '';
        };
      }
    );
}
