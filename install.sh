#!/bin/bash

export SUDO_ASKPASS=$HOME/.config/rofi/askpass.sh

package_search=$( rofi -dmenu -theme ~/.config/rofi/rofi.rasi -matching fuzzy -i -p "Package:")

package-query -f %n -A -Q -S --sort r -s $package_search >> /tmp/output.txt

available_package=$(cat /tmp/output.txt | rofi -dmenu -theme ~/.config/rofi/rofi.rasi -matching fuzzy -i -p "Package:")

rm /tmp/output.txt

answer=$(rofi -dmenu -theme ~/.config/rofi/rofi.rasi -matching fuzzy -i -p "Y/N:")

sudo -A echo $answer | yay --nodiffmenu --noeditmenu --noupgrademenu --removemake --cleanafter -S $available_package 

rofi -dmenu -theme ~/.config/rofi/rofi.rasi -matching fuzzy -i -p "Success!"