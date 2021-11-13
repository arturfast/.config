#!/bin/sh
#if grep --quiet "alacritty" ps_output; 
#then notify-send "alacritty already opened"
#else alacritty &> /dev/null & disown $1
#alacritty &> /dev/null & disown $1
#fi
ps -eF > ps_output
tmp1=$(grep --count "alacritty" ps_output)

if [ $tmp1 -eq 0 ]; then 
#alacritty -e bash -c '~/scripts/donut' --hold &> /dev/null & disown $1 
alacritty -e bash -c 'neofetch && bash' --hold &> /dev/null & disown $!
sleep 0.1
alacritty &> /dev/null & disown $!
fi

if [ $tmp1 -eq 1 ]; then 
#alacritty -e bash -c '~/scripts/donut' --hold &> /dev/null & disown $1 
alacritty &> /dev/null & disown $! 
fi

if [ $tmp1 -eq 2 ]; then
notify-send "Alacritty is already opened 2x"
fi

#if grep --quiet "alacritty  neofetch_instance" ps_output; 
#then notify-send "neofetch already"
#
#else alacritty  neofetch_instance -e bash -c 'neofetch && bash' --hold & normal &> /dev/null & disown $1
#fi

# Aktiviert numlock automatisch beim Boot
numlockx on
