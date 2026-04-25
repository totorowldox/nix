{ pkgs, lib, theme, config, ... }:
let
  lutgen = image:
    let
      inherit (image) name path;
      colors = builtins.concatStringsSep " " config.lib.stylix.colors.toList;
    in pkgs.runCommand "${name}" { } ''
      ${pkgs.lutgen}/bin/lutgen apply -o $out ${path} -- ${colors}
    '';
  generateWallpaper = wallpaper:
    let
      inherit (wallpaper) name convert;
      colorSchemeName = if builtins.hasAttr "colorSchemeName" wallpaper then
        wallpaper.colorSchemeName
      else
        "NEVER";
      thisWallpaper = {
        inherit name;
        path = ../../../../assets/${name};
      };
    in {
      inherit name;
      path = if lib.strings.hasPrefix colorSchemeName
      config.lib.stylix.colors.scheme then
        thisWallpaper.path
      else if convert == "lutgen" then
        lutgen thisWallpaper
      else
        thisWallpaper.path;
    };
  setWallpaper = wallpaper:
    let inherit (wallpaper) name path;
    in {
      name = "Pictures/Wallpapers/generated/${name}";
      value = { source = path; };
    };
in {
  home.file = builtins.listToAttrs
    (map (w: setWallpaper (generateWallpaper w)) theme.wallpapers);
}
