#!/bin/bash
set -e

DOTFILES_DIR="$HOME/dotfiles"

echo "🔗 Creating symlinks for dotfiles..."

# List of files/folders to symlink
FILES=(.zshrc .p10k.zsh .gitconfig .config/iterm2)

for file in "${FILES[@]}"; do
  TARGET="$HOME/$file"
  SOURCE="$DOTFILES_DIR/$file"

  # Check if file already exists
  if [ -e "$TARGET" ]; then
    echo "⚠️  $file already exists, skipping..."
    continue
  fi

  # Create parent directories if needed
  mkdir -p "$(dirname "$TARGET")"

  # Create symlink
  ln -s "$SOURCE" "$TARGET"
  echo "✅ Symlinked $file"
done

echo "🎉 All symlinks created!"
