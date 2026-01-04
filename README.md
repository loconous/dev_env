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

## Neovim (nvim) Configuration

This repository provides a modern Neovim setup using **lazy.nvim** as the plugin manager, Lua-based structured configuration, LSP, Treesitter, Telescope, matching Catpuccin theme with TMUX. 

### 1. Install nvim (Linux)

Download the latest **stable** nvim version from [releases](https://github.com/neovim/neovim/releases).

```bash
$ cd ~/.local/share
$ wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
$ tar -xvf nvim-linux-x86_64.tar.gz
```

Add Neovim to your PATH:
 
```bash
$ echo 'export PATH="$HOME/.local/share/nvim/nvim-linux-x86_64/bin:$PATH"' >> ~/.bashrc
$ source ~/.bashrc
```

Or add these in your `~/.bashrc` file:

```bash
# editor aliases
alias nvim='~/.local/share/nvim/nvim-linux-x86_64/bin/nvim'
alias vi='nvim'
alias vim='nvim'
```

Verify:

```bash
$ nvim --version
```

### 2. OS Dependencies

The following system packages are required:

```bash
$ sudo dnf install -y ripgrep fd-find
```

Used by:
* Telescope
* Treesitter

### 3. Install the nvim config

Careful with previous configs, but quick and dirty:

```bash
$ cp -rf nvim ~/.config/nvim
```

Directory structure:

```bash
~/.config/nvim
├── init.lua
└── lua
    ├── config
    │   ├── keymaps.lua
    │   └── lazy.lua
    └── plugins
        ├── catppuccin.lua
        ├── completions.lua
        ├── lsp-config.lua
        ├── lualine.lua
        ├── neo-tree.lua
        ├── none-ls.lua
        ├── telescope.lua
        └── treesitter.lua
```
### 4. First Launch

Start Neovim:

```bash
nvim
```

On first launch:
* lazy.nvim bootstraps automatically
* Plugins are installed without user interaction

Verify with:

```vim
:Lazy
```

### 5. Core Configuration Overview

**General**

* Leader key: `<Space>`
* Tabs: **2 spaces**
* `netrw` disabled
* Clipboard integrates with system when supported
* Consistent diagnostics and LSP UI (needs tuning)

**Keymaps**

* `<leader>h`   → clear search highlights
* `<leader>d`   → show diagnostics float
* `gd`          → go to definition
* `K`           → hover documentation
* `gr`          → references
* `<leader>ca`  → code actions

### 6. Plugins in Use

**Plugin Manager**

* lazy.nvim

**UI / UX**

* catppuccin.nvim – colorscheme
* lualine.nvim – statusline (full file path)
* neo-tree.nvim – file explorer
* nvim-web-devicons – icons

**Navigation & Search**

* telescope.nvim
    * <leader>ff → find files
    * <leader>fg → live grep
    * <leader>fb → buffers
    * <leader>fh → help tags
    * <leader>en → browse Neovim config

**Syntax & Parsing**

* nvim-treesitter
    * Installed parsers:
        * lua, rust, go, vim

**LSP**

* nvim-lspconfig
* mason.nvim
* mason-lspconfig.nvim

Enabled language servers:

* Lua (lua_ls)
* Rust (rust_analyzer)
* Go (gopls)
* Bash (bashls)
* Markdown (marksman)

**Completions**

* nvim-cmp
* LSP-backed completion via `cmp-nvim-lsp`

**Formatting / Linting**

* none-ls.nvim
    * stylua
    * gofmt
    * gomodifytags
    * golangci-lint (if installed)

### 7. Optional Aliases

If desired, alias vim and vi to nvim:

```bash
alias vim=nvim
alias vi=nvim
```

Add to `~/.bashrc`.
