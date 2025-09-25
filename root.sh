#!/bin/bash

# UNIVERSAL ROOT CONFIGURATION SCRIPT - KALI SUNG ADAPTED
# Compatível com Ubuntu, Linux Mint, Debian, Fedora, Arch, openSUSE e outras distribuições
# Author: Based on original by Michael Alves https://github.com/al4xs

# VARIABLE DATABASE AND OTHER THINGS
RUTE=$(pwd)

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

# CHECK ROOT USER
if [ $(id -u) -ne 0 ]; then
        echo ""
        echo -e "${White} [${Blue}i${White}] You must be root user to run the script"
        echo -e "${White} [${Blue}i${White}] Try: sudo ./root.sh"
exit
fi

# DETECTAR DISTRIBUIÇÃO LINUX
detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$ID
        VERSION=$VERSION_ID
    elif type lsb_release >/dev/null 2>&1; then
        DISTRO=$(lsb_release -si | tr '[:upper:]' '[:lower:]')
        VERSION=$(lsb_release -sr)
    elif [ -f /etc/lsb-release ]; then
        . /etc/lsb-release
        DISTRO=$(echo $DISTRIB_ID | tr '[:upper:]' '[:lower:]')
        VERSION=$DISTRIB_RELEASE
    elif [ -f /etc/debian_version ]; then
        DISTRO=debian
        VERSION=$(cat /etc/debian_version)
    elif [ -f /etc/redhat-release ]; then
        DISTRO=rhel
        VERSION=$(cat /etc/redhat-release | sed s/.*release\ // | sed s/\ .*//)
    else
        DISTRO=$(uname -s | tr '[:upper:]' '[:lower:]')
        VERSION=$(uname -r)
    fi
    
    echo -e "${White}[${Blue}i${White}] Configuração root para: ${Green}${DISTRO}${White} ${VERSION}"
}

install_addons() {
    echo ""
    echo -e "${White} [${Blue}i${White}] Last step installing the powerlevel10k, fzf, sudo-plugin, and others for the root user"
    sleep 3
    
    # Detectar distribuição
    detect_distro
    
    echo ""
    echo -e "${White} [${Blue}i${White}] Copying scripts and configurations to root..."
    
    # Copiar scripts se existirem
    if [ -d "${RUTE}/scripts" ]; then
        cp -r scripts /root/.scripts
        chmod +x /root/.scripts/*.sh 2>/dev/null
        chmod +x /root/.scripts/wall-scripts/*.sh 2>/dev/null
        echo -e "${White} [${Green}+${White}] Scripts copied successfully"
    else
        echo -e "${White} [${Yellow}!${White}] Scripts directory not found, skipping..."
    fi
    
    # Copiar configurações do usuário root se existirem
    if [ -d "${RUTE}/root" ]; then
        cd ${RUTE}/root
        cp -r .zshrc .p10k.zsh /root 2>/dev/null
        echo -e "${White} [${Green}+${White}] Root configurations copied"
    else
        echo -e "${White} [${Yellow}!${White}] Root configuration directory not found"
    fi
    
    echo ""
    echo -e "${White} [${Blue}i${White}] Installing powerlevel10k for root..."
    
    # Verificar se zsh está instalado
    if ! command -v zsh >/dev/null 2>&1; then
        echo -e "${White} [${Yellow}!${White}] Zsh not found, installing..."
        case "$DISTRO" in
            ubuntu|debian|kali|linuxmint)
                apt install -y zsh
                ;;
            fedora)
                dnf install -y zsh
                ;;
            centos|rhel)
                yum install -y zsh
                ;;
            arch|manjaro)
                pacman -S --noconfirm zsh
                ;;
            opensuse*)
                zypper install -y zsh
                ;;
        esac
    fi
    
    # Instalar powerlevel10k
    rm -rf /root/.powerlevel10k
    cd /root
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k 2>/dev/null
    if [ $? -eq 0 ]; then
        echo -e "${White} [${Green}+${White}] Powerlevel10k installed successfully"
    else
        echo -e "${White} [${Red}!${White}] Failed to install powerlevel10k"
    fi
    
    echo ""
    echo -e "${White} [${Blue}i${White}] Installing shell-color-scripts for root..."
    
    # Criar diretório de scripts se não existir
    mkdir -p /root/.scripts
    
    # Instalar shell-color-scripts
    cd /root/.scripts/
    rm -rf shell-color-scripts
    git clone https://github.com/charitarthchugh/shell-color-scripts.git 2>/dev/null
    
    if [ -d "shell-color-scripts" ]; then
        # Copiar colorscripts se existir no repositório original
        if [ -d "${RUTE}/scripts/colorscripts" ]; then
            rm -rf shell-color-scripts/colorscripts
            rm -rf shell-color-scripts/colorscript.sh
            cp -r ${RUTE}/scripts/colorscripts shell-color-scripts/
            cp ${RUTE}/scripts/colorscript.sh shell-color-scripts/
        fi
        
        chmod +x shell-color-scripts/colorscript.sh 2>/dev/null
        cd shell-color-scripts/colorscripts
        chmod +x * 2>/dev/null
        echo -e "${White} [${Green}+${White}] Shell-color-scripts installed"
    else
        echo -e "${White} [${Red}!${White}] Failed to install shell-color-scripts"
    fi
    
    echo ""
    echo -e "${White} [${Blue}i${White}] Installing fzf for root..."
    
    # Instalar fzf
    cd /root
    rm -rf ~/.fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf 2>/dev/null
    if [ -d ~/.fzf ]; then
        ~/.fzf/install --all --no-update-rc --key-bindings --completion 2>/dev/null
        echo -e "${White} [${Green}+${White}] Fzf installed successfully"
    else
        echo -e "${White} [${Red}!${White}] Failed to install fzf"
    fi
    
    echo ""
    echo -e "${White} [${Blue}i${White}] Installing pipes.sh for root..."
    
    # Instalar pipes
    rm -rf /root/.scripts/pipe*
    cd /root/.scripts
    git clone https://github.com/pipeseroni/pipes.sh.git 2>/dev/null
    if [ -d "pipes.sh" ]; then
        chmod +x pipes.sh/pipes.sh 2>/dev/null
        echo -e "${White} [${Green}+${White}] Pipes.sh installed successfully"
    else
        echo -e "${White} [${Red}!${White}] Failed to install pipes.sh"
    fi
    
    echo ""
    echo -e "${White} [${Blue}i${White}] Installing additional utilities..."
    
    # Verificar e instalar git se não existir
    if ! command -v git >/dev/null 2>&1; then
        echo -e "${White} [${Yellow}!${White}] Git not found, installing..."
        case "$DISTRO" in
            ubuntu|debian|kali|linuxmint)
                apt install -y git
                ;;
            fedora)
                dnf install -y git
                ;;
            centos|rhel)
                yum install -y git
                ;;
            arch|manjaro)
                pacman -S --noconfirm git
                ;;
            opensuse*)
                zypper install -y git
                ;;
        esac
    fi
    
    echo ""
    echo -e "${White} [${Green}✓${White}] Root configuration completed successfully!"
    echo -e "${White} [${Blue}i${White}] Distribution: ${Green}${DISTRO}${White}"
    echo -e "${White} [${Blue}i${White}] All components installed for root user"
    echo ""
}

# CALLS
reset
install_addons
