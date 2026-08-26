{ pkgs, lib, inputs, ... }:

let
  loginManager = "tuigreet";
in
{
  imports = [
    inputs.silentSDDM.nixosModules.default
  ];

  assertions = [
    {
      assertion = builtins.elem loginManager [ "sddm" "tuigreet" ];
      message = "loginManager must be one of: sddm, tuigreet";
    }
  ];

  programs.silentSDDM = {
    enable = loginManager == "sddm";
    theme = "rei";
  };

  services.displayManager.sddm = {
    enable = loginManager == "sddm";
    wayland.enable = loginManager == "sddm";
  };

  services.greetd = {
    enable = loginManager == "tuigreet";

    settings.default_session = {
      user = "greeter";
      command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd 'start-hyprland >/dev/null 2>&1'";
    };
  };
}
