#!/bin/bash

if [ -f ~/.zshrc ] && [ ! -f ~/.zshrc.orig ]; then
    mv ~/.zshrc ~/.zshrc.orig
fi

ln -vs ~/.dotfiles/home.zshrc ~/.zshrc
