{
  description = "amit's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
		nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, config, ... }: {

			nixpkgs.config.allowUnfree = true;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
						pkgs.anki-bin
						pkgs.cmake
						pkgs.discord
						pkgs.ffmpeg
						pkgs.fzf
						pkgs.go
						pkgs.kitty
						pkgs.lazygit
						pkgs.lua
						pkgs.luarocks-nix
						pkgs.mkalias
						pkgs.miru
						pkgs.neofetch
						pkgs.neovim
						pkgs.nodejs
						pkgs.oh-my-posh
						pkgs.python3
						pkgs.rustup
						pkgs.tmux
						pkgs.transmission_4
						pkgs.uv
						pkgs.whatsapp-for-mac
						pkgs.yazi
						pkgs.yt-dlp
						pkgs.zoxide
        ];

			homebrew = {
				enable = true;
				brews = [
						"katana"
						"mas"
					];
				casks = [
						# "firefox"
					];
				masApps = {
						"forScore" = 363738376;
					};
				onActivation.cleanup = "zap";
			};

			# fonts.packages = [
			# 	(pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
			# ];

			system.activationScripts.application.text = let
				env = pkgs.buildEnv {
					name = "system-applications";
					paths = config.environment.systemPackages;
					pathsToLink = "/Applications";
				};
			in
					pkgs.lib.mkForce ''
						# Set up applications
						echo "setting up /Applications..." >&2
						rm -rf /Applications/Nix\ Apps
						mkdir -p /Applications/Nix\ Apps
						find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
						while read src; do
							app_name=$(basename "$src")
							echo "copying $src" >&2
							${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
						done
						'';

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "x86_64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#amits-mac
    darwinConfigurations."amits-mac" = nix-darwin.lib.darwinSystem {
      modules = [ 
					configuration
					nix-homebrew.darwinModules.nix-homebrew
					{
						nix-homebrew = {
							enable = true;

							user = "amit";

							autoMigrate = true;
						};
					}
				];
    };
  };
}
