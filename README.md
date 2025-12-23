# My Arch Linux Dotfiles 🎨

A collection of configuration files (dotfiles) for my Arch Linux rice setup.

**→ New to this repo? Check out the [Quick Start Guide](QUICKSTART.md)!**

## 📋 Contents

This repository contains configuration files for:

- **i3** - Tiling window manager
- **Polybar** - Status bar
- **Kitty** - Terminal emulator
- **Neovim** - Text editor
- **Rofi** - Application launcher
- **Dunst** - Notification daemon
- **Picom** - Compositor for transparency and effects
- **GTK** - GTK theme settings

## 📁 Structure

```
.
├── .config/
│   ├── i3/           # i3 window manager configuration
│   ├── polybar/      # Polybar status bar
│   ├── kitty/        # Kitty terminal
│   ├── nvim/         # Neovim editor
│   ├── rofi/         # Rofi launcher
│   ├── dunst/        # Dunst notifications
│   ├── picom/        # Picom compositor
│   └── gtk-3.0/      # GTK theme settings
└── README.md
```

## 🚀 Installation

### Prerequisites

Install the required packages on Arch Linux:

```bash
sudo pacman -S i3-wm polybar kitty neovim rofi dunst picom
```

**Optional packages:**
```bash
# Wallpaper manager (choose one)
sudo pacman -S nitrogen feh

# Icon themes
sudo pacman -S papirus-icon-theme
```

### Setup

1. Clone this repository:
```bash
git clone https://github.com/krrishmahar/my_dotfiles.git
cd my_dotfiles
```

2. Backup your existing configs (important!):
```bash
mkdir -p ~/.config_backup
cp -r ~/.config/* ~/.config_backup/
```

3. Copy the configuration files:
```bash
cp -r .config/* ~/.config/
```

4. Restart i3 or reboot to apply changes:
```bash
i3-msg restart
```

## ⚙️ Customization

Feel free to modify any configuration files to suit your preferences. Each config directory contains well-commented files to help you understand and customize the settings.

## 📸 Screenshots

Coming soon!

## 🤝 Contributing

Feel free to submit issues or pull requests if you have suggestions for improvements.

## 📄 License

See [LICENSE](LICENSE) file for details.

## 🙏 Credits

Inspired by the amazing Arch Linux and r/unixporn communities!