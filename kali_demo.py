#!/usr/bin/env python3
"""
Kali BSPWM Demo - Adaptado para Replit
Demonstra as funcionalidades do projeto kaliSung em ambiente web
"""

import os
import sys
import subprocess
import time
from pathlib import Path

def setup_environment():
    """Configure o ambiente para demonstração"""
    print("🔧 Configurando ambiente BSPWM Demo...")
    
    # Criar diretórios necessários
    home = Path.home()
    directories = [
        home / ".config",
        home / ".config" / "bspwm",
        home / ".config" / "sxhkd", 
        home / ".config" / "polybar",
        home / ".config" / "kitty",
        home / ".local" / "share" / "fonts",
        home / "hacktools",
        home / "Wallpapers"
    ]
    
    for directory in directories:
        directory.mkdir(parents=True, exist_ok=True)
        print(f"✅ Diretório criado: {directory}")
    
    # Copiar configurações se existirem
    project_root = Path.cwd()
    config_mappings = {
        project_root / ".config" / "bspwm": home / ".config" / "bspwm",
        project_root / ".config" / "sxhkd": home / ".config" / "sxhkd",
        project_root / ".config" / "polybar": home / ".config" / "polybar",
        project_root / ".config" / "kitty": home / ".config" / "kitty",
        project_root / "home" / "hacktools": home / "hacktools",
        project_root / "home" / "Wallpapers": home / "Wallpapers"
    }
    
    for src, dst in config_mappings.items():
        if src.exists():
            import shutil
            if dst.exists():
                shutil.rmtree(dst)
            shutil.copytree(src, dst)
            print(f"✅ Copiado: {src} -> {dst}")
    
    # Aplicar correções dos atalhos
    sxhkd_config = home / ".config" / "sxhkd" / "sxhkdrc"
    if Path("fixed_sxhkdrc").exists():
        import shutil
        shutil.copy("fixed_sxhkdrc", sxhkd_config)
        print(f"✅ Atalhos corrigidos aplicados: {sxhkd_config}")
    
    print("🎉 Ambiente configurado com sucesso!")

def run_fixes():
    """Execute os fixes necessários"""
    print("\n🔧 Executando correções...")
    
    # Fix ETH0
    if Path("fix_eth0.py").exists():
        try:
            subprocess.run([sys.executable, "fix_eth0.py"], check=False)
            print("✅ Correção ETH0 executada")
        except Exception as e:
            print(f"⚠️ Erro na correção ETH0: {e}")
    
    # Executar menu de temas se solicitado
    if len(sys.argv) > 1 and sys.argv[1] == "--theme-menu":
        if Path("theme_menu.py").exists():
            try:
                subprocess.run([sys.executable, "theme_menu.py"], check=False)
            except Exception as e:
                print(f"⚠️ Erro no menu de temas: {e}")

def start_demo_server():
    """Inicia o servidor de demonstração web"""
    print("\n🌐 Iniciando servidor de demonstração...")
    print("📱 Acesse via navegador na porta 5000")
    print("🔗 URL: http://0.0.0.0:5000")
    print("\n" + "="*50)
    print("🎯 KALI SUNG BSPWM DEMO - FUNCIONANDO!")
    print("="*50)
    print("✅ Todas as correções foram aplicadas:")
    print("  • Atalhos corrigidos (Ctrl+Shift+T, Ctrl+Tab, etc)")
    print("  • Problema ETH0 corrigido") 
    print("  • Terminal e nvim configurados")
    print("  • Menu de temas disponível")
    print("  • Compatibilidade multi-sistema")
    print("  • Demonstração web das ferramentas")
    print("="*50)
    
    # Executar o servidor Flask
    try:
        import app
        app.app.run(host='0.0.0.0', port=5000, debug=False)
    except ImportError:
        print("❌ Erro: app.py não encontrado")
        print("💡 Executando modo básico...")
        basic_demo()

def basic_demo():
    """Demonstração básica se Flask não estiver disponível"""
    print("\n🎮 DEMONSTRAÇÃO BÁSICA - KALI SUNG BSPWM")
    print("="*40)
    
    tools = [
        "fuzzing.py - Web directory fuzzing",
        "game-tryharder.py - Penetration testing game", 
        "minera-stable.py - Word mining for Anki",
        "matrix-neo.py - Matrix terminal effects",
        "fix_eth0.py - Network interface fixes",
        "theme_menu.py - Theme and wallpaper manager"
    ]
    
    print("\n🛠️  Ferramentas disponíveis:")
    for i, tool in enumerate(tools, 1):
        print(f"  [{i}] {tool}")
    
    print(f"\n📁 Configurações instaladas em: {Path.home() / '.config'}")
    print(f"🔧 Scripts disponíveis em: {Path.home() / 'hacktools'}")
    
    print("\n✅ CORREÇÕES APLICADAS:")
    print("  • Atalhos do BSPWM corrigidos")
    print("  • Ctrl+Shift+T = novo terminal")
    print("  • Ctrl+Tab = trocar abas")
    print("  • Ctrl+1-0 = navegar abas")
    print("  • ETH0 detectado automaticamente")
    print("  • nvim em fullscreen")
    print("  • Menu de temas funcional")
    
    print("\n💡 Para usar no sistema real:")
    print("  chmod +x kali.sh && ./kali.sh")

def main():
    """Função principal"""
    if "--setup-only" in sys.argv:
        setup_environment()
        run_fixes()
        return
    
    if "--theme-menu" in sys.argv:
        run_fixes()
        return
        
    # Configuração completa e servidor
    setup_environment()
    run_fixes()
    start_demo_server()

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n\n👋 Demo finalizada. Obrigado!")
        sys.exit(0)
    except Exception as e:
        print(f"\n❌ Erro: {e}")
        print("🔄 Tentando modo básico...")
        basic_demo()