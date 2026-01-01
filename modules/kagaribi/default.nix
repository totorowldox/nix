{
  imports = [ ./hardware.nix ./packages.nix ];

  # Powersaving matters!
  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;

    settings = {
      TLP_ENABLE = 1;
      #TLP_DEFAULT_MODE = "BAT";
      #TLP_PERSISTENT_DEFAULT = 1;
      RUNTIME_PM_DENYLIST = "01:00.0";

      TLP_AUTO_SWITCH = 1;

      # 1. Performance
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_MAX_PERF_ON_AC = 100;
      CPU_BOOST_ON_AC = 1;

      # 2. Balanced
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      CPU_MAX_PERF_ON_BAT = 60;
      CPU_BOOST_ON_BAT = 0;

      # 3. Power Saver ( Let's implement first and wait tlp 1.9+ :/ )
      CPU_SCALING_GOVERNOR_ON_SAV = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_SAV = "power";
      CPU_MAX_PERF_ON_SAV = 40;
      CPU_BOOST_ON_SAV = 0;

      RUNTIME_PM_ON_BAT = "auto";
      PCIE_ASPM_ON_BAT = "powersupersave";

      USB_AUTOSUSPEND = 1;
    };
  };

  # environment.sessionVariables = {
  #   NIRI_RENDER_DEVICE = "/dev/dri/renderD129"; # Your AMD iGPU
  #   # Prevent Wayland from accidentally waking the dGPU for basic tasks
  #   __EGL_VENDOR_LIBRARY_FILENAMES = "/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json";
  # };

  boot.kernelParams = [
    "nvidia.NVreg_DynamicPowerManagement=0x03"
    #"nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    "nvidia-drm.modeset=1"
    "amd_pstate=active"
  ];

}
