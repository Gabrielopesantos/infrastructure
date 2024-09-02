{
  description = "SantosLabs Infrastructure NixOS Deployments";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs@{ nixpkgs, flake-utils, ... }:
    {
      colmena = import ./nixos/colmena.nix (inputs // {
        terraform-outputs = nixpkgs.lib.importJSON ./terraform-output.json;
      });
    } //
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            cargo
            colmena
            git-crypt
            openssl
            pre-commit
            sops

            # Terraform + Linters
            terraform
            terraform-docs
            terraform-lsp
            tflint
            tfsec
            nixfmt-classic
          ];
        };
      });
}
