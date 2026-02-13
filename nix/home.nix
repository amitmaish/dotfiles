{pkgs, ...}: let
  dot = pkgs.callPackage ./apps/dot/dot.nix {
    NAME = "amit-pc";
    REBUILD_COMMAND = ''nh os switch ~/dotfiles/nix -H amit-pc'';
  };
in {
  home.username = "amit";
  home.homeDirectory = "/home/amit";
  home.stateVersion = "25.05";

  imports = [
    ./hosts/common/home.nix
  ];

  blender.cuda = true;

  home.packages = [
    dot
    pkgs.cowsay
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/x-blender" = "blender";
    };
  };

  services.syncthing.enable = true;

  services.udiskie = {
    enable = true;
    settings = {
      program_options = {
        file_manager = "${pkgs.kdePackages.dolphin}";
      };
    };
  };
}
