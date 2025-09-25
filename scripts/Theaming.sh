
#!/bin/bash

# Author: Michael Alves https://github.com/al4xs

# COLORS THE SCRIPT
Black='\033[1;30m'
Red='\033[1;31m'
Green='\033[1;32m'
Yellow='\033[1;33m'
Blue='\033[1;34m'
Purple='\033[1;35m'
Cyan='\033[1;36m'
White='\033[1;37m'
NC='\033[0m'
blue='\033[0;34m'
white='\033[0;37m'
lred='\033[0;31m'

# VARIABLES DATABASE
USERNAME=$(whoami)
THEMEDIR="/home/${USERNAME}/.themes"
POLYDIR="/home/${USERNAME}/.config/polybar/cuts"
CONDIR="/home/${USERNAME}"

# TRAPS CTRL-C
trap ctrl_c INT

# EXIT THE SCRIPT CTRL-C
function ctrl_c () {
echo ""
echo ""
echo -e "${Blue} ${White}[${Cyan}i${White}] Exiting the theming script"
exit 0
}

# BANNER THE SCRIPT
banner () {
echo -e "${White} ╔────────────────────────────────────────────────────────────────────╗     		  		  "
echo -e "${White} |${Blue} ████████╗██╗  ██╗███████╗ █████╗ ███╗   ███╗██╗███╗   ██╗ ██████╗ ${White} |    		  "
echo -e "${White} |${Blue} ╚══██╔══╝██║  ██║██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔════╝ ${White} |     		  "
echo -e "${White} |${Blue}    ██║   ███████║█████╗  ███████║██╔████╔██║██║██╔██╗ ██║██║  ███╗${White} |    		  "
echo -e "${White} |${Blue}    ██║   ██╔══██║██╔══╝  ██╔══██║██║╚██╔╝██║██║██║╚██╗██║██║   ██║${White} |    	          "
echo -e "${White} |${Blue}    ██║   ██║  ██║███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║╚██████╔╝${White} |    	          "
echo -e "${White} |${Blue}    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ${White} |    	          "
echo -e "${White} ┖────────────────────────────────────────────────────────────────────┙    		 	          "
echo -e "${Blue} ${White}[${Cyan}i${White}] Welcome ${Red}${USERNAME}${White} to theme launcher and mode! 		  "
echo -e "${Blue} ${White}[${Cyan}i${White}] If you want to exit the script use ${Red}[CTRL+C]                             "
echo -e "${Blue} ${White}[${Cyan}i${White}] What type of theme do you want to apply? 			  		  "
}

# THEAMING MODE SELECTOR
mode () {
clear
echo ""
banner
echo ""
echo -e "${Blue} [${Cyan}1${Blue}] Normal mode"
echo ""
echo -e "${White}  In this mode you can apply themes in normal mode."
echo -e "${White}  ideal for use while studying or playing."
echo ""
echo -e "${Blue} [${Cyan}2${Blue}] Penetration mode"
echo ""
echo -e "${White}  In this mode you can apply themes, but with an ideal penetration mode."
echo -e "${White}  To pentent HackTheBox, VulnHub, TryHackMe."
echo ""
echo -ne "${Blue} ▶ ${Red}"
read mode
case $mode in

1)
Normalthemes ;;

2)
Penetrationthemes ;;

*)
echo ""
echo -e "${Blue} ${White}[${Cyan}i${White}] Invalid option, use numbers"
sleep 2
mode
esac
}

Normalthemes () {
echo ""
echo -e "${Blue} ${White}[${Cyan}i${White}] Loading themes normal mode..."
echo ""
echo -e "${Blue} [${Cyan}1${Blue}] Default"
echo -e "${Blue} [${Cyan}2${Blue}] FBI"
echo -e "${Blue} [${Cyan}3${Blue}] DOD"
echo -e "${Blue} [${Cyan}4${Blue}] NSA"
echo -e "${Blue} [${Cyan}5${Blue}] CIA"
echo -e "${Blue} [${Cyan}6${Blue}] PF"
echo ""
echo -ne "${Blue} ▶ ${Red}"
read nmtheme
case $nmtheme in

1)
echo ""
echo -e " ${White}[${Cyan}i${White}] Loading theme ${Red}[Default]${NC}"
cd ${THEMEDIR}/Default/kitty
cp color.ini ${CONDIR}/.config/kitty
cd ${THEMEDIR}/Default
cp bspwmrc ${CONDIR}/.config/bspwm
cd ${THEMEDIR}/Default/polybar
cp user_modules.ini colors.ini config.ini ${CONDIR}/.config/polybar/cuts
cp colors.rasi ${CONDIR}/.config/polybar/cuts/scripts/rofi
echo ""
betterlockscreen -u ${THEMEDIR}/Default/wallpapers/wal-0.png
echo ""
bspc wm -r
#polybar-msg cmd restart
echo -e " ${White}[${Cyan}i${White}] ${Red}[Default]${White} theme applied correctly"
sleep 2
exit 0 ;;

2)
echo ""
echo -e " ${White}[${Cyan}i${White}] Loading theme ${Red}[FBI]${NC}"
cd ${THEMEDIR}/FBI/kitty
cp color.ini ${CONDIR}/.config/kitty
cd ${THEMEDIR}/FBI
cp bspwmrc ${CONDIR}/.config/bspwm
cd ${THEMEDIR}/FBI/polybar
cp user_modules.ini colors.ini config.ini ${CONDIR}/.config/polybar/cuts
cp colors.rasi ${CONDIR}/.config/polybar/cuts/scripts/rofi
echo ""
betterlockscreen -u ${THEMEDIR}/FBI/wallpapers/wal-0.png
echo ""
bspc wm -r
echo -e " ${White}[${Cyan}i${White}] ${Red}[FBI]${White} theme applied correctly"
sleep 2
exit 0 ;;

3)
echo ""
echo -e " ${White}[${Cyan}i${White}] Loading theme ${Red}[DOD]${NC}"
cd ${THEMEDIR}/DOD/kitty
cp color.ini ${CONDIR}/.config/kitty
cd ${THEMEDIR}/DOD
cp bspwmrc ${CONDIR}/.config/bspwm
cd ${THEMEDIR}/DOD/polybar
cp user_modules.ini colors.ini config.ini ${CONDIR}/.config/polybar/cuts
cp colors.rasi ${CONDIR}/.config/polybar/cuts/scripts/rofi
echo ""
betterlockscreen -u ${THEMEDIR}/DOD/wallpapers/wal-0.png
echo ""
bspc wm -r
echo -e " ${White}[${Cyan}i${White}] ${Red}[DOD]${White} theme applied correctly"
sleep 2
exit 0 ;;

4)
echo ""
echo -e " ${White}[${Cyan}i${White}] Loading theme ${Red}[NSA]${NC}"
cd ${THEMEDIR}/NSA/kitty
cp color.ini ${CONDIR}/.config/kitty
cd ${THEMEDIR}/NSA
cp bspwmrc ${CONDIR}/.config/bspwm
cd ${THEMEDIR}/NSA/polybar
cp user_modules.ini colors.ini config.ini ${CONDIR}/.config/polybar/cuts
cp colors.rasi ${CONDIR}/.config/polybar/cuts/scripts/rofi
echo ""
betterlockscreen -u ${THEMEDIR}/NSA/wallpapers/wal-0.png
echo ""
bspc wm -r
echo -e " ${White}[${Cyan}i${White}] ${Red}[NSA]${White} theme applied correctly"
sleep 2
exit 0 ;;

5)
echo ""
echo -e " ${White}[${Cyan}i${White}] Loading theme ${Red}[CIA]${NC}"
cd ${THEMEDIR}/CIA/kitty
cp color.ini ${CONDIR}/.config/kitty
cd ${THEMEDIR}/CIA
cp bspwmrc ${CONDIR}/.config/bspwm
cd ${THEMEDIR}/CIA/polybar
cp user_modules.ini colors.ini config.ini ${CONDIR}/.config/polybar/cuts
cp colors.rasi ${CONDIR}/.config/polybar/cuts/scripts/rofi
echo ""
betterlockscreen -u ${THEMEDIR}/CIA/wallpapers/wal-0.png
echo ""
bspc wm -r
echo -e " ${White}[${Cyan}i${White}] ${Red}[CIA]${White} theme applied correctly"
sleep 2
exit 0 ;;

6)
echo ""
echo -e " ${White}[${Cyan}i${White}] Loading theme ${Red}[PF]${NC}"
cd ${THEMEDIR}/PF/kitty
cp color.ini ${CONDIR}/.config/kitty
cd ${THEMEDIR}/PF
cp bspwmrc ${CONDIR}/.config/bspwm
cd ${THEMEDIR}/PF/polybar
cp user_modules.ini colors.ini config.ini ${CONDIR}/.config/polybar/cuts
cp colors.rasi ${CONDIR}/.config/polybar/cuts/scripts/rofi
echo ""
betterlockscreen -u ${THEMEDIR}/PF/wallpapers/wal-0.png
echo ""
bspc wm -r
echo -e " ${White}[${Cyan}i${White}] ${Red}[PF]${White} theme applied correctly"
sleep 2
exit 0 ;;


*)
echo ""
echo -e "${Blue} ${White}[${Cyan}i${White}] Invalid option, use numbers"
sleep 2
mode
esac
}

Penetrationthemes () {
echo ""
echo -e "${Blue} ${White}[${Cyan}i${White}] Loading themes penetration mode..."
echo ""
echo -e "${Blue} [${Cyan}1${Blue}] Default"
echo -e "${Blue} [${Cyan}2${Blue}] FBI"
echo -e "${Blue} [${Cyan}3${Blue}] DOD"
echo -e "${Blue} [${Cyan}4${Blue}] NSA"
echo -e "${Blue} [${Cyan}5${Blue}] CIA"
echo -e "${Blue} [${Cyan}6${Blue}] PF"
echo ""
echo -ne "${Blue} ▶ ${Red}"
read penetrationntheme
case $penetrationntheme in

1)
echo ""
echo -e " ${White}[${Cyan}i${White}] Loading theme penetration mode ${Red}[Default]${NC}"
cd ${THEMEDIR}/Default/kitty
cp color.ini ${CONDIR}/.config/kitty
cd ${THEMEDIR}/Default
cp bspwmrc ${CONDIR}/.config/bspwm
cd ${THEMEDIR}/Default/polybar
cp user_modules.ini colors.ini ${CONDIR}/.config/polybar/cuts
cp colors.rasi ${CONDIR}/.config/polybar/cuts/scripts/rofi
cd ${THEMEDIR}/Default/bar_pentest
cp config.ini ${CONDIR}/.config/polybar/cuts
cd ${THEMEDIR}/Default/scripts
cp ethernet_status.sh machine_target.sh vpn_status.sh ${CONDIR}/.config/polybar/cuts/scripts
echo ""
betterlockscreen -u ${THEMEDIR}/Default/wallpapers/wal-0.png
echo ""
bspc wm -r
#polybar-msg cmd restart
echo -e " ${White}[${Cyan}i${White}] ${Red}[Default]${White} theme applied correctly"
sleep 2
exit 0 ;;

2)
echo ""
echo -e " ${White}[${Cyan}i${White}] Loading theme penetration mode ${Red}[FBI]${NC}"
cd ${THEMEDIR}/FBI/kitty
cp color.ini ${CONDIR}/.config/kitty
cd ${THEMEDIR}/FBI
cp bspwmrc ${CONDIR}/.config/bspwm
cd ${THEMEDIR}/FBI/polybar
cp user_modules.ini colors.ini ${CONDIR}/.config/polybar/cuts
cp colors.rasi ${CONDIR}/.config/polybar/cuts/scripts/rofi
cd ${THEMEDIR}/FBI/bar_pentest
cp config.ini ${CONDIR}/.config/polybar/cuts
cd ${THEMEDIR}/FBI/scripts
cp ethernet_status.sh machine_target.sh vpn_status.sh ${CONDIR}/.config/polybar/cuts/scripts
echo ""
betterlockscreen -u ${THEMEDIR}/FBI/wallpapers/wal-0.png
echo ""
bspc wm -r
#polybar-msg cmd restart
echo -e " ${White}[${Cyan}i${White}] ${Red}[FBI]${White} theme applied correctly"
sleep 2
exit 0 ;;

3)
echo ""
echo -e " ${White}[${Cyan}i${White}] Loading theme penetration mode ${Red}[DOD]${NC}"
cd ${THEMEDIR}/DOD/kitty
cp color.ini ${CONDIR}/.config/kitty
cd ${THEMEDIR}/DOD
cp bspwmrc ${CONDIR}/.config/bspwm
cd ${THEMEDIR}/DOD/polybar
cp user_modules.ini colors.ini ${CONDIR}/.config/polybar/cuts
cp colors.rasi ${CONDIR}/.config/polybar/cuts/scripts/rofi
cd ${THEMEDIR}/DOD/bar_pentest
cp config.ini ${CONDIR}/.config/polybar/cuts
cd ${THEMEDIR}/DOD/scripts
cp ethernet_status.sh machine_target.sh vpn_status.sh ${CONDIR}/.config/polybar/cuts/scripts
echo ""
betterlockscreen -u ${THEMEDIR}/DOD/wallpapers/wal-0.png
echo ""
bspc wm -r
#polybar-msg cmd restart
echo -e " ${White}[${Cyan}i${White}] ${Red}[DOD]${White} theme applied correctly"
sleep 2
exit 0 ;;

4)
echo ""
echo -e " ${White}[${Cyan}i${White}] Loading theme penetration mode ${Red}[NSA]${NC}"
cd ${THEMEDIR}/NSA/kitty
cp color.ini ${CONDIR}/.config/kitty
cd ${THEMEDIR}/NSA
cp bspwmrc ${CONDIR}/.config/bspwm
cd ${THEMEDIR}/NSA/polybar
cp user_modules.ini colors.ini ${CONDIR}/.config/polybar/cuts
cp colors.rasi ${CONDIR}/.config/polybar/cuts/scripts/rofi
cd ${THEMEDIR}/NSA/bar_pentest
cp config.ini ${CONDIR}/.config/polybar/cuts
cd ${THEMEDIR}/NSA/scripts
cp ethernet_status.sh machine_target.sh vpn_status.sh ${CONDIR}/.config/polybar/cuts/scripts
echo ""
betterlockscreen -u ${THEMEDIR}/NSA/wallpapers/wal-0.png
echo ""
bspc wm -r
#polybar-msg cmd restart
echo -e " ${White}[${Cyan}i${White}] ${Red}[NSA]${White} theme applied correctly"
sleep 2
exit 0 ;;

5)
echo ""
echo -e " ${White}[${Cyan}i${White}] Loading theme penetration mode ${Red}[CIA]${NC}"
cd ${THEMEDIR}/CIA/kitty
cp color.ini ${CONDIR}/.config/kitty
cd ${THEMEDIR}/CIA
cp bspwmrc ${CONDIR}/.config/bspwm
cd ${THEMEDIR}/CIA/polybar
cp user_modules.ini colors.ini ${CONDIR}/.config/polybar/cuts
cp colors.rasi ${CONDIR}/.config/polybar/cuts/scripts/rofi
cd ${THEMEDIR}/CIA/bar_pentest
cp config.ini ${CONDIR}/.config/polybar/cuts
cd ${THEMEDIR}/CIA/scripts
cp ethernet_status.sh machine_target.sh vpn_status.sh ${CONDIR}/.config/polybar/cuts/scripts
echo ""
betterlockscreen -u ${THEMEDIR}/CIA/wallpapers/wal-0.png
echo ""
bspc wm -r
#polybar-msg cmd restart
echo -e " ${White}[${Cyan}i${White}] ${Red}[CIA]${White} theme applied correctly"
sleep 2
exit 0 ;;

6)
echo ""
echo -e " ${White}[${Cyan}i${White}] Loading theme penetration mode ${Red}[PF]${NC}"
cd ${THEMEDIR}/PF/kitty
cp color.ini ${CONDIR}/.config/kitty
cd ${THEMEDIR}/PF
cp bspwmrc ${CONDIR}/.config/bspwm
cd ${THEMEDIR}/PF/polybar
cp user_modules.ini colors.ini ${CONDIR}/.config/polybar/cuts
cp colors.rasi ${CONDIR}/.config/polybar/cuts/scripts/rofi
cd ${THEMEDIR}/PF/bar_pentest
cp config.ini ${CONDIR}/.config/polybar/cuts
cd ${THEMEDIR}/PF/scripts
cp ethernet_status.sh machine_target.sh vpn_status.sh ${CONDIR}/.config/polybar/cuts/scripts
echo ""
betterlockscreen -u ${THEMEDIR}/PF/wallpapers/wal-0.png
echo ""
bspc wm -r
#polybar-msg cmd restart
echo -e " ${White}[${Cyan}i${White}] ${Red}[PF]${White} theme applied correctly"
sleep 2
exit 0 ;;

*)
echo ""
echo -e "${Blue} ${White}[${Cyan}i${White}] Invalid option, use numbers"
sleep 2
mode
esac
}

# CALL MENUS THE SCRIPT THEMES AND RESET
reset
mode
