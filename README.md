# dotfiles

Installation of dotfiles. Made for Void Linux (bootstrap script relies on XBPS)

1. Install `yadm`
2. Run `yadm pull https://github.com/linde12/dotfiles`
3. Run `yadm bootstrap`

# Cursor

https://github.com/TheScrawl/xcursor-breeze-neutral

Run to `sudo cp -r xcursor-breeze-neutral /usr/share/icons/`

Select via `lxappearance`

# Firefox

Search for antialaising issue with default Helvetica fonts and fix it.

# Pokemon

Install by cloning `https://gitlab.com/phoneybadger/pokemon-colorscripts` and then running `sudo ./install.sh`

# Background

Binaries of `eww` and `swww` are shipped with the dotfiles. Can be built manually and updated.

# TODO

- Automatically set up crontab
- Automatically fix firefox fonts
- Automatically set GTK themes
- Automatically refresh font cahe (fc-cache in bootstrap)
- Find more reliable way for xdg-desktop-portal to work? Currently feels very shaky
