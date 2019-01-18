
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux
fi

function link_dotfiles {
    ln -vsn ~/.dotfiles/emacs.d ~/.emacs.d
    ln -vs  ~/.dotfiles/vimrc ~/.vimrc
    ln -vs  ~/.dotfiles/gitconfig ~/.gitconfig
    ln -vs  ~/.dotfiles/tmux.conf ~/.tmux.conf
}

. ~/.dotfiles/bash/env
. ~/.dotfiles/bash/aliases
. ~/.dotfiles/bash/config

