#!/bin/bash

# Dotfiles Installation Script
# This script helps you install the dotfiles to your system

set -e

echo "======================================"
echo "  Arch Linux Dotfiles Installation"
echo "======================================"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored messages
print_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on Arch Linux
if [ ! -f /etc/arch-release ]; then
    print_warning "This script is designed for Arch Linux."
    read -p "Do you want to continue anyway? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Backup existing configs
backup_configs() {
    print_info "Creating backup of existing configurations..."
    
    BACKUP_DIR="$HOME/.config_backup_$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    
    for dir in i3 polybar kitty nvim rofi dunst picom gtk-3.0; do
        if [ -d "$HOME/.config/$dir" ]; then
            print_info "Backing up $dir..."
            cp -r "$HOME/.config/$dir" "$BACKUP_DIR/"
        fi
    done
    
    print_info "Backup created at: $BACKUP_DIR"
}

# Install dotfiles
install_dotfiles() {
    print_info "Installing dotfiles..."
    
    # Copy config files
    cp -r .config/* "$HOME/.config/" 2>/dev/null || true
    
    # Make scripts executable
    chmod +x "$HOME/.config/polybar/launch.sh" 2>/dev/null || true
    
    print_info "Dotfiles installed successfully!"
}

# Check dependencies
check_dependencies() {
    print_info "Checking dependencies..."
    
    MISSING_DEPS=()
    DEPS=(i3 polybar kitty nvim rofi dunst picom)
    
    for dep in "${DEPS[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            MISSING_DEPS+=("$dep")
        fi
    done
    
    if [ ${#MISSING_DEPS[@]} -ne 0 ]; then
        print_warning "Missing dependencies: ${MISSING_DEPS[*]}"
        echo ""
        echo "Install them with:"
        echo "  sudo pacman -S ${MISSING_DEPS[*]}"
        echo ""
        read -p "Do you want to continue installation anyway? (y/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    else
        print_info "All dependencies are installed!"
    fi
}

# Main installation flow
main() {
    echo ""
    check_dependencies
    echo ""
    
    read -p "Do you want to backup existing configs? (Y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Nn]$ ]]; then
        backup_configs
    fi
    
    echo ""
    read -p "Proceed with installation? (Y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Nn]$ ]]; then
        install_dotfiles
        echo ""
        print_info "Installation complete!"
        print_info "Restart i3 with: i3-msg restart"
        print_info "Or logout and login again to apply all changes."
    else
        print_info "Installation cancelled."
    fi
}

# Run main function
main
