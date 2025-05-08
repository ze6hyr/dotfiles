#!/bin/bash

set -e  # exit on error

DOTFILES_DIR=~/dotfiles
BACKUP_DIR=~/.dotfiles_backup_$(date +%s)

echo "📦 Backing up existing dotfiles to $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

link() {
  src="$DOTFILES_DIR/$1"
  dest="$HOME/$2"
  
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "🔁 Backing up $dest"
    mv "$dest" "$BACKUP_DIR/"
  fi
  
  echo "🔗 Linking $src → $dest"
  ln -s "$src" "$dest"
}

# List your dotfiles here
link ".zshrc" ".zshrc"
link ".vimrc" ".vimrc"
link ".xinitrc" ".xinitrc"
link ".config/nvim" ".config/nvim"
link ".local/src" ".local/src"

echo "✅ Done!"

#how to use this in new machine?
#git clone git@github.com:yourusername/dotfiles.git ~/dotfiles
#cd ~/dotfiles
#./install.sh
