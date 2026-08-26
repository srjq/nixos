# NixOS Configuration

My personal NixOS configuration, managed declaratively with Nix flakes and Home Manager.

The goal is to keep the system reproducible, modular, and easy to maintain while still having a highly customized desktop environment.

## Overview

- **OS:** NixOS
- **Architecture:** x86_64-linux
- **Flakes:** Enabled
- **Home Manager:** Integrated as a NixOS module
- **Desktop:** Hyprland
- **Shell:** Fish
- **Terminal:** Foot
- **Login Manager:** Tuigreet / SDDM
- **Desktop Shell:** Caelestia
- **Editor:** Neovim

## Repository Structure

```text
.
├── flake.nix
├── flake.lock
├── hosts/
│   └── suraj/
│       ├── hardware.nix
│       └── system.nix
├── modules/
│   ├── fonts.nix
│   ├── login.nix
│   ├── packages.nix
│   └── users.nix
└── home/
    └── suraj/
        ├── default.nix
        └── hyprland/
            ├── default.nix
            └── hyprland.nix
