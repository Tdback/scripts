#!/usr/bin/env sh

################################################################################
# @author      : Tyler Dunneback (tylerdback@pm.me)
# @file        : f
# @created     : Tue Aug 15 09:03:33 PM EDT 2023
#
# @description : Fzf shortcuts for opening files with neovim.
#################################################################################

fedit () {
    file=$(find "$@" -not -path "*/\.git*" -type f -print | fzf --bind "ctrl-o:execute-silent(setsid xdg-open {}&)")
    [ -e "$file" ] && ${EDITOR:-vi} "$file"
}

f () {
    case "$*" in
        d)
            fedit ~/Documents/
            ;;
        D)
            fedit ~/Downloads/
            ;;
        c)
            fedit ~/.config/
            ;;
        p)
            fedit ~/projects/
            ;;
        s)
            fedit ~/.scripts/
            ;;
        .)
            fedit ~/.dotfiles/
            ;;
        *)
            fedit .
            ;;
    esac
}

f "$*"
# vim: ft=sh
