{pkgs, ...}: {
  home.packages = with pkgs; [
    lua-language-server
    luajitPackages.luarocks
    stylua
  ];
}
