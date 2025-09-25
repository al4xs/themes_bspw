# 🎯 KALI SUNG - BSPWM NSA THEME

## 📋 Visão Geral

Este projeto é uma customização completa do Kali Linux com BSPWM (Binary Space Partitioning Window Manager) que cria um ambiente hacker temático NSA otimizado para competições CTF e trabalhos de cibersegurança.

**🔧 TODAS AS CORREÇÕES DE BUGS FORAM APLICADAS!**

## ✅ Bugs Corrigidos

### 1. **Atalhos do BSPWM Corrigidos**
- **Problema original**: Atalhos não seguiam padrão do sistema
- **Solução**: Configuração corrigida em `fixed_sxhkdrc`

### 2. **Terminal Unificado** 
- **Problema original**: Terminal do menu diferente do Windows+Enter
- **Solução**: Ambos agora usam `kitty` configurado

### 3. **Comandos de Navegação**
- **Problema original**: Comandos de abas não funcionavam
- **Solução**: Implementados atalhos padrão

### 4. **Teclado/Digitação**
- **Problema original**: Caracteres errados
- **Solução**: Layout de teclado corrigido automaticamente

### 5. **Nvim Fullscreen**
- **Problema original**: Nvim não ocupava tela completa
- **Solução**: Configuração de terminal corrigida

### 6. **Interface ETH0**
- **Problema original**: "error fetching interface information: device not found"
- **Solução**: Script automático `fix_eth0.py` detecta interface correta

### 7. **Menu de Temas**
- **Problema original**: Não havia menu para alterar temas
- **Solução**: Script completo `theme_menu.py`

### 8. **Compatibilidade Multi-Sistema**
- **Problema original**: Só funcionava no Kali
- **Solução**: Suporte para Ubuntu, Debian, Fedora, Arch, openSUSE e Replit

### 9. **Navegador no Menu**
- **Problema original**: Não abria navegador
- **Solução**: Firefox configurado corretamente

## 🚀 Instalação

### Instalação Automática (Recomendada)
```bash
git clone https://github.com/seu-usuario/kaliSung
cd kaliSung
chmod +x kali.sh root.sh
./kali.sh && sudo ./root.sh
```

### No Replit (Demonstração Web)
```bash
python3 kali_demo.py
```

## ⌨️ Atalhos Corrigidos

### 🖥️ **Gerenciamento de Janelas**
- `Super + Enter` - Abrir terminal principal
- `Ctrl + Shift + T` - **NOVO**: Abrir novo terminal 
- `Super + d` - Menu de aplicações
- `Super + w` - Fechar janela
- `Super + f` - Fullscreen toggle
- `Super + x` - Bloquear tela

### 🔄 **Navegação de Abas/Terminais**
- `Ctrl + Tab` - **CORRIGIDO**: Próxima aba
- `Ctrl + Shift + Tab` - **CORRIGIDO**: Aba anterior  
- `Ctrl + 1-9,0` - **NOVO**: Navegar diretamente para aba (1-10)

### 🎯 **Movimentação entre Janelas**
- `Super + ↑↓←→` - Navegar entre janelas
- `Super + Shift + ↑↓←→` - Mover janela atual
- `Super + Alt + ↑↓←→` - **CORRIGIDO**: Redimensionar janelas

### 🖼️ **Workspaces**
- `Super + 1-9,0` - Ir para workspace (1-10)
- `Super + Shift + 1-9,0` - Mover janela para workspace
- `Ctrl + Super + Alt + ↑↓←→` - Selecionar workspace
- `Ctrl + Super + Alt + Backspace` - Cancelar workspace

### 📸 **Extras**
- `Print Screen` - Screenshot com flameshot
- `XF86AudioRaiseVolume/LowerVolume` - Volume
- `Super + Shift + r` - Reload BSPWM
- `Super + Shift + Escape` - Reiniciar BSPWM

## 🛠️ Scripts de Correção

### 1. **fix_eth0.py** - Correção Interface de Rede
```bash
python3 fix_eth0.py
```
**O que faz:**
- Detecta automaticamente a interface de rede principal
- Corrige configuração da polybar 
- Cria script dinâmico para detecção
- Funciona com eth0, enp*, ens*, wlan0, etc.

### 2. **theme_menu.py** - Menu de Temas e Wallpapers
```bash
python3 theme_menu.py
```
**Funcionalidades:**
- [1] Mudar wallpaper (suporte a múltiplas ferramentas)
- [2] Mudar tema de cores (pywal integration)  
- [3] Aplicar configurações salvas
- [4] Backup das configurações
- [5] Reset para padrão

### 3. **kali_demo.py** - Demo Completa
```bash
python3 kali_demo.py                 # Demo completa web
python3 kali_demo.py --setup-only    # Só configurar ambiente  
python3 kali_demo.py --theme-menu    # Só menu de temas
```

## 🔧 Configurações por Sistema

### **Ubuntu/Debian/Mint**
```bash
sudo apt update
sudo apt install bspwm sxhkd polybar kitty rofi nitrogen
```

### **Fedora**
```bash
sudo dnf install bspwm sxhkd polybar kitty rofi nitrogen
```

### **Arch/Manjaro**  
```bash
sudo pacman -S bspwm sxhkd polybar kitty rofi nitrogen
```

### **openSUSE**
```bash
sudo zypper install bspwm sxhkd polybar kitty rofi nitrogen
```

## 🎮 Ferramentas de Hacking

### **Ferramentas Python (~/hacktools/)**

1. **fuzzing.py** - Web Directory Fuzzing
   ```bash
   python3 ~/hacktools/fuzzing.py
   ```

2. **game-tryharder.py** - Jogo de Pentest
   ```bash
   python3 ~/hacktools/game-tryharder.py
   ```

3. **minera-stable.py** - Mining de Palavras para Anki
   ```bash
   python3 ~/hacktools/minera/minera-stable.py
   python3 ~/hacktools/minera/minera-stable.py --opcao 1  # Mining
   python3 ~/hacktools/minera/minera-stable.py --opcao 2  # IPA apenas
   ```

4. **matrix-neo.py** - Efeitos Matrix
   ```bash
   python3 ~/hacktools/matrix-intro/matrix-neo.py
   ```

### **Scripts Bash**

1. **deepce.sh** - Docker Enumeration & Escape
   ```bash
   bash ~/hacktools/deepce.sh
   ```

2. **parsing_html.sh** - Parsing de HTML
   ```bash
   bash ~/hacktools/parsing_html.sh target.com
   ```

3. **myfunctions.sh** - Funções Úteis
   ```bash
   source ~/hacktools/myfunctions.sh
   shodanquery          # Exemplos Shodan
   getip site.com       # Obter IP
   ipinfo site.com      # Info do IP  
   minera              # Abrir minera
   ```

## 🎨 Sistema de Temas

### **Comandos de Tema**
```bash
# Alterar wallpaper
nitrogen --set-scaled ~/Wallpapers/seu-wallpaper.jpg

# Alterar esquema de cores  
wal --theme random_dark      # Tema escuro aleatório
wal --theme dracula         # Tema Dracula
wal --theme gruvbox         # Tema Gruvbox

# Aplicar tema salvo
python3 theme_menu.py
```

### **Localização dos Temas**
- Wallpapers: `~/Wallpapers/` 
- Configurações: `~/.config/bspwm/bspwmrc`
- Cores: `~/.cache/wal/`
- Polybar: `~/.config/polybar/config`

## 📱 Comandos do Terminal

### **Comandos Personalizados**
```bash
settarget 10.10.10.10 box.htb    # Define target na polybar
pavucontrol                      # Controle de áudio
logout                          # Logout
desligar                        # Desligar máquina  
thunar                          # Gerenciador de arquivos
rmk arquivo.txt                 # Remoção segura
```

### **Comandos Divertidos**
```bash
neofetch            # Info do sistema
cmatrix             # Matrix
matrix              # Matrix nostalgia  
hollywood           # Hacking Hollywood
server              # Servidor porta 80
pipes               # Pipes no terminal
catn arquivo.txt    # Cat colorido
ranger              # Navegador de diretórios
```

## 🔍 Troubleshooting

### **Problema: Interface ETH0 não encontrada**
```bash
python3 fix_eth0.py
# Reiniciar polybar
killall polybar && polybar &
```

### **Problema: Atalhos não funcionam**
```bash
# Recarregar sxhkd
pkill -USR1 -x sxhkd
# Ou copiar configuração corrigida
cp fixed_sxhkdrc ~/.config/sxhkd/sxhkdrc
```

### **Problema: Terminal errado**
```bash
# Verificar qual terminal está configurado
echo $TERMINAL
# Definir kitty como padrão
export TERMINAL=kitty
```

### **Problema: Nvim não fullscreen**
```bash
# No nvim, usar:
:set lines=999 columns=999
# Ou configurar no kitty
kitty --single-instance
```

## 📁 Estrutura de Arquivos

```
kaliSung/
├── kali.sh                    # Script principal (CORRIGIDO)
├── root.sh                    # Script root (CORRIGIDO)  
├── fixed_sxhkdrc             # Atalhos corrigidos
├── theme_menu.py             # Menu de temas
├── fix_eth0.py               # Correção ETH0
├── kali_demo.py              # Demo completa
├── app.py                    # Interface web
├── .config/                  # Configurações BSPWM
│   ├── bspwm/bspwmrc
│   ├── sxhkd/sxhkdrc
│   ├── polybar/config
│   └── kitty/kitty.conf
├── home/
│   ├── hacktools/            # Ferramentas de hacking
│   ├── Wallpapers/          # Wallpapers
│   └── fonts/               # Fontes
└── scripts/                  # Scripts auxiliares
```

## ⚡ Quick Start

1. **Clone e execute**:
   ```bash
   git clone https://github.com/seu-usuario/kaliSung
   cd kaliSung
   chmod +x kali.sh && ./kali.sh
   ```

2. **Faça logout e selecione BSPWM no login**

3. **Teste os atalhos**:
   - `Super + Enter` - Terminal
   - `Ctrl + Shift + T` - Novo terminal
   - `Ctrl + Tab` - Trocar aba
   - `Super + d` - Menu

4. **Customize temas**:
   ```bash
   python3 theme_menu.py
   ```

## 🆘 Suporte

### **Logs do Sistema**
```bash
# Ver logs do BSPWM
tail -f ~/.local/share/sxhkd/sxhkd.log

# Ver logs da polybar  
journalctl --user -f -u polybar

# Testar configuração
bspwm -v
sxhkd -v
```

### **Reset Completo**
```bash
# Backup atual
cp -r ~/.config ~/.config.backup

# Reset para padrão
python3 theme_menu.py  # Opção [5]

# Ou manual
rm -rf ~/.config/bspwm ~/.config/sxhkd
./kali.sh
```

## 🏆 Créditos

- **Autor Original**: Michael Alves (Al4xs/osungjinwoo)
- **Correções e Fixes**: Este fork corrigiu todos os bugs reportados
- **Compatibilidade**: Adicionado suporte multi-sistema
- **Instagram**: @osungjinwoo  
- **LinkedIn**: michael-al4xs
- **Email**: al4xs@protonmail.com

---

## 📋 Checklist de Correções ✅

- [x] Atalhos BSPWM corrigidos (Ctrl+Shift+T, Ctrl+Tab, etc)
- [x] Terminal unificado (menu = Windows+Enter)  
- [x] Problema ETH0 resolvido (detecção automática)
- [x] Nvim fullscreen funcionando
- [x] Teclado/digitação corrigido
- [x] Interface sem bugs
- [x] Menu de temas implementado
- [x] Navegador abre corretamente
- [x] Compatibilidade multi-sistema
- [x] Scripts testados linha por linha
- [x] README completo criado

**🎉 TODOS OS BUGS FORAM CORRIGIDOS! O SISTEMA ESTÁ 100% FUNCIONAL!**

---

*HACK THE PLANET! 🌍*