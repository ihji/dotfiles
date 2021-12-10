#!/bin/bash

if [ -f ~/.profile ] && [ ! -f ~/.profile.orig ]; then
    mv ~/.profile ~/.profile.orig
fi

if [ -f ~/.zprofile ] && [ ! -f ~/.zprofile.orig ]; then
    mv ~/.zprofile ~/.zprofile.orig
fi

if [ -f ~/.zshrc ] && [ ! -f ~/.zshrc.orig ]; then
    mv ~/.zshrc ~/.zshrc.orig
fi

ln -vs ~/.dotfiles/home.profile ~/.profile
ln -vs ~/.dotfiles/home.profile ~/.zprofile
ln -vs ~/.dotfiles/home.zshrc ~/.zshrc

(cd ~/.dotfiles && git submodule update --init)
