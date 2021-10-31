#!/bin/zsh

# Load basic bash commands
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Add the local environment variables
test -f "$HOME/.zshrc_local" && source "$HOME/.zshrc_local"

# Load the shell dotfiles in certain paths:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/dotfiles/.{exports,aliases,functions,extensions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Setup history settings
setopt HIST_IGNORE_ALL_DUPS    # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE       # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS       # Don't write duplicate entries in the history file.

# Enable completion
autoload -U compinit
compinit

# Enable color support given the themes
autoload -Uz colors && colors

# Load the theme
test -f "$HOME/dotfiles/.theme" && source "$HOME/dotfiles/.theme"
