# My Dofiles

A personal project to backup and document my configurations (dofiles) for tmux, nvim, and zsh. This repository serves as both a backup of my settings across machines and a learning history of my configuration journey.

## Table of Contents

- [About](#about)
- [Features](#features)
- [Stow Management](#stow-management)
- [Installation](#installation)
- [Usage](#usage)
- [Contact](#contact)

## About

This is my very first dofile project, where I explore and configure essential tools using GNU Stow:

- **tmux:** My terminal multiplexer setup.
- **nvim:** My early-stage configurations as I learn this powerful text editor.
- **zsh:** Custom configurations to enhance my shell experience.

The goal is to have a reliable backup of these configurations for use on other machines and to serve as a documented learning history. By using GNU Stow, I can keep my dotfiles organized and easily manage symlinks to their proper locations.

## Features

- **Configuration Backup:** Secure and version-controlled storage of your personal setups.
- **Learning Archive:** Document your journey and evolution in mastering tool configurations.
- **Modular Setup:** Easily update or add configurations as you experiment with new features or tools.
- **Stow Integration:** Manage symlinks effortlessly using GNU Stow for clean and organized configuration files.

## Stow Management

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks for configuration files:

- **Structure:** Each configuration (e.g., `tmux`, `nvim`, `zsh`) is kept in its own folder.
- **Symlink Creation:** By running `stow <folder_name>` in the repository directory, GNU Stow creates symbolic links from your home directory (or the designated target) to the configuration files.
- **Learning Process:** Documenting this process helps me understand and remember the steps to set up a new machine or recover my environment.

## Installation

1. **Navigate to the Project Directory:**  
   Open your terminal and navigate to the directory where this repository is located.
2. **Install GNU Stow:**  
   If you haven't already, install GNU Stow (available via most package managers). For example, on Ubuntu:
   ```bash
   sudo apt-get install stow
   ```
3. **Set Up Configurations with Stow:**
   Run the following commands to create symlinks:
   - For tmux:
     ```bash
     stow tmux
     ```
   - For nvim:
     ```bash
     stow nvim
     ```
   - For zsh:
     ```bash
     stow zsh
     ```

## Usage

After installing the configurations using Stow, apply them as follows:

- tmux: Start tmux normally; it will automatically use your .tmux.conf symlink.
- nvim: Launch nvim to see your configuration in action.
- zsh: Restart your terminal or run:
  ```bash
  source ~/.zshrc # load the new zsh settings.
  ```

## Contribution

This repository is personal and set as read-only for external contributions. It primarily serves as a backup and learning history for my configurations. If you have suggestions or feedback, feel free to open an issue or contact me directly.

## Contact

For any questions or suggestions:

- Email: caiocalhaum@gmail.com
