## Setup notes

### General

* Remap CapsLock to Esc: System Preferences > Keyboard > Keyboard > Modifier Keys...
* Remap Desktop switch: System Preferences > Keyboard > Shortcuts > Mission Control > Move left/right a space

### Shell

* Install iTerm2; import `iterm2profile.json` and set as default (Preferences > Profiles)
* Install Powerlevel10k, includes git prompt
* `source ~/Documents/dotfiles/.profile_git` into `~/.zshrc` (or other rc)
* `cp .gitconfig ~`
* TODO: Is this still needed without powerline? `mkdir ~/.config; cp -R .config/* ~/.config/`

### Vim

* `cp .vimrc ~`

* vim solarized colors - source: https://github.com/altercation/solarized/tree/master/vim-colors-solarized
```
cd ~/Documents && git clone https://github.com/altercation/solarized && mkdir -p ~/.vim/colors/; mv solarized/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
```

* Vundle - source: https://github.com/VundleVim/Vundle.vim#quick-start
```
cd ~/Documents && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && vim +PluginInstall +qall
```

### Tmux

* brew - source: https://brew.sh
```
brew install tmux
```
* `cp .tmux.conf ~`

