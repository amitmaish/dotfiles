# dotfiles

all the dotfiles for all of my things

## dependencies

* git
* gnu stow
* nix
* nix-darwin

## installation

first, clone this git repo to ~/dotfiles/

install the nix package manager by running

``` sh
sh <(curl -L https://nixos.org/nix/install)
```

then install nix-darwin by running:

``` sh
nix run nix-darwin/master#darwin-rebuild -- switch
```

finally run stow in the dotfiles directory to ensure all dotfiles are up to date:

``` sh
stow .
```

## updating

to update your system when this repository changes, make sure the local repository is up to date and run:

``` sh
drs    # aliased to darwin-rebuild switch, will update all packages and system settings
stow . # ensures that all dotfiles are up to date
```
