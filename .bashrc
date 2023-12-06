#!/usr/bin/env bash

#---------------------------------------------------------------------
# Copyright © 2023 Joe Smullen
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.
#---------------------------------------------------------------------

# aliases
alias vi="nvim"
alias q="exit 0"
alias c="clear"
alias ls="ls -lh --color=auto"
alias la="ls -a"
alias src="source ~/.bashrc"
alias del="rm ~/.bash_history"
alias vimconf="vi ~/.config/nvim/init.lua"
alias listkeys="gpg2 --list-keys --keyid-format=long"
alias fwup="fwupdmgr get-updates"
alias showmac="macchanger -s wlp3s0"

# environment variables
export PS1="\[\033[1;38;05;196m\][\u@\h] \[\033[1;38;05;44m\]\w/ \[\033[1;38;05;196m\]\$\[\033[00m\] "
export LS_COLORS="di=01;38;05;44"
export EDITOR="nvim"
export QT_QPA_PLATFORMTHEME="qt5ct"
export FIGNORE=".class"
export GPG_TTY=$(tty)
