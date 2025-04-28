# dev_env
Repo for dev environment that includes the following:

* tmux config and add-ons
* vim config files and add-ons
* NVMe formatting [instructions](format_m2_ssd.md)

## TMUX Configuration

1. Copy the tmux.conf to your home directory

        cp tmux.conf ~/.tmux.conf

2. Set up permissions for the file

        chmod 755 ~/.tmux.conf 

3. Clone the Tmux Plugin Manager (TPM) project

        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

4. Open tmux window, source tmux config file, and install packages

        tmux
        # Press C-s + r
        # Press C-s + I

5. Done

### Current Configs:

* Bind key is Ctrl+s (C-s) instead of Ctrl+b
* Source .tmux.config with C-s + r
* Install any new imported packages for tmux with C-s + I
* Switch windows with vim key maps
* Navigate between vim and tmux windows with key bindings
* Weather of specified city (inside of .tmux.conf)

## VIM Configuration

1. WIP..
