# dotfiles

A personal dotfiles repository for customizing development environments, especially designed for use with devcontainers and remote development.

## Features

- **Vi mode enabled**: `set -o vi` for vim-like terminal navigation
- **Useful aliases**: Common shortcuts for `ls`, `git`, and navigation
- **Enhanced history**: Better bash history configuration
- **Colorful prompt**: Easy-to-read command prompt with colors
- **Git aliases**: Quick shortcuts for common git operations
- **Safe installation**: Automatic backup of existing configurations

## Quick Start

### In a DevContainer

1. Clone this repository or add it as a git submodule to your project
2. Add the following to your `.devcontainer/devcontainer.json`:

```json
{
    "name": "My Dev Container",
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "postCreateCommand": "git clone https://github.com/im-sampm/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && bash install.sh"
}
```

Or if the dotfiles are in your project directory:

```json
{
    "postCreateCommand": "bash dotfiles/install.sh"
}
```

### Manual Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/im-sampm/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. Run the installation script:
   ```bash
   bash install.sh
   ```

3. Reload your bash configuration:
   ```bash
   source ~/.bashrc
   ```

## What's Included

### bashrc Configuration

- **Vi Mode**: Enables vim-like editing in the terminal (`set -o vi`)
- **History Settings**: Improved history handling with no duplicates
- **Color Support**: Colorized ls, grep commands
- **Useful Aliases**:
  - `ll`, `la`, `l` for various ls formats
  - `..`, `...`, `....` for quick directory navigation
  - `gs`, `ga`, `gc`, `gp`, `gl`, `gd` for git operations
- **Enhanced Prompt**: Shows user, host, and current directory with colors
- **Editor Configuration**: Sets vim/vi as default editor if available
- **Local Customization**: Sources `~/.bashrc.local` if it exists

## Customization

### Adding Personal Configurations

Create a `~/.bashrc.local` file for personal customizations that won't be overwritten:

```bash
# ~/.bashrc.local
export MY_CUSTOM_VAR="value"
alias myalias="command"
```

### Modifying the dotfiles

1. Fork this repository
2. Edit the configuration files
3. Update your devcontainer or installation to use your fork

## File Structure

```
dotfiles/
├── bashrc              # Main bash configuration
├── install.sh          # Installation script
├── .devcontainer/
│   └── devcontainer.json  # Example devcontainer configuration
├── .gitignore          # Git ignore patterns
└── README.md           # This file
```

## Testing

You can test the installation in a container:

```bash
# Test with a temporary container
docker run -it --rm ubuntu:latest bash -c "
    apt-get update && apt-get install -y git &&
    git clone https://github.com/im-sampm/dotfiles.git /dotfiles &&
    cd /dotfiles && bash install.sh &&
    bash -l
"
```

## Contributing

Feel free to submit issues and enhancement requests! This dotfiles setup is designed to be minimal but useful for most development environments.

## License

This project is open source and available under the [MIT License](LICENSE).