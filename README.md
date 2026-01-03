# dev_env
Repository for a Linux development environment, including:

- Nerd Font installation (terminal compatibility)
- tmux configuration and plugins
- Neovim configuration and plugins
- NVMe formatting instructions ([format_m2_ssd.md](format_m2_ssd.md))

---

## Terminal Font Setup (Required)

For tmux and Neovim to render icons correctly (lualine, neo-tree, telescope, etc.),
a **Nerd Font** must be installed *and selected in your terminal emulator*.

This repository assumes a Nerd Font is present.

### Current font in use
- **Agave Nerd Font**

Download:
- https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Agave.zip

---

### 1. Install the font locally

```bash
$ mkdir -p ~/.local/share/fonts
$ unzip Agave.zip -d ~/.local/share/fonts/Agave
$ fc-cache -fv
```

### 2. Validate installation

```bash
$ fc-list | grep -i agave
```

Expected output (example):
```bash
$ fc-list | grep -i agave
$HOME/.local/share/fonts/Agave/AgaveNerdFontMono-Bold.ttf: Agave Nerd Font Mono:style=Bold
$HOME/.local/share/fonts/Agave/AgaveNerdFontPropo-Regular.ttf: Agave Nerd Font Propo:style=Regular
$HOME/.local/share/fonts/Agave/AgaveNerdFontPropo-Bold.ttf: Agave Nerd Font Propo:style=Bold
$HOME/.local/share/fonts/Agave/AgaveNerdFont-Bold.ttf: Agave Nerd Font:style=Bold
$HOME/.local/share/fonts/Agave/AgaveNerdFontMono-Regular.ttf: Agave Nerd Font Mono:style=Regular
$HOME/.local/share/fonts/Agave/AgaveNerdFont-Regular.ttf: Agave Nerd Font:style=Regular
```

Your system reports the following valid family names:
- Agave Nerd Font
- Agave Nerd Font Mono
- Agave Nerd Font Propo

These are the exact names your terminal will use.

### 3. Select the font in your terminal emulator (required)

You must configure the font in your terminal’s settings.

Examples:

**MATE Terminal**
* Edit → Profiles → Preferences
* Uncheck Use system fixed width font
* Select Agave Nerd Font Mono
* Size: 11–13 recommended

**GNOME Terminal**
* Preferences → Profile → Text
* Custom font → Agave Nerd Font Mono

**Kitty (~/.config/kitty/kitty.conf)**
```conf
font_family Agave Nerd Font Mono
font_size 12.0
```

## TMUX Configuration

1. Copy the tmux.conf to your home directory

```bash
$ cp tmux.conf ~/.tmux.conf
```

2. Set up permissions for the file

```bash
$ chmod 755 ~/.tmux.conf 
```

3. Clone the Tmux Plugin Manager (TPM) project

```bash
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

4. Open tmux window, source tmux config file, and install packages

```bash
$ tmux
# Press Bind <C-s> + r to source ~/.tmux.conf
# Press C-s + I to install tpm packages
```

5. Done

### Current Configs:

* Bind key is Ctrl+s (C-s) instead of Ctrl+b
* Source .tmux.config with C-s + r
* Install any new imported packages for tmux with C-s + I
* Switch windows with vim key maps
* Navigate between vim and tmux windows with key bindings
* Weather of specified city (inside of .tmux.conf)

## NVIM Configuration

1. Download latest stable version for neovim. As of today, it is 0.11.5:
  cd ~/.local/share
  wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
2. Extract:
  tar -xvf nvim-linux-x86_64.tar.gz
souce init.lua
install PAcker pages with `:PackerSync`

3. 
### Current Configs:
- set leader to <space>
- leader + h to clear highlight searchi
- uses packer.nvim's bootstrap - if we clone this configuration, it will check to see if packer is already installed, and if not, it will go ahead and get it. 
don't forget alias for nvim from vim (there should already be one for vi, but if not , add it also):q
I think all we have to do is to source ~/.config/nvim/init.lua
- tabs are 2 space
- disable netrw
- chaange Ctrl+n to enter nvim-tree
- use gruvbox colorscheme
- lualine full path for files
- nvim-tree web-iconsv

- telescope c-p find files, space+space old files, space+fg live grep, space+fh help tags
NOTE: Treesitter has two package deps: ripgrep and fd-find
- treesitter has the following parsers: c, cpp, lua, rust, go, vimk
