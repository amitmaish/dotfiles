{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    (blender.override {
      cudaSupport = true;
    })
  ];
}
