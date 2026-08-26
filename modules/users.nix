{ pkgs, ... }:

{
  users.users."suraj" = {
    isNormalUser = true;
    description = "Suraj Sharma";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [

    ];
  };
}
