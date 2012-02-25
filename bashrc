function df_install {
    cp -v ~/.dotfiles/vimrc ~/.vimrc
    cp -v ~/.dotfiles/gitconfig ~/.gitconfig
}

. ~/.dotfiles/bash/env
. ~/.dotfiles/bash/aliases
. ~/.dotfiles/bash/config

# for ruby
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
