#!/bin/zsh

nixos-rebuild test --use-remote-sudo --flake ".#yaksis-desktop"
