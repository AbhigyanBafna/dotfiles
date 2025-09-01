#!/bin/bash
set -e

DOTFILES_DIR="$HOME/dotfiles"

echo "🔗 Creating symlinks for dotfiles..."

# List of files/folders to symlink
FILES=(.zshrc .p10k.zsh .config/iterm2)

for file in "${FILES[@]}"; do
  TARGET="$HOME/$file"
  SOURCE="$DOTFILES_DIR/$file"

  # Back up existing file/folder before creating symlink
  if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
    echo "💾 Backing up existing $file"
    mv "$TARGET" "$BACKUP_DIR/"
  fi

  # Create parent directories if needed
  mkdir -p "$(dirname "$TARGET")"

  # Create symlink
  ln -s "$SOURCE" "$TARGET"
  echo "✅ Symlinked $file"
done

echo "🎉 All symlinks created!"
