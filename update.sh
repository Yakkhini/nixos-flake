#!/usr/bin/env zsh

nix flake update
git add flake.lock
git commit -S -m "Update: `date +%Y%m%d` update."
