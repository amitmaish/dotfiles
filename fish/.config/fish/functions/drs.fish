function drs --wraps='darwin-rebuild switch --flake /Users/amit/dotfiles/nix/' --description 'alias drs=darwin-rebuild switch --flake /Users/amit/dotfiles/nix/'
  darwin-rebuild switch --flake /Users/amit/dotfiles/nix/ $argv
        
end
