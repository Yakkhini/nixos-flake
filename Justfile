test:
  nixos-rebuild test --sudo --flake ".#yaksis-thinkbook-desktop"

switch:
  nixos-rebuild switch --sudo --flake ".#yaksis-thinkbook-desktop"

update:
  nix flake update
  git reset
  git add flake.lock
  git commit -S -m "[update] `date +%Y%m%d` update"

fmt:
  nix fmt .

gc:
  nix-collect-garbage --delete-older-than 20d
  sudo nix-collect-garbage --delete-older-than 20d
