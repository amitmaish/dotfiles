{pkgs, ...}: {
  services = {
    samba = {
      enable = true;
      package = pkgs.samba4Full;
      openFirewall = true;

      settings = {
        global = {
          "server smb encrypt" = "required";
          "server min protocol" = "SMB3_00";
          "workgroup" = "WORKGROUP";
          "security" = "user";
        };

        share = {
          "path" = "/home/amit/share";
          "read only" = "no";
          "writable" = "yes";
          "comment" = "no comment";
          "browseable" = "yes";
        };
      };
    };
    samba-wsdd = {
      enable = true;
      openFirewall = true;
    };
    avahi = {
      enable = true;
      publish.enable = true;
      publish.userServices = true;
      openFirewall = true;
    };
  };
}
