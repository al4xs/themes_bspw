#!/usr/bin/env python3
"""
BSPWM Kali Linux Demonstration Web App
Showcases the cybersecurity tools and features from the kaliSung project
"""

from flask import Flask, render_template, request, jsonify, redirect, url_for
import subprocess
import os
import requests
import eng_to_ipa as ipa
from datetime import datetime
import json
import socket

app = Flask(__name__)

@app.route('/')
def index():
    """Main dashboard showing project overview"""
    return render_template('index.html', 
                         title="BSPWM Kali Linux Demo",
                         project_info={
                             'name': 'kaliSung - BSPWM NSA Theme',
                             'description': 'A Kali Linux BSPWM customization with cybersecurity tools',
                             'author': 'Michael Alves (Al4xs)',
                             'features': [
                                 'BSPWM Window Manager Configuration',
                                 'Cybersecurity Tools Collection',
                                 'Firefox Cascade Theme',
                                 'Security Pattern Matching',
                                 'Educational Hacking Tools'
                             ]
                         })

@app.route('/tools')
def tools():
    """Display available security tools"""
    tools_list = [
        {
            'name': 'Domain Fuzzing',
            'description': 'Test web directories and files',
            'endpoint': '/tools/fuzzing',
            'category': 'Web Security'
        },
        {
            'name': 'Try Harder Game',
            'description': 'Penetration testing simulation game',
            'endpoint': '/tools/game',
            'category': 'Training'
        },
        {
            'name': 'Word Mining (Minera)',
            'description': 'Extract vocabulary for language learning',
            'endpoint': '/tools/minera',
            'category': 'Linguistics'
        },
        {
            'name': 'Matrix Effect',
            'description': 'Terminal matrix animation demo',
            'endpoint': '/tools/matrix',
            'category': 'Visual'
        },
        {
            'name': 'Network Reconnaissance',
            'description': 'IP and domain information gathering',
            'endpoint': '/tools/recon',
            'category': 'Networking'
        }
    ]
    return render_template('tools.html', tools=tools_list)

@app.route('/tools/fuzzing', methods=['GET', 'POST'])
def fuzzing_tool():
    """Simple fuzzing demonstration"""
    if request.method == 'POST':
        target_url = request.form.get('url', '')
        if not target_url.startswith(('http://', 'https://')):
            target_url = 'http://' + target_url
        
        results = []
        common_paths = ['/admin', '/login', '/dashboard', '/config', '/backup', '/test', '/robots.txt']
        
        for path in common_paths:
            test_url = target_url + path
            try:
                response = requests.get(test_url, timeout=5)
                status = response.status_code
                results.append({
                    'url': test_url,
                    'status': status,
                    'result': 'Found' if status == 200 else 'Not Found' if status == 404 else 'Other'
                })
            except requests.RequestException as e:
                results.append({
                    'url': test_url,
                    'status': 'Error',
                    'result': str(e)
                })
        
        return render_template('fuzzing.html', results=results, target=target_url)
    
    return render_template('fuzzing.html')

@app.route('/tools/minera', methods=['GET', 'POST'])
def minera_tool():
    """Word mining tool for language learning"""
    if request.method == 'POST':
        word = request.form.get('word', '').strip()
        if word:
            try:
                ipa_pronunciation = ipa.convert(word)
                
                # Simulate dictionary lookups
                dictionary_urls = {
                    'Cambridge': f'https://dictionary.cambridge.org/dictionary/english-portuguese/{word}',
                    'Tatoeba': f'https://tatoeba.org/pt-br/sentences/search?from=eng&query={word}&to=por',
                    'Glosbe': f'https://glosbe.com/en/pt/{word}',
                    'Reverso': f'https://conjugator.reverso.net/conjugation-english-verb-{word}.html'
                }
                
                return render_template('minera.html', 
                                     word=word, 
                                     ipa=ipa_pronunciation,
                                     urls=dictionary_urls)
            except Exception as e:
                return render_template('minera.html', error=f"Error processing word: {str(e)}")
    
    return render_template('minera.html')

@app.route('/tools/game')
def game_demo():
    """Penetration testing game demonstration"""
    game_info = {
        'title': 'Try Harder: Penetration Testing Simulation',
        'description': 'A command-line style game that teaches penetration testing concepts',
        'features': [
            'Interactive terminal commands',
            'Multiple security scenarios',
            'Points and progression system',
            'Educational security concepts'
        ],
        'sample_commands': [
            'ifconfig - Show network interfaces',
            'nmap -sS 192.168.1.1 - Network scan',
            'nikto -h target.com - Web vulnerability scan',
            'sqlmap -u "url" - SQL injection testing'
        ]
    }
    return render_template('game.html', game=game_info)

@app.route('/tools/matrix')
def matrix_demo():
    """Matrix effect demonstration"""
    return render_template('matrix.html')

@app.route('/tools/recon', methods=['GET', 'POST'])
def recon_tool():
    """Network reconnaissance tool"""
    if request.method == 'POST':
        domain = request.form.get('domain', '').strip()
        if domain:
            # Remove protocol if present
            domain = domain.replace('http://', '').replace('https://', '').split('/')[0]
            
            try:
                # Get IP information
                ip = socket.gethostbyname(domain)
                
                # Get additional info from ipinfo.io
                try:
                    response = requests.get(f'http://ipinfo.io/{ip}/json', timeout=5)
                    if response.status_code == 200:
                        ip_info = response.json()
                    else:
                        ip_info = {'error': 'Could not fetch IP information'}
                except:
                    ip_info = {'error': 'Could not connect to IP info service'}
                
                return render_template('recon.html', 
                                     domain=domain, 
                                     ip=ip, 
                                     ip_info=ip_info)
            except socket.gaierror:
                return render_template('recon.html', error=f"Could not resolve domain: {domain}")
    
    return render_template('recon.html')

@app.route('/config')
def config_demo():
    """Show BSPWM and system configuration"""
    config_info = {
        'bspwm_features': [
            'Tiling window management',
            'Custom keyboard shortcuts (Windows+Enter for terminal)',
            'Workspace management',
            'Custom themes and colors'
        ],
        'installed_tools': [
            'bspwm - Binary Space Partitioning Window Manager',
            'sxhkd - Simple X hotkey daemon',
            'polybar - Status bar',
            'rofi - Application launcher',
            'picom - Compositor',
            'kitty - Terminal emulator',
            'neofetch - System information',
            'ranger - File manager'
        ],
        'shortcuts': [
            'Windows + ENTER: Open terminal',
            'Windows + d: Open application menu',
            'Windows + w: Close windows',
            'Windows + r: Reload system',
            'Windows + x: Lock screen',
            'Windows + Arrows: Navigate terminals',
            'Windows + Alt + Arrows: Resize terminals'
        ]
    }
    return render_template('config.html', config=config_info)

@app.route('/api/system-info')
def system_info_api():
    """API endpoint for system information"""
    try:
        # Get basic system info
        import platform
        import psutil
        
        info = {
            'platform': platform.platform(),
            'python_version': platform.python_version(),
            'cpu_count': psutil.cpu_count(),
            'memory': psutil.virtual_memory()._asdict(),
            'timestamp': datetime.now().isoformat()
        }
        return jsonify(info)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    # Ensure templates directory exists
    os.makedirs('templates', exist_ok=True)
    os.makedirs('static/css', exist_ok=True)
    os.makedirs('static/js', exist_ok=True)
    
    app.run(host='0.0.0.0', port=5000, debug=True)