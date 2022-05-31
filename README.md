## dotfiles

### Install

`git clone https://github.com/petong/dotfiles.git --recurse-submodules`

### Dotfiles

* vim
* neovim
* zsh
* tmux

### tmux plugins

#### tmux plugin manager
[Plugin manager for tmux](https://github.com/tmux-plugins/tpm)
| Key Binding| Action|
|------------|-------|
|prefix + I  | Installs new plugins |
|prefix + U  | Updates plugins |
|prefix + alt + u  | Uninstall plugins |

####tmux logging
[logging for tmux](https://github.com/tmux-plugins/tmux-logging)
| Key Binding| Action|
|------------|-------|
|prefix + P | (start/stop) logging in the current pane|
|prefix + alt + p  |Save visible text, in the current pane|
| prefix + alt + P |Save complete pane history to a file|

#### tmux sessionist
https://github.com/tmux-plugins/tmux-sessionist

#### tmux pain control
[Tmux plugin for controlling panes](https://github.com/tmux-plugins/tmux-pain-control)
| Key Binding| Action|
|------------|-------|
|<td colspan=3>Splitting panes
|prefix + \| |split current pane horizontally|
|prefix + - |split current pane vertically|
|prefix + \ | split current pane full width horizontally|
|prefix + _ | split current pane full width vertically|
|<td colspan=3>Swapping windows
|prefix + < | moves current window one position to the left|
|prefix + > | moves current window one position to the right|
|<td colspan=3>Navigation
|prefix + h and prefix + C-h |select pane on the left|
|prefix + j and prefix + C-j |select pane below the current one|
|prefix + k and prefix + C-k |select pane above|
|prefix + l and prefix + C-l |select pane on the right|
|<td colspan=3>Resizing panes
|prefix + shift + h |resize current pane 5 cells to the left|
|prefix + shift + j |resize 5 cells in the down direction|
|prefix + shift + k |resize 5 cells in the up direction|
|prefix + shift + l |resize 5 cells to the right|

### Brew

Create a Brewfile

```
brew bundle dump
```

Install packages from your Brewfile

```
brew bundle
```
