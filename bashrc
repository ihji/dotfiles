
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux
fi

. ~/.dotfiles/bash/config
. ~/.dotfiles/common/env
. ~/.dotfiles/common/aliases
. ~/.dotfiles/common/config

