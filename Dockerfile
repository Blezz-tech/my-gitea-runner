FROM nixos/nix

MAINTAINER blezz-tech markus.jenya04@yandex.ru

RUN nix-channel --update

RUN mkdir -p ~/.config/nix/

RUN echo "experimental-features = nix-command" > ~/.config/nix/nix.conf

RUN nix-env -f '<nixpkgs>' -iA 'nushell' 'pandoc'
