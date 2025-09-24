#!/bin/bash

sudo apt update -y
sudo updatedb


# COLOR USE THE SCRIPT
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
IWhite="\[\033[0;97m\]"

# VARIABLE DATABASE AND OTHER THINGS
USERNAME=$(whoami)
LOCALPATH="/home/${USERNAME}"
KERNEL=$(uname -r)
DISTRIBUTION=$(uname -o)
HOST=$(uname -n)
BIT=$(uname -m)
RUTE=$(pwd)
FDIR="${LOCALPATH}/.local/share/fonts/"

# SCRIPT PRESENTATION
banner () {
echo -e "${White} ╔───────────────────────────────────────────────╗                     "
echo -e "${White} |${Cyan} ██████╗ ███████╗██████╗ ██╗    ██╗███╗   ███╗${White} |      "
echo -e "${White} |${Cyan} ██╔══██╗██╔════╝██╔══██╗██║    ██║████╗ ████║${White} |      "
echo -e "${White} |${Cyan} ██████╔╝███████╗██████╔╝██║ █╗ ██║██╔████╔██║${White} |      "
echo -e "${White} |${Cyan} ██╔══██╗╚════██║██╔═══╝ ██║███╗██║██║╚██╔╝██║${White} |      "
echo -e "${White} |${Cyan} ██████╔╝███████║██║     ╚███╔███╔╝██║ ╚═╝ ██║${White} |      "
echo -e "${White} |${Cyan} ╚═════╝ ╚══════╝╚═╝      ╚══╝╚══╝ ╚═╝     ╚═╝${White} |      "
echo -e "${White} ┖───────────────────────────────────────────────┙                     "
echo ""
echo -e "${White} [${Blue}i${White}] BSPWM | Hacker environment automation script."
echo -e "${White} [${Blue}i${White}] Michael Alves ( Al4xs ) or Sung jin woo"
echo ""
echo -e "${White} [${Blue}i${White}] Installation will begin soon."
echo ""
sleep 4
echo -e "${White} [${Blue}i${White}] Hello ${Red}${USERNAME}${White}, This is the bspwm installation script for kali linux"
}

# INSTALLATION OF MISSING DEPENDENCIES
missing_dependencies () {
echo ""
sudo apt update -y
echo -e "${White} [${Blue}i${White}] Step 9 installing missing dependencies"
sleep 2
echo ""
sudo apt install rofi fonts-firacode fonts-cantarell lxappearance nitrogen lsd betterlockscreen git net-tools xclip xdotool open-vm-tools open-vm-tools-desktop -y
echo ""
sudo apt install scrub bat tty-clock openvpn feh pulseaudio-utils git lolcat -y
echo "Install my favorite tools"
sudo apt install cmatrix flameshot hollywood bpytop apktool seclists villain rlwrap python3-venv aircrack-ng strace binwalk irssi imagemagick mplayer jq cmatrix weechat hexchat ltrace numlockx sublist3r htop neofetch kali-community-wallpapers feroxbuster naabu massdns obsidian golang-go pipx autorecon golang finalrecon ffuf findomain trufflehog cool-retro-term -y
echo "Install with pip3"
pipx install pywal metafinder uro bhedak arjun
pip3 install jsbeautifier eng_to_ipa requests argparse colored urllib3 --break-system-packages
echo "Install tool bug bounty"

}

# INSTALL BSPWM KALI LINUX SETUP
setup () {
clear
echo ""
banner
sleep 1
echo -ne "${White} [${Blue}!${White}] Do you want to continue with the installation? Y|N ▶ ${Red}"
read quest


if [[ $quest == "y" || $quest == "yes" || $quest == "Y" ]]; then
        echo ""
        echo -e "${White} [${Blue}i${White}] Step 1 checking if bspwm and sxhkd are installed"
        sleep 2
        if which bspwm >/dev/null; then
                echo ""
                echo -e "${White} [${Blue}+${White}] BSPWM is installed, installing configuration"
                sleep 2
                cd ${RUTE}/.config
                sudo rm -rf ${LOCALPATH}/.config/bspwm
                cp -r bspwm ${LOCALPATH}/.config/bspwm
                chmod +x ${LOCALPATH}/.config/bspwm/bspwmrc
        else
                echo ""
                echo -e "${White} [${Red}-${White}] BSPWM is not installed, installing bspwm"
                sleep 2
                echo ""
                sudo apt update
                echo ""
                sudo apt install bspwm -y
                echo ""
                echo -e "${White} [${Blue}+${White}] BSPWM is installed, installing configuration"
                sleep 2
                cd ${RUTE}/.config
                sudo rm -rf ${LOCALPATH}/.config/bspwm
                cp -r bspwm ${LOCALPATH}/.config/bspwm
                chmod +x ${LOCALPATH}/.config/bspwm/bspwmrc
        fi
        if which sxhkd >/dev/null; then
                echo ""
                echo -e "${White} [${Blue}+${White}] SXHKD is installed, installing configuration"
                sleep 2
                cd ${RUTE}/.config
                sudo rm -rf ${LOCALPATH}/.config/sxhkd
                cp -r sxhkd ${LOCALPATH}/.config/sxhkd
                chmod +x ${LOCALPATH}/.config/sxhkd/sxhkdrc
        else
                echo ""
                echo -e "${White} [${Red}-${White}] SXHKD is not installed, installing sxhkd"
                sleep 2
                echo ""
                sudo apt update
                echo ""
                sudo apt install sxhkd -y
                echo ""
                echo -e "${White} [${Blue}+${White}] SXHKD is installed, installing configuration"
                sleep 2
                cd ${RUTE}/.config
                sudo rm -rf ${LOCALPATH}/.config/sxhkd
                cp -r sxhkd ${LOCALPATH}/.config/sxhkd
                chmod +x ${LOCALPATH}/.config/sxhkd/sxhkdrc
        fi
                echo ""
                echo -e "${White} [${Blue}i${White}] Step 2 installing fonts"
                sleep 2
                echo ""
                echo -e "${White} [${Blue}+${White}] Installing configuration, the fonts"
                sleep 3
                echo ""
                cd ${RUTE}
                sudo rm -rf ${LOCALPATH}/.fonts
                cp -r .fonts ${LOCALPATH}
                sudo cp -r .fonts /usr/share/fonts
                echo -e "${White} [${Blue}+${White}] Installed fonts"
                sleep 2
                echo ""
                echo -e "${White} [${Blue}i${White}] Step 3 check if the kitty terminal is installed"
                sleep 2

        if which kitty >/dev/null; then
                echo ""
                echo -e "${White} [${Blue}+${White}] KITTY is installed, installing configuration"
                sleep 2
                cd ${RUTE}/.config
                sudo rm -rf ${LOCALPATH}/.config/kitty
                cp -r kitty ${LOCALPATH}/.config/kitty
        else
                echo ""
                echo -e "${White} [${Red}-${White}] KITTY is not installed, installing kitty"
                sleep 2
                echo ""
                sudo apt update
                echo ""
                sudo apt install kitty -y
                echo ""
                echo -e "${White} [${Blue}+${White}] KITTY is installed, installing configuration"
                sleep 2
                cd ${RUTE}/.config
                sudo rm -rf ${LOCALPATH}/.config/kitty
                cp -r kitty ${LOCALPATH}/.config/kitty
                echo ""
                echo -e "${White} [${Blue}i${White}] Step 4 check if the picom compositor is installed"
                sleep 2
        fi
        if which picom >/dev/null; then
                echo ""
                echo -e "${White} [${Blue}+${White}] PICOM is installed, installing configuration"
                sleep 2
                cd ${RUTE}/.config
                sudo rm -rf ${LOCALPATH}/.config/picom
                cp -r picom ${LOCALPATH}/.config/picom
        else
                echo ""
                echo -e "${White} [${Red}-${White}] PICOM is not installed, installing picom compositor"
                sleep 2
                echo ""
                sudo apt update
                echo ""
                sudo apt install picom -y
                echo ""
                echo -e "${White} [${Blue}+${White}] PICOM is installed, installing configuration"
                sleep 2
                cd ${RUTE}/.config
                sudo rm -rf ${LOCALPATH}/.config/picom
                cp -r picom ${LOCALPATH}/.config/picom
                echo ""
                echo -e "${White} [${Blue}i${White}] Step 5 check if the neofetch is installed"
                sleep 2
        fi
        if which neofetch >/dev/null; then
                echo ""
                echo -e "${White} [${Blue}+${White}] NEOFETCH is installed, installing configuration"
                sleep 2
                cd ${RUTE}/.config
                sudo rm -rf ${LOCALPATH}/.config/neofetch
                cp -r neofetch ${LOCALPATH}/.config/neofetch
        else
                echo ""
                echo -e "${White} [${Red}-${White}] NEOFETCH is not installed, installing neofetch"
                sleep 2
                echo ""
                sudo apt update
                echo ""
                sudo apt install neofetch -y
                echo ""
                echo -e "${White} [${Blue}+${White}] NEOFETCH is installed, installing configuration"
                sleep 2
                cd ${RUTE}/.config
                sudo rm -rf ${LOCALPATH}/.config/neofetch
                cp -r neofetch ${LOCALPATH}/.config/neofetch
                echo ""
                echo -e "${White} [${Blue}i${White}] Step 6 check if the ranger is installed"
                sleep 2
        fi
        if which ranger >/dev/null; then
                echo ""
                echo -e "${White} [${Blue}+${White}] RANGER is installed, installing configuration"
                sleep 2
                cd ${RUTE}/.config
                sudo rm -rf ${LOCALPATH}/.config/ranger
                cp -r ranger ${LOCALPATH}/.config/ranger
        else
                echo ""
                echo -e "${White} [${Red}-${White}] RANGER is not installed, installing ranger"
                sleep 2
                echo ""
                sudo apt update
                echo ""
                sudo apt install ranger -y
                echo ""
                echo -e "${White} [${Blue}+${White}] RANGER is installed, installing configuration"
                sleep 2
                cd ${RUTE}/.config
                sudo rm -rf ${LOCALPATH}/.config/ranger
                cp -r ranger ${LOCALPATH}/.config/ranger
                echo ""
                echo -e "${White} [${Blue}i${White}] Step 7 check if the cava is installed"
                sleep 2
        fi
        if which cava >/dev/null; then
                echo ""
                echo -e "${White} [${Blue}+${White}] CAVA is installed, installing configuration"
                sleep 2
                cd ${RUTE}/.config
                sudo rm -rf ${LOCALPATH}/.config/cava
                cp -r cava ${LOCALPATH}/.config/cava
        else
                echo ""
                echo -e "${White} [${Red}-${White}] CAVA is not installed, installing cava"
                sleep 2
                echo ""
                sudo apt update
                echo ""
                sudo apt install cava -y
                echo ""
                echo -e "${White} [${Blue}+${White}] CAVA is installed, installing configuration"
                sleep 2
                cd ${RUTE}/.config
                sudo rm -rf ${LOCALPATH}/.config/cava
                cp -r cava ${LOCALPATH}/.config/cava
                echo ""
                echo -e "${White} [${Blue}i${White}] Step 8 check if the polybar is installed"
                sleep 2
        fi
        if which polybar >/dev/null; then
                echo ""
                echo -e "${White} [${Blue}+${White}] POLYBAR is installed, installing configuration"
                sleep 2
                cd ${RUTE}/.config
                sudo rm -rf ${LOCALPATH}/.config/polybar
                cp -r polybar ${LOCALPATH}/.config/polybar
                chmod +x ${LOCALPATH}/.config/polybar/cuts/launch.sh
                chmod +x ${LOCALPATH}/.config/polybar/cuts/scripts/*.sh
        else
                echo ""
                echo -e "${White} [${Red}-${White}] POLYBAR is not installed, installing polybar"
                sleep 2
                echo ""
                sudo apt update
                echo ""
                sudo apt install polybar -y
                echo ""
                echo -e "${White} [${Blue}+${White}] POLYBAR is installed, installing configuration"
                sleep 2
                cd ${RUTE}/.config
                sudo rm -rf ${LOCALPATH}/.config/polybar
                cp -r polybar ${LOCALPATH}/.config/polybar
                chmod +x ${LOCALPATH}/.config/polybar/launch.sh
                chmod +x ${LOCALPATH}/.config/polybar/cuts/scripts/*.sh
        fi

##############################################################################################
# Necessary instalation

        if locate Nerd-Font-Complete >/dev/null; then
                echo ""
                echo -e "${White} [${Blue}+${White}] Nerd-Font is installed"
                sleep 2
        else
                echo ""
                echo -e "${White} [${Red}-${White}] Nerd-Font is not installed, installing Nerd-Fonts"
                sleep 2
                echo ""
                cp -r ${RUTE}/home/fonts/* $FDIR
                sleep 2
        fi
        if [[ -d ~/Wallpapers ]]; then
                echo ""
                echo -e "${White} [${Blue}+${White}] Wallpapers is installed, installing configuration"
                sleep 2
                cp -r ${RUTE}/home/Wallpapers/* ~/Wallpapers
        else
                echo ""
                echo -e "${White} [${Red}-${White}] Wallpapers is not installed, installing Wallpapers"
                cp -r ${RUTE}/home/Wallpapers ~/
                sleep 2
        fi
        if which lightdm >/dev/null; then
                echo ""
                echo -e "${White} [${Blue}+${White}] Lightdm is installed, installing screenlogin configs"
                sleep 2
                sudo cp -rv ~/Wallpapers/perfil.jpeg /usr/share/backgrounds/kali
                sudo cp -rv ~/Wallpapers/screenlogin.png /usr/share/backgrounds/kali
                sudo cp -r ${RUTE}/home/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/
                sleep 2
        else
                echo ""
                echo -e "${White} [${Red}-${White}] Lightdm is not installed, installing screenlogin configs"
                sleep 2
                sudo cp -rv ~/Wallpapers/perfil.jpeg /usr/share/backgrounds/kali
                sudo cp -rv ~/Wallpapers/screenlogin.png /usr/share/backgrounds/kali
                sudo cp -r ${RUTE}/home/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/
                sleep 2
        fi
        if [[ -d ~/hacktools ]]; then
                echo ""
                echo -e "${White} [${Blue}+${White}] Hacktools is installed, installing configuration"
                sleep 2
                cp -r ${RUTE}/home/hacktools/* ~/hacktools/
                sleep 2
        else
                echo ""
                echo -e "${White} [${Red}-${White}] Hacktools is not installed, installing Hacktools"
                cp -r ${RUTE}/home/hacktools ~/
                sleep 2
        fi
        if which charles4 >/dev/null; then
                echo ""
                echo -e "${White} [${Blue}+${White}] Charles-Proxy is installed, installing Dark Theme configuration"
                sudo rm -rf /usr/share/applications/charles-proxy.desktop
                sudo cp -r ${RUTE}/home/applications/charles-proxy.desktop /usr/share/applications/charles-proxy.desktop
                sleep 2
        else
                echo ""
                echo -e "${White} [${Red}-${White}] Charles-Proxy is not installed, installing Charles-Proxy"
                cd & wget -qO- https://www.charlesproxy.com/packages/apt/charles-repo.asc | sudo tee /etc/apt/keyrings/charles-repo.asc
                sudo sh -c 'echo deb [signed-by=/etc/apt/keyrings/charles-repo.asc] https://www.charlesproxy.com/packages/apt/ charles-proxy main > /etc/apt/sources.list.d/charles.list'
                sudo apt-get update && sudo apt-get install charles-proxy
                sudo rm -rf /usr/share/applications/charles-proxy.desktop
                sudo cp -r ${RUTE}/home/applications/charles-proxy.desktop /usr/share/applications/charles-proxy.desktop
                sleep 2
        fi

        if which firefox >/dev/null; then
                echo ""
                echo -e "${White} [${Blue}+${White}] Firefox is installed, installing Theme configuration"
                sudo cp -r ${RUTE}/home/firefox/chrome/ "$(locate xulstore.json | grep '.mozilla/firefox' | cut -d '/' -f 1-6)/"
                sleep 2
        else
                echo ""
                echo -e "${White} [${Red}-${White}] Firefox is not installed, installing Firefox"
                sudo apt install firefox -y
                sudo cp -r ${RUTE}/home/firefox/chrome/ "$(locate xulstore.json | grep '.mozilla/firefox' | cut -d '/' -f 1-6)/"
                sleep 2
        fi
        if which wal >/dev/null; then
                echo ""
                echo -e "${White} [${Blue}+${White}] Wal is installed, installing Theme configuration"
                sudo rm -rf ~/.cache/wal
                sudo cp -r ${RUTE}/home/wal ~/.cache/wal
                sudo rm -rf /root/.cache/wal
                sudo cp -r ${RUTE}/home/wal /root/.cache/
        else
                echo ""
                echo -e "${White} [${Red}-${White}] Wal is not installed, installing Wal"
                sudo rm -rf ~/.cache/wal
                sudo cp -r ${RUTE}/home/wal ~/.cache/wal
                sudo rm -rf /root/.cache/wal
                sudo cp -r ${RUTE}/home/wal /root/.cache/
                sleep 2
        fi

        if which gf >/dev/null; then
                echo ""
                echo -e "${White} [${Blue}+${White}] gf is installed, installing more templates gf"
                cp -r ${RUTE}/home/.gf ~/
                cp -r ${RUTE}/home/.gf-completions ~/
                sleep 2
        else
                echo ""
                echo -e "${White} [${Red}-${White}] gf is not installed, installing gf"
                cp -r ${RUTE}/home/.gf ~/
                cp -r ${RUTE}/home/.gf-completions ~/
                sleep 2
        fi
        if which cent >/dev/null; then
                echo ""
                echo -e "${White} [${Blue}+${White}] tools too bug bounty is installed"
                sleep 2
        else
                echo ""
                echo -e "${White} [${Red}-${White}] tools too bug bounty is not installed, installing tools"
                go install github.com/tomnomnom/meg@latest 2>/dev/null
                go install github.com/ferreiraklet/Airi@latest 2>/dev/null
                go install github.com/pry0cc/tew@latest 2>/dev/null
                go install github.com/ferreiraklet/airixss@latest 2>/dev/null
                go install github.com/projectdiscovery/alterx/cmd/alterx@latest 2>/dev/null
                go install github.com/tomnomnom/anew@latest 2>/dev/null
                go install github.com/ndelphit/apkurlgrep@latest 2>/dev/null
                go install github.com/projectdiscovery/asnmap/cmd/asnmap@latest 2>/dev/null
                go install github.com/tomnomnom/assetfinder@latest 2>/dev/null
                go install github.com/sw33tLie/bbscope@latest 2>/dev/null
                go install github.com/edoardottt/cariddi/cmd/cariddi@latest 2>/dev/null
                go install github.com/xm1k3/cent@latest 2>/dev/null
                go install github.com/dwisiswant0/cf-check@latest 2>/dev/null
                go install github.com/projectdiscovery/chaos-client/cmd/chaos@latest 2>/dev/null
                go install github.com/jpillora/chisel@latest 2>/dev/null
                go install github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest 2>/dev/null
                go install github.com/edoardottt/csprecon/cmd/csprecon@latest 2>/dev/null
                go install github.com/projectdiscovery/cvemap/cmd/cvemap@latest 2>/dev/null
                go install github.com/al4xs/deconstructurl@latest 2>/dev/null
                go install github.com/m4dm0e/dirdar@latest 2>/dev/null
                go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest 2>/dev/null
                go install github.com/trickest/dsieve@latest 2>/dev/null
                go install github.com/tomnomnom/fff@latest 2>/dev/null
                go install github.com/takshal/freq@latest 2>/dev/null
                go install github.com/dwisiswant0/galer@latest 2>/dev/null
                go install github.com/lc/gau/v2/cmd/gau@latest 2>/dev/null
                go install github.com/bp0lr/gauplus@latest 2>/dev/null
                go install github.com/003random/getJS/v2@latest 2>/dev/null
                go install github.com/tomnomnom/gf@latest 2>/dev/null
                go install github.com/damit5/gitdorks_go@latest 2>/dev/null
                go install github.com/gwen001/github-endpoints@latest 2>/dev/null
                go install github.com/gwen001/github-subdomains@latest 2>/dev/null
                go install github.com/dwisiswant0/go-dork@latest 2>/dev/null
                go install github.com/deletescape/goop@latest 2>/dev/null
                go install github.com/jaeles-project/gospider@latest 2>/dev/null
                go install github.com/Josue87/gotator@latest 2>/dev/null
                go install github.com/sensepost/gowitness@latest 2>/dev/null
                go install github.com/tomnomnom/gron@latest 2>/dev/null
                go install github.com/KathanP19/Gxss@latest 2>/dev/null
                go install github.com/hakluke/hakcheckurl@latest 2>/dev/null
                go install github.com/hakluke/hakip2host@latest 2>/dev/null
                go install github.com/hakluke/hakrawler@latest 2>/dev/null
                go install github.com/hakluke/hakrevdns@latest 2>/dev/null
                go install github.com/hakluke/haktrails@latest 2>/dev/null
                go install github.com/tomnomnom/hacks/html-tool@latest 2>/dev/null
                go install github.com/tomnomnom/httprobe@latest 2>/dev/null
                go install github.com/projectdiscovery/httpx/cmd/httpx@latest 2>/dev/null
                go install github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest 2>/dev/null
                go install github.com/ThreatUnkown/jsubfinder@latest 2>/dev/null
                go install github.com/projectdiscovery/katana/cmd/katana@latest 2>/dev/null
                go install github.com/ropnop/kerbrute@latest 2>/dev/null
                go install github.com/assetnote/kiterunner@latest 2>/dev/null
                go install github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest 2>/dev/null
                go install github.com/daehee/mildew/cmd/mildew@latest 2>/dev/null
                go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest 2>/dev/null
                go install github.com/projectdiscovery/notify/cmd/notify@latest 2>/dev/null
                go install github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest 2>/dev/null
                go install github.com/detectify/page-fetch@latest 2>/dev/null
                go install github.com/d3mondev/puredns/v2@latest 2>/dev/null
                go install github.com/rix4uni/pvreplace@latest 2>/dev/null
                go install github.com/tomnomnom/qsreplace@latest 2>/dev/null
                go install github.com/root4loot/rescope/cmd/rescope@latest 2>/dev/null
                go install github.com/Josue87/resolveDomains@latest 2>/dev/null
                go install github.com/shenwei356/rush@latest 2>/dev/null
                go install github.com/ferreiraklet/scopein@latest 2>/dev/null
                go install github.com/j3ssie/sdlookup@latest 2>/dev/null
                go install github.com/bitquark/shortscan/cmd/shortscan@latest 2>/dev/null
                go install github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest 2>/dev/null
                go install github.com/channyein1337/sonarbyte@latest 2>/dev/null
                go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest 2>/dev/null
                go install github.com/lc/subjs@latest 2>/dev/null
                go install github.com/PentestPad/subzy@latest 2>/dev/null
                go install github.com/tomnomnom/hacks/tojson@latest 2>/dev/null
                go install github.com/projectdiscovery/uncover/cmd/uncover@latest 2>/dev/null
                go install github.com/dwisiswant0/unew@latest 2>/dev/null
                go install github.com/tomnomnom/unfurl@latest 2>/dev/null
                go install github.com/projectdiscovery/urlfinder/cmd/urlfinder@latest 2>/dev/null
                go install github.com/tomnomnom/waybackurls@latest 2>/dev/null
                go install github.com/rix4uni/xsschecker@latest 2>/dev/null
                go install github.com/xnl-h4ck3r/webpaste@latest 2>/dev/null
                go install github.com/svennergr/x-anti-burl@latest 2>/dev/null
                go install github.com/hahwul/dalfox/v2@latest 2>/dev/null
                go install github.com/edoardottt/pphack/cmd/pphack@latest 2>/dev/null
                echo ""
                echo -e "${White} [${Blue}i${White}] Setting permissions too binaries installed"
                cd && chmod +x go/bin/* 2>/dev/null
                sleep 2

        fi
                echo -e "${White} [${Blue}i${White}] Clearing Hacktools too install programs updated"
                rm -rf ~/hacktools/LinkFinder ~/hacktools/SecretFinder ~/hacktools/ParamSpider ~/hacktools/Gopherus ~/hacktools/HExHTTP ~/hacktools/gitdorks_go ~/hacktools/JSScanner
                echo " "
                echo -e "${White} [${Blue}i${White}] Instaling more hacktools too folder -> hacktools"
                git clone https://github.com/GerbenJavado/LinkFinder.git && mv LinkFinder ~/hacktools
                git clone https://github.com/m4ll0k/SecretFinder.git && mv SecretFinder ~/hacktools
                git clone https://github.com/devanshbatham/ParamSpider.git && mv ParamSpider ~/hacktools && pip install ~/hacktools/ParamSpider/ --break-system-packages
                git clone https://github.com/tarunkant/Gopherus.git && mv Gopherus ~/hacktools && chmod +x ~/hacktools/Gopherus/gopherus.py && sudo ln -sf ~/hacktools/Gopherus/gopherus.py ~/go/bin/gopherus
                git clone https://github.com/c0dejump/HExHTTP.git && mv HExHTTP ~/hacktools && pip install -r ~/hacktools/HExHTTP/requirements.txt --break-system-packages
                git clone https://github.com/damit5/gitdorks_go.git && mv gitdorks_go/Dorks ~/hacktools/dorks && rm -rf gitdorks_go
                git clone https://github.com/0x240x23elu/JSScanner.git && mv JSScanner ~/hacktools
                git clone https://github.com/RUB-NDS/CORStest.git && mv CORStest ~/hacktools
                curl -s -X GET https://raw.githubusercontent.com/shubhamrooter/ShodanSpider/refs/heads/main/shodanspider.sh -o ~/hacktools/shodanspider.sh && chmod +x ~/hacktools/shodanspider.sh
                echo ""
                echo -e "${White} [${Blue}i${White}] Installng customized wordlists -> hacktools"
                mkdir ~/hacktools/wordlists 2>/dev/null
                curl -s -X GET https://raw.githubusercontent.com/maverickNerd/wordlists/refs/heads/master/cvePaths.txt -o ~/hacktools/wordlists/cvePaths.txt
                curl -s -X GET https://raw.githubusercontent.com/ricardolongatto/dnsrato/refs/heads/master/rato.txt -o ~/hacktools/wordlists/cvePaths.txt
                curl -s -X GET https://wordlists-cdn.assetnote.io/data/automated/httparchive_apiroutes_2024_05_28.txt -o ~/hacktools/wordlists/api-routes.txt
                curl -s -X GET https://wordlists-cdn.assetnote.io/data/manual/best-dns-wordlist.txt -o ~/hacktools/wordlists/best-dns-wordlist.txt
                curl -s -X GET https://wordlists-cdn.assetnote.io/data/automated/httparchive_parameters_top_1m_2024_05_28.txt -o ~/hacktools/wordlists/top-parameters.txt
                curl -s -X GET https://gist.githubusercontent.com/six2dez/ffc2b14d283e8f8eff6ac83e20a3c4b4/raw/8f9fa10e35ddc5f3ef4496b72da5c5cad3f230bf/permutations_list.txt -o ~/hacktools/wordlists/dns-permutation.txt
                curl -s -X GET https://raw.githubusercontent.com/blacklanternsecurity/public-dns-servers/refs/heads/master/nameservers.txt -o ~/hacktools/wordlists/nameservers.txt
                curl -s -X GET https://wordlists-cdn.assetnote.io/data/manual/bak.txt -o ~/hacktools/wordlists/backup-endpoint.txt
                curl -s -X GET https://raw.githubusercontent.com/proabiral/Fresh-Resolvers/refs/heads/master/resolvers.txt -o ~/hacktools/wordlists/resolvers-atualizados.txt
                curl -s -X GET https://raw.githubusercontent.com/trickest/resolvers/refs/heads/main/resolvers.txt -o ~/hacktools/wordlists/resolvers.txt
                curl -s -X GET https://raw.githubusercontent.com/ricardolongatto/dnsrato/refs/heads/master/rato.txt -o ~/hacktools/wordlists/rato-dns-portuguese.txt
                
                
                
                


################################## extra configs


                echo -e "${White} [${Blue}i${White}] installing vim config"
                echo -e "set nocompatible\nset nu\nsyntax on\nset encoding=utf-8\n\nset showcmd\nfiletype plugin indent on\n\nset tabstop=2\nset shiftwidth=2\nset expandtab\nset backspace=indent,eol,start\n\nset hlsearch\nset incsearch\nset ignorecase\nset smartcase" > ~/.vimrc
                echo -e ""


##################################### INSTALL THEMES

                missing_dependencies
                echo -e "${White} [${Blue}i${White}] Step 10 installing bspwm themes"
                sleep 2
                cd ${RUTE}
                cp -r .themes ${LOCALPATH}
                chmod +x ${LOCALPATH}/.themes/Default/bspwmrc           #8
                chmod +x ${LOCALPATH}/.themes/FBI/bspwmrc               #7
                chmod +x ${LOCALPATH}/.themes/DOD/bspwmrc               #6
                chmod +x ${LOCALPATH}/.themes/NSA/bspwmrc               #5
                chmod +x ${LOCALPATH}/.themes/CIA/bspwmrc               #4
                chmod +x ${LOCALPATH}/.themes/PF/bspwmrc                #3
                echo ""
                echo -e "${White} [${Blue}+${White}] Installing theme ${Red}Default"
                sleep 2
                chmod +x ${LOCALPATH}/.themes/Default/scripts/*.sh
                echo -e "${White} [${Blue}+${White}] Installing theme ${Cyan}FBI"
                sleep 2
                chmod +x ${LOCALPATH}/.themes/FBI/scripts/*.sh
                echo -e "${White} [${Blue}+${White}] Installing theme ${Black}DOD"
                sleep 2
                chmod +x ${LOCALPATH}/.themes/DOD/scripts/*sh
                echo -e "${White} [${Blue}+${White}] Installing theme ${Purple}NSA"
                sleep 2
                chmod +x ${LOCALPATH}/.themes/NSA/scripts/*.sh
                echo -e "${White} [${Blue}+${White}] Installing theme ${Green}CIA"
                sleep 2
                chmod +x ${LOCALPATH}/.themes/CIA/scripts/*.sh
                echo -e "${White} [${Blue}+${White}] Installing theme ${Blue}PF"
                sleep 2
                chmod +x ${LOCALPATH}/.themes/PF/scripts/*.sh
                echo ""
                echo -e "${White} [${Blue}i${White}] Step 11 installing bspwm scripts"
                sleep 2
                cd ${RUTE}
                cp -r scripts ${LOCALPATH}/.scripts
                chmod +x ${LOCALPATH}/.scripts/*.sh
                chmod +x ${LOCALPATH}/.scripts/wall-scripts/*.sh
                echo ""
                echo -e "${White} [${Blue}i${White}] Step 12 Installing the powerlevel10k, fzf, sudo-plugin, and others for the normal user"
                sleep 2
                echo ""
                cd ${RUTE}
                rm -rf ~/.zshrc; rm -rf ~/.p10k.zsh
                cp -r .zshrc .p10k.zsh ~/
                sudo rm -rf /usr/share/zsh-sudo/
                cd /usr/share ; sudo mkdir -p zsh-sudo
                cd zsh-sudo ; sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh 2>/dev/null
                rm -rf ~/.powerlevel10k
                cd ; git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k 2>/dev/null
                echo ""
                sudo rm -rf ${LOCALPATH}/.scripts/shell-color-scripts
                cd ${LOCALPATH}/.scripts ; git clone https://github.com/charitarthchugh/shell-color-scripts.git 2>/dev/null
                chmod +x ${LOCALPATH}/.scripts/shell-color-scripts/colorscripts/*
                sudo cp -r shell-color-scripts /opt/
                cd
                git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf 2>/dev/null
                ~/.fzf/install
                echo ""

                echo -e "${White} [${Blue}i${White}] Install pipes"
                sleep 2
                cd ${LOCALPATH}/.scripts ; rm -rf pipe*
                cd ${LOCALPATH}/.scripts ; git clone https://github.com/pipeseroni/pipes.sh.git 2>/dev/null
                echo ""
                echo "instalando sudo"
                sudo ./root.sh


fi
}

# CALLS THE SCRIPT
reset
setup
