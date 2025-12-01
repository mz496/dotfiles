# Setup notes

## General

* System Preferences > Keyboard
  * Key repeat rate = Fast (maximum)
  * Delay until repeat = Short (maximum)
  * … > Keyboard Shortcuts…
    * Remap CapsLock to Esc: … > Modifier Keys
    * Remap Mission Control to Cmd-Esc: … > Mission Control
* System Preferences > Trackpad
  * Tracking speed = 6/10
  * Turn off swipe to go back: … > More Gestures > Swipe between pages = Off
* Install [Hammerspoon](https://github.com/Hammerspoon/hammerspoon/releases/latest) (for scroll with Alt):
  - `cp ./hammerspoon/init.lua ~/.hammerspoon/`
  - Reload Config
* Install [Rectangle](https://rectangleapp.com/) (for resizing windows):
  - import `RectangleConfig.json`
 
* Startup items: System Preferences > Login Items & Extensions

## Shell

* Install [Homebrew](https://brew.sh/)

### Aliases
* Git shell aliases:
  - `echo "source $PWD/home/.profile_git" >> ~/.zshrc`
* Git command-level aliases:
  - `cp ./home/.gitconfig ~`

### Prettiness
* TODO: remove in favor of Warp
* Install [iTerm2](https://iterm2.com/):
  - `⌘`-`,` to open Preferences
  - import `iterm2/iterm2profile.json`
  - set as default (Preferences > Profiles)
* Install [Powerlevel10k](https://github.com/romkatv/powerlevel10k#manual), includes git prompt
* Install [zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete):
  - `cd ~/Documents/dotfiles && git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git && echo "source ~/Documents/dotfiles/zsh-autocomplete/zsh-autocomplete.plugin.zsh" >> ~/.zshrc`

## Vim

* `cp ./home/.vimrc ~`
  - (won't work until the below is complete)
* Install [vim solarized colors](https://github.com/altercation/solarized/tree/master/vim-colors-solarized):
  - `cd /tmp && git clone https://github.com/altercation/solarized && mkdir -p ~/.vim/colors/; mv solarized/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/`
* Install [Vundle](https://github.com/VundleVim/Vundle.vim#quick-start):
  - `cd /tmp && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && vim +PluginInstall +qall`

## Tmux

* `brew install tmux`
* `cp .tmux.conf ~`

## TODO: Raycast
