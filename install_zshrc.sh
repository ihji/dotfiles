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

cp -nv ~/.dotfiles/home.profile ~/.profile
cp -nv ~/.dotfiles/home.zshrc ~/.zshrc
ln -vs ~/.profile ~/.zprofile

(cd ~/.dotfiles && git submodule update --init)
