{
	boot.supportedFilesystems = [ "ntfs" ];

	fileSystems."/media/windows/c" = {
		device = "/dev/disk/by-uuid/BA76E5860768395D";
		fsType = "ntfs-3g";
		options = [
			"uid=1000"
			"gid=100"
			"rw"
			"user"
			"exec"
			"umask=000"
		];
	};
	fileSystems."/media/windows/d" = {
		device = "/dev/disk/by-uuid/09C1B27D95CC5896";
		fsType = "ntfs-3g";
		options = [
			"uid=1000"
			"gid=100"
			"rw"
			"user"
			"exec"
			"umask=000"
		];
	};
	fileSystems."/media/windows/e" = {
		device = "/dev/disk/by-uuid/0890550F289795A0";
		fsType = "ntfs-3g";
		options = [
			"uid=1000"
			"gid=100"
			"rw"
			"user"
			"exec"
			"umask=000"
		];
	};
	fileSystems."/media/windows/g" = {
		device = "/dev/disk/by-uuid/C0B4F51EE1BBB23B";
		fsType = "ntfs-3g";
		options = [
			"uid=1000"
			"gid=100"
			"rw"
			"user"
			"exec"
			"umask=000"
		];
	};
	fileSystems."/media/windows/i" = {
		device = "/dev/disk/by-uuid/7C3F9A9C3514AEE2";
		fsType = "ntfs-3g";
		options = [
			"uid=1000"
			"gid=100"
			"rw"
			"user"
			"exec"
			"umask=000"
		];
	};

	hardware.graphics.enable32Bit = true;
}
