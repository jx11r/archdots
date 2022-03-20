<div align="center">
  <h1>Archdots</h1>
  <a href="https://archlinux.org/download">
    <img src="https://img.shields.io/badge/Arch_Linux-x86__64-informational.svg?style=for-the-badge&logo=archlinux&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41" />
  </a>
  <a href="#">
    <img src="https://img.shields.io/github/repo-size/jx11r/archdots?style=for-the-badge&logo=gitbook&color=F2CDCD&logoColor=D9E0EE&labelColor=302D41" />
  </a>
  <a href="https://github.com/jx11r/archdots/stargazers">
    <img src="https://img.shields.io/github/stars/jx11r/archdots?style=for-the-badge&logo=starship&color=B5E8E0&logoColor=D9E0EE&labelColor=302D41" />
  </a>
  <a href="#">
    <img src="https://badges.pufler.dev/visits/jx11r/archdots?style=for-the-badge&logo=github&color=DDB6F2&logoColor=D9E0EE&labelColor=302D41" />
  </a>
</div><br>

<a href="https://archlinux.org">
  <img align="right" height="100" alt="Arch" src="https://upload.wikimedia.org/wikipedia/commons/a/a5/Archlinux-icon-crystal-64.svg" />
</a>

Keep It Simple, Stupid! This is my **$HOME** directory so not much to see here,
I deleted my old repository (it was bloated) and now I'll try to make it simpler.
Finally, if you're here for some config, here's a list of my stuff:
+ **WM**: [Qtile](https://github.com/jx11r/qtile)
+ **Bar**: Default qtile bar
+ **Shell**: [zsh](/.zsh) (from scratch)
+ **Terminal**: [Alacritty](/.config/alacritty/alacritty.yml)
+ **Editor:** [Neovim](https://github.com/jx11r/nvim), [Doom Emacs](https://github.com/hlissner/doom-emacs)
+ **File Manager**: Thunar, Ranger
+ **Compositor**: jonaburg's [Picom](/.config/picom/picom.conf) fork
+ **Launcher**: [Rofi](/.config/rofi)

## Table of Contents
> - [Archdots](#archdots)
>   - [Why Arch?](#why-arch)
>   - [Installation](#installation)
>     - [Guide](#guide)
>     - [Configurations](#configurations)
>   - [Roadmap](#roadmap)

## Why Arch?
Arch is a rolling-release model backed by pacman, a lightweight, simple and fast package manager that allows for continuously upgrading the entire system with one command. Arch also provides the Arch Build System, a ports-like system to make it easy to build and install packages from source, which can also be synchronized with one command. In addition, the Arch User Repository contains many thousands of community-contributed PKGBUILD scripts for compiling installable packages from source using the makepkg application. It is also possible for users to build and maintain their own custom repositories with ease.

## Installation
### Guide
- *in progress*

### Configurations
*On a clean Arch install, follow these commands:*
```shell
# Clean home directory (don't do if you have important files)
rm -rf $HOME/*

# Clone this repository
git clone --depth 1 https://github.com/jx11r/archdots.git $HOME
```

## Roadmap
- [ ] Add Arch Linux installation guide
- [ ] Add an installer script (packages)
- [ ] Add gallery section (screenshots)
- [ ] Add more configurations
- [ ] Add git submodules
