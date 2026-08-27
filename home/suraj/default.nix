{
  imports = [
    ./caelestia.nix
    ./fastfetch.nix
    ./fish.nix
    ./foot.nix
    ./git.nix
    ./packages.nix
    ./starship.nix
    ./tools.nix
    ./zen.nix
    ./zoxide.nix
    ./hyprland/default.nix
  ];

  home.username = "suraj";
  home.homeDirectory = "/home/suraj";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
