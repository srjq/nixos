{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
    unzip
    zip
    neovim
    caelestia-shell
  ];

  nixpkgs.config.allowUnfree = true;
}
