#!/usr/bin/env python3
"""
Fix ETH0 Interface Issues for Polybar
Part of kaliSung BSPWM project
"""

import subprocess
import re
import os
import json
from pathlib import Path

def get_network_interfaces():
    """Get all available network interfaces"""
    try:
        # Try ip command first
        result = subprocess.run(['ip', 'link', 'show'], 
                              capture_output=True, text=True, timeout=5)
        if result.returncode == 0:
            interfaces = []
            for line in result.stdout.split('\n'):
                if ': ' in line and 'state' in line:
                    # Extract interface name
                    parts = line.split(': ')
                    if len(parts) >= 2:
                        iface = parts[1].split('@')[0]  # Remove @... suffix
                        if not iface.startswith('lo'):  # Skip loopback
                            interfaces.append(iface)
            return interfaces
    except:
        pass
    
    # Fallback: try ifconfig
    try:
        result = subprocess.run(['ifconfig'], 
                              capture_output=True, text=True, timeout=5)
        if result.returncode == 0:
            interfaces = []
            for line in result.stdout.split('\n'):
                if line and not line.startswith(' ') and ':' in line:
                    iface = line.split(':')[0]
                    if not iface.startswith('lo'):  # Skip loopback
                        interfaces.append(iface)
            return interfaces
    except:
        pass
    
    # Last resort: check /sys/class/net
    try:
        net_dir = Path('/sys/class/net')
        if net_dir.exists():
            interfaces = []
            for iface_dir in net_dir.iterdir():
                if iface_dir.is_dir() and not iface_dir.name.startswith('lo'):
                    interfaces.append(iface_dir.name)
            return sorted(interfaces)
    except:
        pass
    
    return []

def detect_main_interface():
    """Detect the main network interface"""
    interfaces = get_network_interfaces()
    
    if not interfaces:
        return None
    
    # Priority order for interface selection
    priorities = ['eth0', 'enp', 'ens', 'eno', 'wlan0', 'wlp', 'wls']
    
    for priority in priorities:
        for iface in interfaces:
            if iface.startswith(priority):
                return iface
    
    # Return first available interface
    return interfaces[0] if interfaces else None

def get_interface_info(interface):
    """Get detailed interface information"""
    info = {'name': interface, 'ip': 'N/A', 'status': 'down'}
    
    try:
        # Get IP address
        result = subprocess.run(['ip', 'addr', 'show', interface], 
                              capture_output=True, text=True, timeout=5)
        if result.returncode == 0:
            for line in result.stdout.split('\n'):
                if 'inet ' in line and 'scope global' in line:
                    ip_match = re.search(r'inet (\d+\.\d+\.\d+\.\d+)', line)
                    if ip_match:
                        info['ip'] = ip_match.group(1)
                        info['status'] = 'up'
                        break
    except:
        pass
    
    return info

def fix_polybar_config():
    """Fix polybar configuration for network interface"""
    polybar_config = Path.home() / '.config' / 'polybar' / 'config'
    
    if not polybar_config.exists():
        print("❌ Polybar config not found")
        return False
    
    # Detect main interface
    main_interface = detect_main_interface()
    if not main_interface:
        print("❌ No network interface detected")
        return False
    
    print(f"🔍 Detected main interface: {main_interface}")
    
    try:
        # Read current config
        with open(polybar_config, 'r') as f:
            content = f.read()
        
        # Replace eth0 references with detected interface
        content = re.sub(r'interface\s*=\s*eth0', f'interface = {main_interface}', content)
        content = re.sub(r'interface-type\s*=\s*wired', 'interface-type = wired', content)
        
        # Write updated config
        with open(polybar_config, 'w') as f:
            f.write(content)
        
        print(f"✅ Polybar config updated with interface: {main_interface}")
        return True
        
    except Exception as e:
        print(f"❌ Error updating polybar config: {e}")
        return False

def create_interface_script():
    """Create a script to dynamically get interface info"""
    script_path = Path.home() / '.config' / 'polybar' / 'scripts' / 'network-info.sh'
    script_path.parent.mkdir(parents=True, exist_ok=True)
    
    script_content = '''#!/bin/bash
# Dynamic network interface detection for polybar

get_interface() {
    # Try to find main network interface
    for iface in $(ip link show | grep -E "^[0-9]+:" | cut -d: -f2 | tr -d ' '); do
        if [[ ! "$iface" =~ ^lo ]]; then
            # Check if interface has IP
            if ip addr show "$iface" | grep -q "inet.*scope global"; then
                echo "$iface"
                return
            fi
        fi
    done
    
    # Fallback: return first non-loopback interface
    ip link show | grep -E "^[0-9]+:" | cut -d: -f2 | tr -d ' ' | grep -v '^lo' | head -n1
}

INTERFACE=$(get_interface)

case "$1" in
    "name")
        echo "$INTERFACE"
        ;;
    "ip")
        if [ -n "$INTERFACE" ]; then
            ip addr show "$INTERFACE" | grep "inet " | awk '{print $2}' | cut -d/ -f1 | head -n1
        else
            echo "N/A"
        fi
        ;;
    "status")
        if [ -n "$INTERFACE" ]; then
            if ip link show "$INTERFACE" | grep -q "state UP"; then
                echo "UP"
            else
                echo "DOWN"
            fi
        else
            echo "DOWN"
        fi
        ;;
    *)
        echo "Usage: $0 {name|ip|status}"
        ;;
esac
'''
    
    with open(script_path, 'w') as f:
        f.write(script_content)
    
    os.chmod(script_path, 0o755)
    print(f"✅ Network info script created: {script_path}")

def main():
    """Main function to fix network interface issues"""
    print("\n🔧 NETWORK INTERFACE FIX TOOL")
    print("="*40)
    
    # Get all interfaces
    interfaces = get_network_interfaces()
    print(f"\n📡 Available interfaces: {', '.join(interfaces) if interfaces else 'None found'}")
    
    # Detect main interface
    main_iface = detect_main_interface()
    if main_iface:
        info = get_interface_info(main_iface)
        print(f"🎯 Main interface: {info['name']} (IP: {info['ip']}, Status: {info['status']})")
        
        # Fix polybar config
        fix_polybar_config()
        
        # Create dynamic script
        create_interface_script()
        
        print("\n✅ Network interface configuration fixed!")
        print("💡 Restart polybar to apply changes: killall polybar && polybar &")
    else:
        print("\n❌ Could not detect any network interface")
        print("💡 This might be normal in containers or virtual environments")

if __name__ == "__main__":
    main()