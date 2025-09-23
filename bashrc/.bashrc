# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
#
# Use Emacs instead of neovim as default editor
export EDITOR="emacsclient -nc"
export VISUAL="emacsclient -nc"
#
# Set a custom prompt with the directory revealed (alternatively use https://starship.rs)
# PS1="\W \[\e]0;\w\a\]$PS1"

. "$HOME/.local/share/../bin/env"
. "$HOME/.cargo/env"
