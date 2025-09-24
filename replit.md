# Overview

This is a Kali Linux BSPWM (Binary Space Partitioning Window Manager) customization script called "kaliSung" that provides an NSA-themed desktop environment optimized for CTF (Capture The Flag) competitions and cybersecurity work. The project includes automated installation scripts, a collection of cybersecurity tools, Firefox browser customizations with the Cascade theme, and various hacking utilities for penetration testing and security research.

# User Preferences

Preferred communication style: Simple, everyday language.

# System Architecture

## Core Components

**Installation System**: The project uses a two-stage installation approach with `kali.sh` for user-level configurations and `root.sh` for system-level changes. This separation ensures proper privilege management during the setup process.

**Window Manager Configuration**: BSPWM is configured as the primary window manager with custom keybindings (Windows+Enter for terminal, Windows+d for menu, etc.) optimized for keyboard-driven workflow typical in cybersecurity environments.

**Security Tools Collection**: The `/home/hacktools/` directory contains various Python-based security utilities including:
- Domain generation tools for phishing detection
- Web fuzzing scripts for vulnerability assessment  
- Interactive penetration testing simulation games
- Word mining tools for language learning (supporting security professionals' skill development)

**Pattern Matching System**: Extensive collection of GF (grep-friendly) pattern files for identifying security vulnerabilities across different categories (XSS, SQL injection, LFI, RCE, etc.). These patterns are organized in JSON format for easy integration with security testing workflows.

**Browser Customization**: Firefox is customized with the Cascade theme providing a minimalist, keyboard-focused interface. The theme includes dark/light mode support and is optimized for reduced visual clutter during security research.

## Design Patterns

**Configuration Management**: All customizations use CSS variables and modular imports, allowing easy theme switching and maintenance. The browser theme separates concerns into distinct files (colors, layout, navigation, tabs).

**Security-First Architecture**: Tools are organized by attack vector (XSS, SQLi, SSRF, etc.) with standardized pattern matching for consistent vulnerability identification across different targets.

**Modular Tool Design**: Each security tool is self-contained with minimal dependencies, allowing individual tools to be used independently or integrated into larger testing workflows.

# External Dependencies

**System Dependencies**: 
- Kali Linux operating system
- BSPWM window manager
- Python 3 runtime environment

**Python Libraries**:
- `requests` for HTTP operations in security tools
- `webbrowser` for automated browser integration
- `whois` for domain reconnaissance
- `eng_to_ipa` for phonetic analysis in language tools
- `termcolor`/`colorama` for enhanced terminal output

**Web Services Integration**:
- Multiple dictionary and translation services (Cambridge, Oxford, Linguee, etc.)
- Tatoeba API for sentence examples
- Google services for image search and translation
- Phonetizer API for phonetic transcription

**Security Resources**:
- DirBuster wordlists from `/usr/share/wordlists/`
- Various online vulnerability databases and pattern matching services
- Browser-based security testing platforms

The architecture prioritizes modularity, security focus, and ease of use for cybersecurity professionals while maintaining clean separation of concerns across different functional areas.