#!bin/bash

xrandr
cvt 1920 1080
xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode Virtual1 1920x1080_60.00
xrandr --output Virtual1 --mode 1920x1080_60.00

sed '/^OLF_IFS=$IFS$/ \nxrandr i "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync\nxrandr --addmode Virtual1 1920x1080_60.00\nxrandr --output Virtual1 --mode 1920x1080\n' /etc/gdm3/Init/DefaultTwo

exit
