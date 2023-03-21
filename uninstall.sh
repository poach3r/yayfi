#!/bin/bash

export SUDO_ASKPASS=$HOME/.config/rofi/askpass.sh

yay -Q $package_search >> /tmp/output.txt

available_package=$(cat /tmp/output.txt | awk '{print $1}' | rofi -dmenu -matching fuzzy -i -p "Package:")

rm /tmp/output.txt

answer=$(rofi -dmenu -matching fuzzy -i -p "Y/N:")

sudo -A echo $answer | yay -Rns $available_package 

rofi -dmenu -matching fuzzy -i -p "Success!"