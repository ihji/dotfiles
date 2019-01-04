function link_dotfiles {
    ln -vs  ~/.dotfiles/vimrc ~/.vimrc
    ln -vsn ~/.dotfiles/emacs.d ~/.emacs.d
    ln -vs  ~/.dotfiles/gitconfig ~/.gitconfig
}

. ~/.dotfiles/bash/env
. ~/.dotfiles/bash/aliases
. ~/.dotfiles/bash/config

