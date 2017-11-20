# dotfiles

Myriad configuration files for frequently used applications.

# Installation

## Requirements

### GNU Stow

The files are packaged for installation with [GNU stow][stow]
([documentation][stow-doc]). Each package can be installed individually, or
`install.sh` can be used to install all packages at once.

#### Caveats

If `stow` tries to install a file that already exists, it will fail. Remove or
backup any existing files before installing.

### Fonts

The desktop names and status indicators used on the panel are unicode
characters from some special icon fonts. Install them according to your
distribution's instructions.

- [Font Awesome][font-awesome]
- [Foundation Icon Fonts][foundation-icon-font]

## Environment Variables

The following environment variables are used in some `sxhkd` bindings and
scripts. They should be set in `.profile` or similar to ensure all bindings
work correctly. Refer to the [Customization](#customization) section for more.

- `BROWSER` - Web browser: `chromium`, `google-chrome`, `firefox`, etc.
- `EDITOR` - Terminal based text editor: `vim`, `vim`, `emacs`, or `vim`.
- `VISUAL` - GUI text editor: `gvim`, `gvim -f`, `xemacs`, etc.
- `FILE_BROWSER` - File explorer: `thunar`, `nautilus`, `pcmanfm`, etc.
- `SXHKD_SHELL` - A shell through which to run `sxhkd` bindings. My bindings are
  currently compatibile with `bash`.
- `TERMINAL` - Terminal emulator: `urxvtc`, `urxvt256c-mlc`, `termite`, `terminator`, etc.
- `MAIL_CLIENT` - Mail reader: `thunderbird`, `mutt`, etc.
- `CALCULATOR` - Calculator: `gnome-calculator`, `calc`, etc.
- `IM_CLIENT` - Chat program: `pidgin`, `google-hangouts.sh`, `facebook-messenger.sh`, etc.
- `IRC_CLIENT` - IRC client: `irssi`, `hexchat`, `xchat`, etc..
- `MUSIC_PLAYER` - Music player: `google-music.sh`, `ncmpcpp`, `cmus`, `banshee`, etc.
- `VIRTUALIZATION` - Virtualization hypervisor: `virt-manager`, `VirtualBox`, etc.

### XDG Default Applications

Not all applications use the environment variables, but rather rely on XDG (and
`xdg-open`). See the Arch Wiki page on [Default Applications][aw-default-apps]
for a detailed explanation and examples.

#### Web Browser
```
$ xdg-mime default <browser>.desktop x-scheme-handler/http
$ xdg-mime default <browser>.desktop x-scheme-handler/https
```

#### Bittorrent
```
$ xdg-mime default <torrent-client>.desktop x-scheme-handler/magnet
$ xdg-mime default <torrent-client>.desktop application/x-bittorrent
```

# Packages

- `bash` - `.bashrc` and aliases.
- `bin` - Scripts for [polybar][polybar] and application launchers.
- `bspwm` - Configuration files for the binary space partitioning window
  manager, [bspwm][bspwm].
- `dunst` - Configuration files for the [dunst][dunst] notification daemon.
- `fish` - Configuration files and custom functions for the [fish][fish] shell.
- `sxhkd` - Configuration for the simple X hotkey daemon, [sxhkd][sxhkd].
- `Templates` - Skeleton files for several programming languages.
- `vim` - `.vimrc`.
- `misc` - `.Xresources`, `.profile`, and other configuration options which are
  less strictly bound to a single application.

# Screenshot

![screenshot](./screenshot.jpg)

# Customization

I work on a few different systems that sometimes have similar, but slightly
different environments. I want my settings to be as portable as possible, but I
require some local customizations which differ from system to system.
Presumably, other users will also want/require some slightly different
settings. The two simplest ways to tweak these settings and still be able to
get updates from this repository are branching and forking.

The included `.profile` and `panel_options` files will almost certainly need to
be edited.

## Branching

Create a new branch for each system running these settings. Merge the `master`
branch into your custom branch as changes are pushed.

1. `git checkout -b $(hostname)`
1. Edit files to your liking.
1. `git add -u`
1. `git commit`

After I push changes to this repository, you can merge them with your own customizations.

1. `git checkout master`
1. `git pull`
1. `git checkout $(hostname)`
1. `git merge master`
1. Resolve any merge conflicts and follow `git` instructions.

## Forking

1. Fork this repo.
1. Edit files to your liking.
1. [Sync this repo][sync-fork] with your fork.
1. Resolve any merge conflicts and follow `git` instructions.

# Troubleshooting

## Scripts Not Executing

Depending on how the `$PATH` is setup for your session, it may not include
`~/.local/bin/`. This will cause the [bspwm][bspwm] scripts to fail to load (as
they won't be found).

Manually create symlinks to these files in a location that will be in your
`$PATH` when your session launches, such as `/usr/local/bin/`, or ensure
`~/.local/bin/` is added to the global `$PATH`.

`# ln -s ~/.local/bin/panel /usr/local/bin/panel`, etc.

[aw-default-apps]: https://wiki.archlinux.org/index.php/Default_applications "Arch Wiki - Default Applications"
[bspwm]: https://github.com/baskerville/bspwm "Binary Space Partitioning Window Manager"
[dunst]: https://github.com/knopwob/dunst "dunst Notification Daemon"
[fish]: http://fishshell.com "Fish Shell"
[font-awesome]: http://fortawesome.github.io/Font-Awesome "Font Awesome"
[foundation-icon-font]: http://zurb.com/playground/foundation-icon-fonts-3 "Foundation Icon Fonts"
[polybar]: https://github.com/jaagr/polybar "Polybar"
[stow-doc]: http://www.gnu.org/software/stow/manual/stow.html "GNU Stow Documentation"
[stow]: https://www.gnu.org/software/stow "GNU Stow"
[sxhkd]: https://github.com/baskerville/sxhkd "Simple X HotKey Daemon"
[sync-fork]: https://help.github.com/articles/syncing-a-fork/ "Syncing a fork"
[vim]: https://github.com/vim/vim "Vi Improved"
