#!/usr/bin/env python3
"""
Theme and Wallpaper Selection Menu
Part of the kaliSung BSPWM project
"""

import os
import subprocess
import sys
from pathlib import Path
import shutil

def get_wallpapers():
    """Get available wallpapers"""
    wallpaper_paths = [
        str(Path.home() / "Wallpapers"),
        "/usr/share/backgrounds/kali",
        "/usr/share/pixmaps"
    ]
    
    wallpapers = []
    extensions = ['.jpg', '.jpeg', '.png', '.bmp', '.gif']
    
    for path in wallpaper_paths:
        if os.path.exists(path):
            for file in Path(path).rglob('*'):
                if file.suffix.lower() in extensions:
                    wallpapers.append(str(file))
    
    return sorted(wallpapers)

def set_wallpaper(wallpaper_path):
    """Set wallpaper using available tools"""
    tools = ['nitrogen', 'feh', 'xwallpaper']
    
    for tool in tools:
        if shutil.which(tool):
            if tool == 'nitrogen':
                subprocess.run(['nitrogen', '--set-scaled', wallpaper_path], 
                             capture_output=True)
            elif tool == 'feh':
                subprocess.run(['feh', '--bg-scale', wallpaper_path], 
                             capture_output=True)
            elif tool == 'xwallpaper':
                subprocess.run(['xwallpaper', '--stretch', wallpaper_path], 
                             capture_output=True)
            return True
    return False

def get_themes():
    """Get available color themes"""
    themes = [
        'random_dark',
        'random_light', 
        'sexy',
        'base16',
        'dracula',
        'gruvbox',
        'monokai',
        'solarized'
    ]
    return themes

def set_theme(theme_name):
    """Apply color theme using pywal if available"""
    if shutil.which('wal'):
        subprocess.run(['wal', '--theme', theme_name], capture_output=True)
        return True
    return False

def show_menu():
    """Display interactive menu"""
    print("\n" + "="*50)
    print("🎨 KALI SUNG - THEME & WALLPAPER MANAGER 🎨")
    print("="*50)
    
    while True:
        print("\n[1] 🖼️  Change Wallpaper")
        print("[2] 🎨 Change Color Theme") 
        print("[3] ⚙️  Apply Saved Settings")
        print("[4] 💾 Backup Current Settings")
        print("[5] 🔄 Reset to Default")
        print("[0] ❌ Exit")
        
        choice = input("\n👉 Select option: ").strip()
        
        if choice == '1':
            change_wallpaper()
        elif choice == '2':
            change_theme()
        elif choice == '3':
            apply_settings()
        elif choice == '4':
            backup_settings()
        elif choice == '5':
            reset_settings()
        elif choice == '0':
            print("\n✅ Goodbye!")
            break
        else:
            print("\n❌ Invalid option!")

def change_wallpaper():
    """Change wallpaper menu"""
    wallpapers = get_wallpapers()
    
    if not wallpapers:
        print("\n❌ No wallpapers found!")
        return
    
    print("\n📁 Available Wallpapers:")
    for i, wp in enumerate(wallpapers[:10], 1):  # Show first 10
        filename = os.path.basename(wp)
        print(f"[{i}] {filename}")
    
    if len(wallpapers) > 10:
        print(f"... and {len(wallpapers) - 10} more")
    
    try:
        choice = int(input("\n👉 Select wallpaper number: ")) - 1
        if 0 <= choice < len(wallpapers):
            if set_wallpaper(wallpapers[choice]):
                print(f"✅ Wallpaper changed to: {os.path.basename(wallpapers[choice])}")
            else:
                print("❌ Failed to set wallpaper (no wallpaper tool found)")
        else:
            print("❌ Invalid number!")
    except ValueError:
        print("❌ Invalid input!")

def change_theme():
    """Change color theme menu"""
    themes = get_themes()
    
    print("\n🎨 Available Themes:")
    for i, theme in enumerate(themes, 1):
        print(f"[{i}] {theme}")
    
    try:
        choice = int(input("\n👉 Select theme number: ")) - 1
        if 0 <= choice < len(themes):
            if set_theme(themes[choice]):
                print(f"✅ Theme changed to: {themes[choice]}")
                print("🔄 Restart applications to see full effect")
            else:
                print("❌ Failed to set theme (pywal not found)")
        else:
            print("❌ Invalid number!")
    except ValueError:
        print("❌ Invalid input!")

def apply_settings():
    """Apply saved settings"""
    config_dir = Path.home() / '.config' / 'bspwm'
    if config_dir.exists():
        subprocess.run(['bspc', 'wm', '-r'], capture_output=True)
        print("✅ BSPWM restarted with current settings")
    else:
        print("❌ No BSPWM config found")

def backup_settings():
    """Backup current settings"""
    backup_dir = Path.home() / '.config_backup'
    config_dir = Path.home() / '.config'
    
    if config_dir.exists():
        if backup_dir.exists():
            shutil.rmtree(backup_dir)
        shutil.copytree(config_dir, backup_dir)
        print(f"✅ Settings backed up to: {backup_dir}")
    else:
        print("❌ No config directory found")

def reset_settings():
    """Reset to default settings"""
    confirm = input("\n⚠️  Reset all settings to default? (y/N): ").lower()
    if confirm == 'y':
        # Reset wallpaper
        default_wall = "/usr/share/backgrounds/kali/kali-16x9.png"
        if os.path.exists(default_wall):
            set_wallpaper(default_wall)
        
        # Reset theme
        set_theme('random_dark')
        
        print("✅ Settings reset to default")
    else:
        print("❌ Reset cancelled")

if __name__ == "__main__":
    try:
        show_menu()
    except KeyboardInterrupt:
        print("\n\n✅ Goodbye!")
        sys.exit(0)