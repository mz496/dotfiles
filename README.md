## Setup notes

### General

* Remap CapsLock to Esc: System Preferences > Keyboard > Keyboard > Modifier Keys...
* Remap Desktop switch: System Preferences > Keyboard > Shortcuts > Mission Control > Move left/right a space

### Shell

* `cp .bash_profile* ~`
* `cp .gitconfig ~`
* `mkdir ~/.config; cp -R .config/* ~/.config/`
* iTerm2; import `iterm2profile.json` (Preferences > Profiles)
* powerline-status and any patched font; preferred Source Code Pro. source: https://powerline.readthedocs.io/en/master/installation.html
```
pip3 install powerline-status
```
* powerline-gitstatus - source: https://github.com/jaspernbrouwer/powerline-gitstatus
* clone powerline for tmux plugin later:
```
cd ~/Documents && git clone https://github.com/powerline/powerline
```

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
* TODO: solarized colors in tmux with powerline?

