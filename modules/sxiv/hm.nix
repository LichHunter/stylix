{ config, lib, ... }:
{
  options.stylix.targets.sxiv.enable =
    config.lib.stylix.mkEnableTarget "Sxiv" true;

  config = lib.mkIf (config.stylix.enable && config.stylix.targets.sxiv.enable) {
    xresources.properties =
      let
        inherit (config.lib.stylix) colors;
        inherit (config.stylix) fonts;
      in
      {
        "Sxiv.foreground" = "#${colors.base01}";
        "Sxiv.background" = "#${colors.base04}";
        "Sxiv.font" = "${fonts.sansSerif.name}-${toString fonts.sizes.applications}";
      };
  };
}
