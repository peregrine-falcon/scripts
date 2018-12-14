#!/bin/bash
# Title: setup.h
# Author: Abhinandan K N

echo "Running setup.sh"
echo "Sets up pip packages, fonts, bash, vim, spacemacs and tmux"

# Install pip packages
pip3 install yapf
pip3 install jedi
pip3 install flake8
pip3 install pylint
echo "Finished installing pip packages"

# Git clone .dotfiles repository
git clone https://peregrine_falcon@bitbucket.org/peregrine_falcon/dotfiles.git ~/.dotfiles
echo "Cloned .dotfiles"

# Install fonts
cp -r ~/.dotfiles/fonts/Inconsolata/ /usr/share/fonts/        # Inconsolata
cp -r ~/.dotfiles/fonts/SystemSanFransisco/ /usr/share/fonts/ # System San Fransisco
cp -r ~/.dotfiles/fonts/SourceCodePro/ /usr/share/fonts/      # Source Code Pro
cp -r ~/.dotfiles/fonts/AppleGaramond/ /usr/share/fonts/      # Apple Garamond
echo "Finished installing fonts"

# Create a backups directory
mkdir ~/Backups
mkdir ~/Backups/Config_Files
echo "Finished creating backups directory"

# Set up Bash
cd ~
mv .bashrc ~/Backups
ln -sf ~/.dotfiles/bashrc .bashrc         # symbolically link bashrc to .bashrc
ln -sf ~/.dotfiles/bash_alias .bash_alias # symbolically link bash_alias to .bash_alias
echo "Finished setting up bash"

# Set up Vim
cd ~
mv .vimrc ~/Backups
ln -sf ~/.dotfiles/vimrc .vimrc   
mkdir ~/.vim                      # Make necessary directories
mkdir ~/.vim/bundle

cd ~/Downloads                    # Theme
git clone https://github.com/chriskempson/tomorrow-theme.git
cp -r tomorrow-theme/vim/colors/ ~/.vim/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
rm -Rf ~/Downloads/tomorrow-theme # Remove unnecessary files
echo "Finished setting up vim"

# Set up Spacemacs
cd ~
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
ln -sf ~/.dotfiles/spacemacs .spacemacs 
echo "Finished setting up spacemacs"

# Set up Tmux
cd ~
ln -sf ~/.dotfiles/tmux.conf .tmux.conf             
ln -sf ~/.dotfiles/tmux.conf.local .tmux.conf.local 
echo "Finished setting up tmux"
