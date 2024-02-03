{ pkgs ? import <nixpkgs> { }
}:

pkgs.dockerTools.buildImage {
  name = "gitea.blezz-tech.ru/blezz-tech/actions";
  tag = "latest";
  created = "now";
  copyToRoot = pkgs.buildEnv {
    name = "image-root";
    paths = with pkgs; [
      bash
      coreutils-full
      nushell
      pandoc
      nodejs
      git
    ];
    pathsToLink = [ "/bin" ];
  };

  config.Cmd = [ "/bin/bash" ];
}
