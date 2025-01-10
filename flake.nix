{
  description = "Flake utils demo";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    git-hooks.url = "github:cachix/git-hooks.nix";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    git-hooks,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};

        cml = pkgs.ocamlPackages.buildDunePackage {
          pname = "cml";
          version = "0.1.0";
          duneVersion = "3";
          src = ./.;
          buildInputs = [];
          strictDeps = true;
        };
      in {
        packages = {
          inherit cml;
          default = cml;
        };
        devShells.default = pkgs.mkShellNoCC {
          packages = [
            pkgs.ocamlPackages.utop
            pkgs.fswatch
          ];
          inputsFrom = [ cml ];
        };
        checks = {
          pre-commit-check = git-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              alejandra.enable = true;
              editorconfig.enable = true;
              dune-fmt.enable = true;
            };
          };
        };
        formatter = pkgs.alejandra;
      }
    );
}
