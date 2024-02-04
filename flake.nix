{
  description = "My custom Docker image";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;

  outputs = { self, nixpkgs, ... }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };
    in
    {
      app = pkgs.dockerTools.buildImage {
        name = "gitea.blezz-tech.ru/blezz-tech/actions";
        tag = "latest";
        created = "now";
        copyToRoot = pkgs.buildEnv {
          name = "image-root";
          paths = with pkgs; [
            bash
            zsh
            coreutils-full
            nushell
            pandoc
            nodejs_20
            git
            vim
            openssh
            openssl
            python3
            perl
            gnupg
            cacert
          ];
          pathsToLink = [ "/bin" ];
        };

        config.Cmd = [ "/bin/zsh" ];
      };
    };
}
