{
  description = "SantosLabs Infrastructure";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    inputs@{ nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            git-crypt
            openssl
            pre-commit

            # Terraform + Linters
            terraform
            terraform-docs
            terraform-lsp
            tflint
            tfsec

            # Nixfmt
            nixfmt
          ];

          shellHook = ''
            alias tf='terraform'
          '';
        };
      }
    );
}
