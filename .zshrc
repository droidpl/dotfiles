#!/bin/zsh

export PATH=$HOME/bin:/usr/local/bin:$PATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

setopt HIST_IGNORE_ALL_DUPS    # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE       # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS       # Don't write duplicate entries in the history file.

autoload -Uz colors && colors

# initialize autocomplete here, otherwise functions won't be loaded
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

if type gh &>/dev/null; then
  eval "$(gh completion -s zsh)"
fi

autoload -Uz compinit
compinit

PAGER=

# -- Oh My Zsh -----------------------------------------------------------------

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="af-magic"

plugins=(
  colored-man-pages
  git
  gitignore
  golang
  node
  npm
  nvm
)

source $ZSH/oh-my-zsh.sh
