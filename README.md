# dev_env
Repo for dev environment that includes the following:

* tmux config and add-ons
* nvim config files and add-ons
* NVMe formatting [instructions](format_m2_ssd.md)

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
- lualine full path for filess
- nvim-tree web-iconsv
- telescope c-p find files, space+space old files, space+fg live grep, space+fh help tags
- treesitter has the following parsers: c, cpp, lua, rust, go, vimk
