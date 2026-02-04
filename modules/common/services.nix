{ pkgs, ... }: {
  systemd.user.services.hyperhdr = {
    description = "HyperHDR service";
    serviceConfig = {
      ExecStart = "${pkgs.hyperhdr}/bin/hyperhdr";
      # 注入库路径
      Environment = [
        "LD_LIBRARY_PATH=${pkgs.libGL}/lib:${pkgs.libglvnd}/lib"
        "PATH=${pkgs.binutils}/bin"
      ];
    };
    wantedBy = [ "graphical-session.target" ];
  };
}
