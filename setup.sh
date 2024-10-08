#!/bin/sh

# Setup Oh My ZSH
rm -rf ~/.zshrc
echo "source ~/.dotfiles/zsh/.zshrc" > ~/.zshrc

# Setup Neovim
rm -rf ~/.config/nvim
mkdir ~/.config/nvim
ln -s ~/.dotfiles/neovim ~/.config/nvim

# Setup Tmux
rm -rf ~/.tmux
rm -rf ~/.tmux.conf
cp ~/.dotfiles/tmux/.tmux.conf $HOME
cp -r ~/.dotfiles/tmux/.tmux $HOME
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source-file ~/.tmux.conf

# yay -S --noconfirm mise

# yay -S --noconfirm stow lazydocker lazygit neovim tmux zellij wezterm
