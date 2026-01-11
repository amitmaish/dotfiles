{...}: {
  services.tailscale.enable = true;
  networking.nftables.enable = true;
  networking.firewall.checkReversePath = "loose";

  networking.firewall.enable = true;
  networking.firewall.allowPing = true;
}
