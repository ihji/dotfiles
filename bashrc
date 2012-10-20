function link_dotfiles {
    rm -f ~/.vimrc
    rm -f ~/.gitconfig

    ln -s ~/.dotfiles/vimrc ~/.vimrc
    ln -s ~/.dotfiles/gitconfig ~/.gitconfig
}

. ~/.dotfiles/bash/env
. ~/.dotfiles/bash/aliases
. ~/.dotfiles/bash/config

