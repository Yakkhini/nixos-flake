#!/usr/bin/env zsh

sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations +$1
sudo nix-env --profile /nix/var/nix/profiles/per-user/root/channels --delete-generations +$1
sudo nix-env --profile /nix/var/nix/profiles/per-user/yakkhini/profile --delete-generations +$1
sudo nix-env --profile /nix/var/nix/profiles/per-user/yakkhini/channels --delete-generations +$1
sudo nix-env --profile /nix/var/nix/profiles/per-user/yakkhini/home-manager --delete-generations +$1

nix-collect-garbage
