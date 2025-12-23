# Quick Start Guide

This guide will help you get started with these Arch Linux dotfiles quickly.

## What You Get

This repository provides a complete, ready-to-use configuration for a modern Arch Linux desktop environment using:

- **i3-wm**: A tiling window manager that's keyboard-driven and efficient
- **Polybar**: A beautiful status bar showing system information
- **Kitty**: A fast, feature-rich terminal emulator
- **Neovim**: A modern, extensible text editor
- **Rofi**: An elegant application launcher
- **Dunst**: Clean, customizable notifications
- **Picom**: Smooth compositing with transparency and effects

All configs use the **Dracula** color scheme for a consistent, eye-pleasing look.

## Installation in 3 Steps

### 1. Install Required Packages
```bash
sudo pacman -S i3-wm polybar kitty neovim rofi dunst picom
```

### 2. Run the Install Script
```bash
chmod +x install.sh
./install.sh
```

The script will:
- Check for missing dependencies
- Backup your existing configs
- Install the new configurations

### 3. Restart i3
```bash
i3-msg restart
```

Or simply logout and login again.

## First Time Using i3?

Here are the essential keybindings to get started:

- `Super + Enter` - Open terminal
- `Super + d` - Open application launcher
- `Super + Shift + q` - Close window
- `Super + 1-9` - Switch workspaces
- `Super + Shift + e` - Exit i3

See [KEYBINDINGS.md](KEYBINDINGS.md) for a complete reference.

## Customization

All configuration files are in `.config/` and are well-commented. Feel free to:

1. Change the **Mod key** (currently Super/Windows key) in `.config/i3/config`
2. Adjust **colors** in any config file
3. Modify **keybindings** to match your workflow
4. Add/remove **autostart applications** in i3 config

## Optional Enhancements

```bash
# Wallpaper managers
sudo pacman -S nitrogen feh

# Icon themes
sudo pacman -S papirus-icon-theme

# Fonts for better polybar icons
sudo pacman -S ttf-font-awesome
```

## Troubleshooting

**Polybar not showing?**
- Check if it's running: `ps aux | grep polybar`
- Check logs: `cat /tmp/polybar.log`

**i3 not starting?**
- Check i3 log: `cat ~/.local/share/i3/i3log`
- Validate config: `i3 -C`

**Colors look wrong?**
- Ensure your terminal supports true colors
- Check `echo $TERM` (should be `xterm-kitty` in Kitty)

## Next Steps

1. Take a screenshot and add it to `screenshots/` directory
2. Customize colors to match your preference
3. Install your favorite applications
4. Share your rice on r/unixporn!

## Need Help?

- Check existing issues on GitHub
- Read the [CONTRIBUTING.md](CONTRIBUTING.md) guide
- Open a new issue if you find a bug

Happy ricing! 🎨
