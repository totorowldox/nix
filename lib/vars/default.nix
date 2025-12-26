{ hostname }: {
  flakePath = "~/nix";
  config = import ./config/${hostname}.nix;
}
