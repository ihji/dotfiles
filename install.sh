#!/bin/bash

if [ -f ~/.bash_profile ] && [ ! -f ~/.bash_profile.orig ]; then
    mv ~/.bash_profile ~/.bash_profile.orig
fi

if [ -f ~/.bashrc ] && [ ! -f ~/.bashrc.orig ]; then
    mv ~/.bashrc ~/.bashrc.orig
fi

ln -vs ~/.dotfiles/home.bash_profile ~/.bash_profile
ln -vs ~/.dotfiles/home.bashrc ~/.bashrc
