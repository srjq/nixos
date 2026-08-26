{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
    unzip
    neovim
    caelestia-shell
  ];

  nixpkgs.config.allowUnfree = true;
}
