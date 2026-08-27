# NixOS Configuration

My personal NixOS setup.

I use this repo to keep my system configuration in one place and make rebuilding or moving the setup easier.

## Overview

- **OS:** NixOS
- **Architecture:** x86_64-linux
- **Flakes:** Enabled
- **Home Manager:** NixOS module
- **Desktop:** Hyprland
- **Shell:** Fish
- **Terminal:** Foot
- **Login Manager:** Tuigreet
- **Desktop Shell:** Caelestia
- **Editor:** Neovim

## Structure

    .nixos/
    ├── flake.nix
    ├── flake.lock
    ├── home/
    │   └── suraj/
    │       ├── caelestia.nix
    │       ├── default.nix
    │       ├── fastfetch.nix
    │       ├── fish.nix
    │       ├── foot.nix
    │       ├── git.nix
    │       ├── hyprland/
    │       │   ├── default.nix
    │       │   └── hyprland.nix
    │       ├── packages.nix
    │       ├── starship.nix
    │       ├── tools.nix
    │       ├── zen.nix
    │       └── zoxide.nix
    ├── hosts/
    │   └── suraj/
    │       ├── hardware.nix
    │       └── system.nix
    ├── modules/
    │   ├── cursor.nix
    │   ├── desktop.nix
    │   ├── fonts.nix
    │   ├── login.nix
    │   ├── networking.nix
    │   ├── packages.nix
    │   └── users.nix
    ├── services/
    │   ├── jellyfin.nix
    │   └── navidrome.nix
    └── README.md

## Services

Currently running:

- Jellyfin
- Navidrome

Media lives outside this repo:

    /srv/
    ├── jellyfin/
    │   └── media/
    └── navidrome/
        └── library/

The actual media library isn't part of this repository.

## Networking

DNS is configured through NixOS.

Currently using Cloudflare DNS:

- `1.1.1.1`
- `1.0.0.1`
- `2606:4700:4700::1111`
- `2606:4700:4700::1001`

## Rebuild

From the root of the repo:

    sudo nixos-rebuild switch --flake .#nixos

To test a configuration without switching:

    sudo nixos-rebuild dry-build --flake .#nixos

## Rollback

List available system generations:

    sudo nix-env --list-generations \
      --profile /nix/var/nix/profiles/system

Rollback to the previous generation:

    sudo nixos-rebuild switch --rollback


## Notes

This repo contains configuration only.

Things like media, databases, caches, logs, credentials, API keys, and other machine-generated or private data should stay outside Git.
