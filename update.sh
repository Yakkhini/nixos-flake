#!/usr/bin/env zsh

nix flake update
git add flake.lock
git commit -S -m "[update] `date +%Y%m%d` update"
