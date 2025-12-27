# Dedicated packages for laptop

{ pkgs, ... } : {
  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
}