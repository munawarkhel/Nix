# Build the system config and switch to it when running `just` with no args
default: switch

hostname := `hostname | cut -d "." -f 1`

### macos
# Build the nix-darwin system configuration without switching to it
[macos]
build target_host=hostname flags="":
  @echo "Building nix-darwin config..."
  nix --extra-experimental-features 'nix-command flakes'  build ".#darwinConfigurations.starwarsmac.system"

# Build the nix-darwin config with the --show-trace flag set
[macos]
trace target_host=hostname: (build target_host "--show-trace")

# Build the nix-darwin configuration and switch to it
[macos]
switch target_host=hostname: (build target_host)
  @echo "switching to new config for {{target_host}}"
  ./result/sw/bin/darwin-rebuild switch --flake ".#"



# Update flake inputs to their latest revisions
update:
  nix flake update

# Garbage collect old OS generations and remove stale packages from the nix store
gc generations="5":
  nix-env --delete-generations {{generations}}
  nix-store --gc