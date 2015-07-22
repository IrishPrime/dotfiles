# dotfiles

Myriad configuration files for frequently used applications.

# Installation

The files are packaged for installation with [GNU
stow](https://www.gnu.org/software/stow/)
([documentation](http://www.gnu.org/software/stow/manual/stow.html)).

Each package can be installed individually, or `install.sh` can be used to
install all packages at once.

## Caveats

If `stow` tries to install a file that already exists, it will fail. Remove or
backup any existing files before installing.

## Environment Variables

The following environment variables are used in some `sxhkd` bindings and
scripts. They should be set in `.profile` or similar to ensure all bindings
work correctly.

- `EDITOR`
- `VISUAL`
- `BROWSER`
- `SXHKD_SHELL`
- `TERMINAL`
- `FILE_BROWSER`

# Packages

- `bash` - `.bashrc` and aliases.
- `bin` - Scripts for [lemonbar](https://github.com/LemonBoy/bar) and
  application launchers.
- `bspwm` - Configuration files for the binary space partitioning window
  manager, [bspwm](https://github.com/baskerville/bspwm).
- `dunst` - Configuration files for the
  [dunst](https://github.com/knopwob/dunst) notification front-end.
- `fish` - Configuration files and custom functions for the
  [fish](http://fishshell.com/) shell.
- `ssh` - Configuration files for `ssh`.
- `sxhkd` - Configuration for the simple X hotkey daemon, [sxhkd](https://github.com/baskerville/sxhkd).
- `Templates` - Skeleton files for several programming languages.
- `vim` - `.vimrc`.
- `Xresources` - Terminal options and colorschemes.

# Screenshot

![screenshot](./screenshot.jpg)
