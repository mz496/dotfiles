## Setup notes

### General

* Remap CapsLock to Esc: System Preferences > Keyboard > Keyboard > Modifier Keys...
* Remap special shortcuts: System Preferences > Keyboard > Shortcuts > Mission Control etc.
* Trackpad speed: one notch past midpoint
* Install [Hammerspoon](https://github.com/Hammerspoon/hammerspoon/releases/latest) (for scroll with Ctrl); `cp ./hammerspoon/init.lua ~/.hammerspoon/`; Reload Config
* Install [Rectangle](https://rectangleapp.com/) (for resizing windows): import `RectangleConfig.json`

### Shell

* Install [Homebrew](https://brew.sh/)
* Install [iTerm2](https://iterm2.com/); `⌘`-`,` to open Preferences; import `iterm2/iterm2profile.json` and set as default (Preferences > Profiles)
* Install [Powerlevel10k](https://github.com/romkatv/powerlevel10k#manual), includes git prompt
* `source ~/Documents/dotfiles/home/.profile_git` into `~/.zshrc` (or other rc)
* `cp ./home/.gitconfig ~`

### Vim

* `cp ./home/.vimrc ~`

* vim solarized colors - source: https://github.com/altercation/solarized/tree/master/vim-colors-solarized
```
cd /tmp && git clone https://github.com/altercation/solarized && mkdir -p ~/.vim/colors/; mv solarized/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
```

* Vundle - source: https://github.com/VundleVim/Vundle.vim#quick-start
```
cd /tmp && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && vim +PluginInstall +qall
```

### Tmux

```
brew install tmux
```
* `cp .tmux.conf ~`

