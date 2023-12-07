Chezmoi manages this dotfiles.

## for Ubuntu:

### dependencies:

WARNING: A huge part of the dependencies is missing here

```bash
sudo apt install -y node alacritty i3 xclip maim openssh-server rofi tmux python3 python3-pip
```

Other dependencies:
 - [greenclip](https://github.com/erebe/greenclip)
 - [neovim](https://neovim.io/)
 - [ripgrep](https://github.com/BurntSushi/ripgrep)
 - [tmux-sessionizer](https://github.com/jrmoulton/tmux-sessionizer)

also you need to install JetBrainsMono Nerd font:
```bash
#/bin/bash
# install JetBrainsMono Nerd Font --> u can choose another at: https://www.nerdfonts.com/font-downloads
echo "[-] Download fonts [-]"
echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.fonts
fc-cache -fv
echo "done!"
```
