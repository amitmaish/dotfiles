{config, pkgs, ...}:

{
	home.username = "amit";
	home.homeDirectory = "/home/amit";
	home.stateVersion = "25.05";
	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo i use nixos, btw";
		};
	};
}
