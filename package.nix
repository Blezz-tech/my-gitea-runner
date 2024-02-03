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
      zsh
      coreutils-full
      nushell
      pandoc
      nodejs_20
      git
    ];
    pathsToLink = [ "/bin" ];
  };

  config.Cmd = [ "/bin/zsh" ];
}
