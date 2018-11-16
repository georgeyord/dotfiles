#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

source ../.extra

env | grep WALLPAPER

function preview() {
  if [ -f ~/.iterm2/imgcat ]; then
    ~/.iterm2/imgcat "${1}"
    echo Setup the image above on screen "${2}"
  fi
}

if hash wallpaper 2> /dev/null ; then
  if [ -f "${WALLPAPER}" ]; then
    SCREEN=0
    preview "${WALLPAPER}" "${SCREEN}"
    wallpaper set --screen "${SCREEN}" "${WALLPAPER}"
  fi
  if [ -f "${WALLPAPER_1}" ]; then
    SCREEN=1
    preview "${WALLPAPER_1}" "${SCREEN}"
    wallpaper set --screen "${SCREEN}" "${WALLPAPER_1}"
  fi
  if [ -f "${WALLPAPER_2}" ]; then
    SCREEN=2
    preview "${WALLPAPER_2}" "${SCREEN}"
    wallpaper set --screen "${SCREEN}" "${WALLPAPER_2}"
  fi
else
  echo "wallpaper app is not installed, please run 'brew install wallpaper' first!"
fi