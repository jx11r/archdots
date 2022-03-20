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
  <img align="right" height="80" alt="Arch" src="https://upload.wikimedia.org/wikipedia/commons/a/a5/Archlinux-icon-crystal-64.svg" />
</a>

*Keep It Simple, Stupid!* This is my **$HOME** directory,
I deleted my old repository (it was bloated) and now I'll try to make it simpler,
if you're here for some config, here's a list of my stuff:
+ **WM**: [Qtile](https://github.com/jx11r/qtile)
+ **Bar**: Default qtile bar
+ **Shell**: [zsh](/.zsh/) (from scratch)
+ **Terminal**: [Alacritty](/.config/alacritty/alacritty.yml)
+ **Editor:** [Neovim](https://github.com/jx11r/nvim), [Doom Emacs](https://github.com/hlissner/doom-emacs)
+ **File Manager**: Thunar, Ranger
+ **Compositor**: jonaburg's [Picom](/.config/picom/picom.conf) fork
+ **Launcher**: [Rofi](/.config/rofi/)

## Table of Contents
> - [Archdots](#archdots)
>   - [Why Arch?](#why-arch)
>   - [Installation](#installation)
>     - [Guide](#guide)
>     - [Setup](#setup)
>   - [Roadmap](#roadmap)

## Why Arch?
Arch Linux is an independently developed, x86-64 general-purpose GNU/Linux distribution that strives to provide the latest stable versions of most software by following a rolling-release model. The default installation is a minimal base system, configured by the user to only add what is purposely required.

## Installation
### Guide
- *in progress*

### Setup
*On a clean Arch install, follow these commands:*
```shell
# Clean home directory (don't do if you have important files)
rm -rf $HOME/*

# Clone this repository in your home directory
git clone --depth 1 https://github.com/jx11r/archdots.git $HOME
```

## Roadmap
- [ ] Add installation guide
- [ ] Add gallery section (screenshots)
- [ ] Add more configurations
- [ ] Add git submodules
