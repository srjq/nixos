{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware.nix

    ../../modules/users.nix
    ../../modules/packages.nix
    ../../modules/fonts.nix
    ../../modules/login.nix
    ../../modules/desktop.nix
    ../../modules/cursor.nix
    ../../modules/networking.nix

    ../../services/jellyfin.nix
    ../../services/navidrome.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.blacklistedKernelModules = [
    "nouveau"
  ];

  # Hostname
  networking.hostName = "nixos";
  
  # Networking
  networking.networkmanager.enable = true;

  # TimeZone
  time.timeZone = "Asia/Kolkata";

  # Internationalisation Properties
  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Nix Experimental Features - Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # NixOS Version
  system.stateVersion = "26.05";
}
