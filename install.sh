#!/bin/bash

set -e

DOTFILES_DIR=~/dotfiles
BACKUP_DIR=~/.dotfiles_backup_$(date +%s)

echo "📦 Backing up any existing dotfiles to $BACKUP_DIR"
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

# Home-level dotfiles
link ".zshrc" ".zshrc"
link ".xinitrc" ".xinitrc"
link ".vimrc" ".vimrc"

# Neovim config
link ".config/nvim" ".config/nvim"

# Suckless builds (st, dwm, dmenu, etc.)
link "st" ".local/src/st"
link "dwm" ".local/src/dwm"
link "dmenu" ".local/src/dmenu"

echo "✅ Dotfiles setup complete!"

#how to use this in new machine?
#git clone git@github.com:yourusername/dotfiles.git ~/dotfiles
#cd ~/dotfiles
#./install.sh
