{ config, pkgs, lib, ... }: {
  specialisation."mc-server-mode".configuration = {

    # Disable unnecessary services
    services.xserver.enable = lib.mkForce false;
    services.displayManager.gdm.enable = lib.mkForce false;
    programs.niri.enable = lib.mkForce false;
    services.printing.enable = lib.mkForce false;
    hardware.bluetooth.enable = lib.mkForce false;
    services.pipewire.enable = lib.mkForce false;
    services.pulseaudio.enable = lib.mkForce false;

    # CPU & GPU optimization
    powerManagement.cpuFreqGovernor = lib.mkForce "schedutil";
    boot.kernelParams =
      [ "amd_pstate=active" "amdgpu.ppfeaturemask=0xffffffff" ];

    # Networking
    networking.firewall.allowedTCPPorts = [ 25565 ];
  };
}
