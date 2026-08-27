{ ... }:

{
  services.navidrome = {
    enable = true;

    settings = {
      MusicFolder = "/srv/navidrome/library";
    };

    openFirewall = true;
  };
}
