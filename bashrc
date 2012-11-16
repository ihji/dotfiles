function link_dotfiles {
    ln -vsnf ~/.dotfiles/vimrc ~/.vimrc
    ln -vsnf ~/.dotfiles/emacs.d ~/.emacs.d
    ln -vsnf ~/.dotfiles/gitconfig ~/.gitconfig
}

. ~/.dotfiles/bash/env
. ~/.dotfiles/bash/aliases
. ~/.dotfiles/bash/config

