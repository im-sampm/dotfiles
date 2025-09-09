#!/bin/bash

# Dotfiles installation script
# This script creates symlinks from the home directory to the dotfiles repo

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "🚀 Installing dotfiles from $DOTFILES_DIR"

# Create backup directory
mkdir -p "$BACKUP_DIR"
echo "📦 Backup directory created at $BACKUP_DIR"

# Function to create symlink with backup
create_symlink() {
    local source="$1"
    local target="$2"
    
    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "📋 Backing up existing $target"
        mv "$target" "$BACKUP_DIR/"
    fi
    
    echo "🔗 Creating symlink: $target -> $source"
    ln -sf "$source" "$target"
}

# Install bashrc
if [ -f "$DOTFILES_DIR/bashrc" ]; then
    create_symlink "$DOTFILES_DIR/bashrc" "$HOME/.bashrc"
else
    echo "❌ bashrc file not found in $DOTFILES_DIR"
    exit 1
fi

echo "✅ Dotfiles installation completed!"
echo "🔄 Please run 'source ~/.bashrc' or restart your terminal to apply changes"

# Check if we're in a devcontainer and provide additional guidance
if [ -n "$CODESPACES" ] || [ -n "$DEVCONTAINER" ] || [ -f /.dockerenv ]; then
    echo ""
    echo "📦 Detected container environment"
    echo "💡 Consider adding this installation to your devcontainer.json postCreateCommand"
fi