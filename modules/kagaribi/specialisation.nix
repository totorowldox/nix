{ config, pkgs, lib, ... }: {
  specialisation."power-saver".configuration = {
    home-manager.users.remo = {
      programs.niri.settings.outputs."eDP-2".mode.refresh = lib.mkForce 60.001;
    };
  };
}
