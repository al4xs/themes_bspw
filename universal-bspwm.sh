#!/bin/bash

# UNIVERSAL BSPWM INSTALLATION SCRIPT
# Adaptado para funcionar em qualquer distribuição Linux
# Autor: Baseado no script original de Michael Alves (Al4xs)

# Cores para output do script
Black='\033[1;30m'
Red='\033[1;31m'
Green='\033[1;32m'
Yellow='\033[1;33m'
Blue='\033[1;34m'
Purple='\033[1;35m'
Cyan='\033[1;36m'
White='\033[1;37m'
NC='\033[0m'

# Variáveis globais
USERNAME=$(whoami)
LOCALPATH="/home/${USERNAME}"
KERNEL=$(uname -r)
HOST=$(uname -n)
BIT=$(uname -m)
RUTE=$(pwd)
FDIR="${LOCALPATH}/.local/share/fonts/"

# Detecta a distribuição Linux
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
    
    echo -e "${White}[${Blue}i${White}] Distribuição detectada: ${Green}${DISTRO}${White} ${VERSION}"
}

# Função para atualizar repositórios
update_repos() {
    echo -e "${White}[${Blue}i${White}] Atualizando repositórios..."
    case "$DISTRO" in
        ubuntu|debian|kali|linuxmint)
            sudo apt update -y
            ;;
        fedora)
            sudo dnf check-update
            ;;
        centos|rhel)
            sudo yum check-update
            ;;
        arch|manjaro)
            sudo pacman -Sy
            ;;
        opensuse*)
            sudo zypper refresh
            ;;
        *)
            echo -e "${Yellow}[${Red}!${Yellow}] Distribuição não suportada para atualização automática: $DISTRO"
            ;;
    esac
}

# Função para instalar pacotes baseado na distribuição
install_package() {
    local packages="$1"
    echo -e "${White}[${Blue}i${White}] Instalando: $packages"
    
    case "$DISTRO" in
        ubuntu|debian|kali|linuxmint)
            sudo apt install -y $packages
            ;;
        fedora)
            sudo dnf install -y $packages
            ;;
        centos|rhel)
            sudo yum install -y $packages
            ;;
        arch|manjaro)
            sudo pacman -S --noconfirm $packages
            ;;
        opensuse*)
            sudo zypper install -y $packages
            ;;
        *)
            echo -e "${Yellow}[${Red}!${Yellow}] Distribuição não suportada: $DISTRO"
            echo -e "${White}[${Blue}i${White}] Tente instalar manualmente: $packages"
            ;;
    esac
}

# Mapeamento de pacotes por distribuição
get_package_name() {
    local package_type="$1"
    
    case "$package_type" in
        "bspwm")
            case "$DISTRO" in
                ubuntu|debian|kali|linuxmint) echo "bspwm" ;;
                fedora|centos|rhel) echo "bspwm" ;;
                arch|manjaro) echo "bspwm" ;;
                opensuse*) echo "bspwm" ;;
                *) echo "bspwm" ;;
            esac
            ;;
        "sxhkd")
            case "$DISTRO" in
                ubuntu|debian|kali|linuxmint) echo "sxhkd" ;;
                fedora|centos|rhel) echo "sxhkd" ;;
                arch|manjaro) echo "sxhkd" ;;
                opensuse*) echo "sxhkd" ;;
                *) echo "sxhkd" ;;
            esac
            ;;
        "terminal")
            case "$DISTRO" in
                ubuntu|debian|kali|linuxmint) echo "kitty" ;;
                fedora|centos|rhel) echo "kitty" ;;
                arch|manjaro) echo "kitty" ;;
                opensuse*) echo "kitty" ;;
                *) echo "kitty" ;;
            esac
            ;;
        "compositor")
            case "$DISTRO" in
                ubuntu|debian|kali|linuxmint) echo "picom" ;;
                fedora|centos|rhel) echo "picom" ;;
                arch|manjaro) echo "picom" ;;
                opensuse*) echo "picom" ;;
                *) echo "picom" ;;
            esac
            ;;
        "bar")
            case "$DISTRO" in
                ubuntu|debian|kali|linuxmint) echo "polybar" ;;
                fedora|centos|rhel) echo "polybar" ;;
                arch|manjaro) echo "polybar" ;;
                opensuse*) echo "polybar" ;;
                *) echo "polybar" ;;
            esac
            ;;
        "fonts")
            case "$DISTRO" in
                ubuntu|debian|kali|linuxmint) echo "fonts-firacode fonts-cantarell" ;;
                fedora|centos|rhel) echo "fira-code-fonts cantarell-fonts" ;;
                arch|manjaro) echo "ttf-fira-code cantarell-fonts" ;;
                opensuse*) echo "fira-code-fonts cantarell-fonts" ;;
                *) echo "fonts-firacode fonts-cantarell" ;;
            esac
            ;;
        "utilities")
            case "$DISTRO" in
                ubuntu|debian|kali|linuxmint) echo "rofi lxappearance nitrogen git net-tools xclip xdotool neofetch ranger cmatrix" ;;
                fedora|centos|rhel) echo "rofi lxappearance nitrogen git net-tools xclip xdotool neofetch ranger cmatrix" ;;
                arch|manjaro) echo "rofi lxappearance nitrogen git net-tools xclip xdotool neofetch ranger cmatrix" ;;
                opensuse*) echo "rofi lxappearance nitrogen git net-tools xclip xdotool neofetch ranger cmatrix" ;;
                *) echo "rofi lxappearance nitrogen git net-tools xclip xdotool neofetch ranger" ;;
            esac
            ;;
    esac
}

# Banner do script
banner() {
    echo -e "${White} ╔───────────────────────────────────────────────╗"
    echo -e "${White} |${Cyan} UNIVERSAL BSPWM INSTALLATION SCRIPT          ${White} |"
    echo -e "${White} |${Cyan} Compatível com múltiplas distribuições       ${White} |"
    echo -e "${White} |${Cyan} Ubuntu • Mint • Debian • Fedora • Arch       ${White} |"
    echo -e "${White} ┖───────────────────────────────────────────────┙"
    echo ""
    echo -e "${White} [${Blue}i${White}] Script de instalação automática do BSPWM"
    echo -e "${White} [${Blue}i${White}] Adaptado por Replit Agent"
    echo ""
}

# Instalar BSPWM
install_bspwm() {
    echo -e "${White}[${Blue}i${White}] Verificando instalação do BSPWM..."
    
    if command -v bspwm >/dev/null 2>&1; then
        echo -e "${White}[${Green}+${White}] BSPWM já instalado, configurando..."
    else
        echo -e "${White}[${Yellow}-${White}] BSPWM não instalado, instalando..."
        local bspwm_package=$(get_package_name "bspwm")
        install_package "$bspwm_package"
    fi
    
    # Copiar configurações se existirem
    if [ -d "${RUTE}/.config/bspwm" ]; then
        echo -e "${White}[${Blue}i${White}] Copiando configurações do BSPWM..."
        sudo rm -rf "${LOCALPATH}/.config/bspwm"
        cp -r "${RUTE}/.config/bspwm" "${LOCALPATH}/.config/bspwm"
        chmod +x "${LOCALPATH}/.config/bspwm/bspwmrc"
    fi
}

# Instalar SXHKD
install_sxhkd() {
    echo -e "${White}[${Blue}i${White}] Verificando instalação do SXHKD..."
    
    if command -v sxhkd >/dev/null 2>&1; then
        echo -e "${White}[${Green}+${White}] SXHKD já instalado, configurando..."
    else
        echo -e "${White}[${Yellow}-${White}] SXHKD não instalado, instalando..."
        local sxhkd_package=$(get_package_name "sxhkd")
        install_package "$sxhkd_package"
    fi
    
    # Copiar configurações se existirem
    if [ -d "${RUTE}/.config/sxhkd" ]; then
        echo -e "${White}[${Blue}i${White}] Copiando configurações do SXHKD..."
        sudo rm -rf "${LOCALPATH}/.config/sxhkd"
        cp -r "${RUTE}/.config/sxhkd" "${LOCALPATH}/.config/sxhkd"
        chmod +x "${LOCALPATH}/.config/sxhkd/sxhkdrc"
    fi
}

# Instalar terminal Kitty
install_terminal() {
    echo -e "${White}[${Blue}i${White}] Verificando instalação do Terminal..."
    
    if command -v kitty >/dev/null 2>&1; then
        echo -e "${White}[${Green}+${White}] Kitty já instalado, configurando..."
    else
        echo -e "${White}[${Yellow}-${White}] Kitty não instalado, instalando..."
        local terminal_package=$(get_package_name "terminal")
        install_package "$terminal_package"
    fi
    
    # Copiar configurações se existirem
    if [ -d "${RUTE}/.config/kitty" ]; then
        echo -e "${White}[${Blue}i${White}] Copiando configurações do Kitty..."
        sudo rm -rf "${LOCALPATH}/.config/kitty"
        cp -r "${RUTE}/.config/kitty" "${LOCALPATH}/.config/kitty"
    fi
}

# Instalar compositor Picom
install_compositor() {
    echo -e "${White}[${Blue}i${White}] Verificando instalação do Compositor..."
    
    if command -v picom >/dev/null 2>&1; then
        echo -e "${White}[${Green}+${White}] Picom já instalado, configurando..."
    else
        echo -e "${White}[${Yellow}-${White}] Picom não instalado, instalando..."
        local compositor_package=$(get_package_name "compositor")
        install_package "$compositor_package"
    fi
    
    # Copiar configurações se existirem
    if [ -d "${RUTE}/.config/picom" ]; then
        echo -e "${White}[${Blue}i${White}] Copiando configurações do Picom..."
        sudo rm -rf "${LOCALPATH}/.config/picom"
        cp -r "${RUTE}/.config/picom" "${LOCALPATH}/.config/picom"
    fi
}

# Instalar Polybar
install_polybar() {
    echo -e "${White}[${Blue}i${White}] Verificando instalação do Polybar..."
    
    if command -v polybar >/dev/null 2>&1; then
        echo -e "${White}[${Green}+${White}] Polybar já instalado, configurando..."
    else
        echo -e "${White}[${Yellow}-${White}] Polybar não instalado, instalando..."
        local bar_package=$(get_package_name "bar")
        install_package "$bar_package"
    fi
    
    # Copiar configurações se existirem
    if [ -d "${RUTE}/.config/polybar" ]; then
        echo -e "${White}[${Blue}i${White}] Copiando configurações do Polybar..."
        sudo rm -rf "${LOCALPATH}/.config/polybar"
        cp -r "${RUTE}/.config/polybar" "${LOCALPATH}/.config/polybar"
        chmod +x "${LOCALPATH}/.config/polybar/launch.sh" 2>/dev/null
        chmod +x "${LOCALPATH}/.config/polybar/cuts/launch.sh" 2>/dev/null
        chmod +x "${LOCALPATH}/.config/polybar/cuts/scripts/"*.sh 2>/dev/null
    fi
}

# Instalar fontes
install_fonts() {
    echo -e "${White}[${Blue}i${White}] Instalando fontes..."
    
    # Criar diretório de fontes se não existir
    mkdir -p "$FDIR"
    
    # Instalar fontes do sistema
    local fonts_package=$(get_package_name "fonts")
    install_package "$fonts_package"
    
    # Copiar fontes personalizadas se existirem
    if [ -d "${RUTE}/home/fonts" ]; then
        echo -e "${White}[${Blue}i${White}] Copiando fontes personalizadas..."
        cp -r "${RUTE}/home/fonts/"* "$FDIR" 2>/dev/null
        sudo cp -r "${RUTE}/home/fonts/"* /usr/share/fonts/ 2>/dev/null
        fc-cache -fv
    fi
}

# Instalar utilitários
install_utilities() {
    echo -e "${White}[${Blue}i${White}] Instalando utilitários..."
    
    local utilities_package=$(get_package_name "utilities")
    install_package "$utilities_package"
}

# Copiar arquivos de configuração
copy_configs() {
    echo -e "${White}[${Blue}i${White}] Copiando configurações adicionais..."
    
    # Copiar configurações do neofetch
    if [ -d "${RUTE}/.config/neofetch" ]; then
        sudo rm -rf "${LOCALPATH}/.config/neofetch"
        cp -r "${RUTE}/.config/neofetch" "${LOCALPATH}/.config/neofetch"
    fi
    
    # Copiar configurações do ranger
    if [ -d "${RUTE}/.config/ranger" ]; then
        sudo rm -rf "${LOCALPATH}/.config/ranger"
        cp -r "${RUTE}/.config/ranger" "${LOCALPATH}/.config/ranger"
    fi
    
    # Copiar configurações do cava se existir
    if [ -d "${RUTE}/.config/cava" ]; then
        sudo rm -rf "${LOCALPATH}/.config/cava"
        cp -r "${RUTE}/.config/cava" "${LOCALPATH}/.config/cava"
    fi
    
    # Copiar wallpapers se existirem
    if [ -d "${RUTE}/home/Wallpapers" ]; then
        echo -e "${White}[${Blue}i${White}] Copiando wallpapers..."
        cp -r "${RUTE}/home/Wallpapers" "${LOCALPATH}/"
    fi
    
    # Copiar hacktools se existirem
    if [ -d "${RUTE}/home/hacktools" ]; then
        echo -e "${White}[${Blue}i${White}] Copiando ferramentas..."
        cp -r "${RUTE}/home/hacktools" "${LOCALPATH}/"
    fi
    
    # Copiar scripts se existirem
    if [ -d "${RUTE}/scripts" ]; then
        echo -e "${White}[${Blue}i${White}] Copiando scripts..."
        cp -r "${RUTE}/scripts" "${LOCALPATH}/.scripts"
        chmod +x "${LOCALPATH}/.scripts/"*.sh 2>/dev/null
    fi
}

# Função principal de setup
setup() {
    clear
    banner
    sleep 2
    
    echo -ne "${White}[${Blue}!${White}] Deseja continuar com a instalação? [Y/n] ▶ ${Red}"
    read -r quest
    
    if [[ $quest == "n" || $quest == "N" || $quest == "no" ]]; then
        echo -e "${White}[${Red}!${White}] Instalação cancelada."
        exit 1
    fi
    
    echo -e "${White}[${Blue}i${White}] Iniciando instalação universal do BSPWM..."
    sleep 2
    
    # Detectar distribuição
    detect_distro
    sleep 1
    
    # Atualizar repositórios
    update_repos
    sleep 1
    
    # Instalar componentes principais
    install_bspwm
    sleep 1
    
    install_sxhkd
    sleep 1
    
    install_terminal
    sleep 1
    
    install_compositor
    sleep 1
    
    install_polybar
    sleep 1
    
    install_fonts
    sleep 1
    
    install_utilities
    sleep 1
    
    copy_configs
    sleep 1
    
    echo ""
    echo -e "${White}[${Green}✓${White}] Instalação concluída!"
    echo -e "${White}[${Blue}i${White}] Para usar o BSPWM:"
    echo -e "${White}[${Blue}i${White}] 1. Faça logout"
    echo -e "${White}[${Blue}i${White}] 2. Selecione BSPWM na tela de login"
    echo -e "${White}[${Blue}i${White}] 3. Faça login novamente"
    echo ""
    echo -e "${White}[${Blue}i${White}] Atalhos principais:"
    echo -e "${White}[${Blue}i${White}] Windows + Enter = Terminal"
    echo -e "${White}[${Blue}i${White}] Windows + d = Menu"
    echo -e "${White}[${Blue}i${White}] Windows + w = Fechar janela"
    echo ""
}

# Função para modo de teste
test_mode() {
    echo -e "${White}[${Blue}i${White}] Modo de teste ativo - Verificando dependências..."
    detect_distro
    
    echo -e "${White}[${Blue}i${White}] Verificando disponibilidade dos pacotes..."
    
    # Testar se os comandos de pacote estão disponíveis
    case "$DISTRO" in
        ubuntu|debian|kali|linuxmint)
            if command -v apt >/dev/null 2>&1; then
                echo -e "${White}[${Green}✓${White}] APT disponível"
            else
                echo -e "${White}[${Red}✗${White}] APT não encontrado"
            fi
            ;;
        fedora)
            if command -v dnf >/dev/null 2>&1; then
                echo -e "${White}[${Green}✓${White}] DNF disponível"
            else
                echo -e "${White}[${Red}✗${White}] DNF não encontrado"
            fi
            ;;
        arch|manjaro)
            if command -v pacman >/dev/null 2>&1; then
                echo -e "${White}[${Green}✓${White}] Pacman disponível"
            else
                echo -e "${White}[${Red}✗${White}] Pacman não encontrado"
            fi
            ;;
    esac
    
    echo -e "${White}[${Blue}i${White}] Teste concluído!"
}

# Verificar argumentos da linha de comando
if [ "$1" == "--test" ]; then
    test_mode
elif [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo "Uso: $0 [opções]"
    echo "Opções:"
    echo "  --test    Executar em modo de teste"
    echo "  --help    Mostrar esta mensagem"
    echo ""
    echo "Sem argumentos: Executar instalação completa"
else
    setup
fi