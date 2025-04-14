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
						pkgs.arduino-cli
						pkgs.arduino-language-server
            pkgs.ast-grep
            pkgs.atkinson-hyperlegible
						pkgs.bat
            pkgs.cargo-bundle
            pkgs.cbonsai
						pkgs.cmake
            pkgs.cmatrix
						pkgs.direnv
						pkgs.discord
						pkgs.discordo
            pkgs.fd
						pkgs.ffmpeg
            pkgs.figlet
						pkgs.fzf
            pkgs.gh
						pkgs.go
						pkgs.hyfetch
            pkgs.imagemagick
						pkgs.lazygit
						pkgs.lua
						pkgs.luarocks-nix
						pkgs.mkalias
						pkgs.miru
						pkgs.neovim
						pkgs.nodejs
						pkgs.nerd-fonts.jetbrains-mono
            pkgs.php
						pkgs.poetry
            pkgs.prismlauncher
						pkgs.python3
            pkgs.qmk
            pkgs.ripgrep
            pkgs.sendme
						pkgs.starship
						pkgs.stow
						pkgs.tmux
						pkgs.transmission_4
						pkgs.uv
            pkgs.wget
						pkgs.yazi
						pkgs.yt-dlp
						pkgs.zoom-us
						pkgs.zoxide
					];

				homebrew = {
					enable = false;
					brews = [
						"kanata"
						"mas"
						"openssl"
					];
					casks = [
            "bibdesk"
            "docker"
						"dorico"
						"firefox"
						"handbrake"
						"kitty"
            "shortcat"
						"steinberg-activation-manager"
						"steinberg-download-assistant"
						"tailscale"
						"obs"
						"parsec"
						"plover"
						"plugdata"
            "qmk-toolbox"
						"vlc"
					];
					masApps = {
						"compressor" = 424390742;
						"final cut" = 424389933;
						"forScore" = 363738376;
						"hotkey" = 975890633;
						"logic" = 634148309;
						"motion" = 434290957;
						"xcode" = 497799835;
					};
					onActivation.cleanup = "zap";
					onActivation.autoUpdate = true;
					onActivation.upgrade = true;
				};

				system.activationScripts.applications.text =
					let
						env = pkgs.buildEnv {
							name = "system-applications";
							paths = config.environment.systemPackages;
							pathsToLink = "/Applications";
						};
					in
					pkgs.lib.mkForce ''
											# Set up applications.
											echo "setting up /Applications..." >&2
											rm -rf /Applications/Nix\ Apps
											mkdir -p /Applications/Nix\ Apps
											find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
											while read -r src; do
											app_name=$(basename "$src")
											echo "copying $src" >&2
												${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
												done
											'';

        system.defaults = {
          dock.persistent-apps = [
            "/System/Applications/Launchpad.app"
            "/System/Applications/Messages.app"
            "${pkgs.discord}/Applications/Discord.app"
            "/Applications/kitty.app"
            "/Applications/Firefox.app"
            "/System/Applications/Calendar.app"
            "/Applications/Pianoteq 8/Pianoteq 8.app"
            "/Applications/Reaper.app"
            "/Applications/Ableton\ Live\ 11\ Suite.app"
            "/Applications/Dorico\ 5.app"
            "/System/Applications/Music.app"
          ];
          finder.AppleShowAllExtensions = true;
          finder.FXPreferredViewStyle = "clmv";
          finder.ShowExternalHardDrivesOnDesktop = false;
          finder.ShowMountedServersOnDesktop = false;
          loginwindow.GuestEnabled = false;
          NSGlobalDomain.AppleInterfaceStyle = "Dark";
          NSGlobalDomain.AppleShowAllExtensions = true;
          NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
          NSGlobalDomain.KeyRepeat = 2;
        };

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
