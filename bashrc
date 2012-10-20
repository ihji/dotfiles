function link_dotfiles {
    ln -vsnf ~/.dotfiles/vim ~/.vim
    ln -vsnf ~/.dotfiles/vimrc ~/.vimrc
    ln -vsnf ~/.dotfiles/gitconfig ~/.gitconfig
}

. ~/.dotfiles/bash/env
. ~/.dotfiles/bash/aliases
. ~/.dotfiles/bash/config

