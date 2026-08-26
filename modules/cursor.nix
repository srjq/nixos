{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
  ];

  environment.variables = {
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "24";
  };
}
