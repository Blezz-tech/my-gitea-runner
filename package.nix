{ pkgs ? import <nixpkgs> { }
}:

pkgs.dockerTools.buildImage {
  name = "test";
  tag = "latest";
  created = "now";
  copyToRoot = with pkgs.dockerTools; [
    usrBinEnv
    binSh
    caCertificates
    fakeNss
  ];

  config.Cmd = [ "/bin/sh" ];
}