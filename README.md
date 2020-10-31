## Setup notes

### General

* Remap CapsLock to Esc: System Preferences > Keyboard > Keyboard > Modifier Keys...

### Shell

* `cp .bash_profile* ~`
* `cp .gitconfig ~`
* `cp -R .config ~`
* iTerm2; import `iterm2profile.json`
* pip
 - https://pip.pypa.io/en/stable/installing/
* powerline-status and any patched font; preferred Source Code Pro: `pip3 install powerline-status`
 - https://powerline.readthedocs.io/en/master/installation.html
* powerline-gitstatus (optional)
 - https://github.com/jaspernbrouwer/powerline-gitstatus
* clone powerline for tmux plugin later: `cd ~/Documents && git clone https://github.com/powerline/powerline`
 
### Vim

* `cp .vimrc ~`
* vim solarized colors: `git clone https://github.com/altercation/solarized && mkdir ~/.vim/colors/; mv solarized/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/`
 - https://github.com/altercation/solarized/tree/master/vim-colors-solarized
* Vundle: `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && vim +PluginInstall +qall`
 - https://github.com/VundleVim/Vundle.vim#quick-start
 
### Tmux

* brew; `brew install tmux`
 - https://brew.sh/
* `cp .tmux.conf ~`
* TODO: solarized colors in tmux with powerline?

