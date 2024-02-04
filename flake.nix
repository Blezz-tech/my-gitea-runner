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
            bash coreutils-full nushell pandoc nodejs_20
            git vim
          ];
          pathsToLink = [ "/bin" ];
        };

        config.Cmd = [ "/bin/bash" ];
      };
    };
}
