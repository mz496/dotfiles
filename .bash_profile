export PATH=$HOME/.toolbox/bin:$PATH
export EDITOR=/usr/bin/vim

source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh

alias kinitf='kinit -f -l 36000 -r 604800'

# Never let ninja dev sync sleep
alias nds='echo "caffeinate -i nds -v" && caffeinate -i ninja-dev-sync -v'

#alias ssh='caffeinate -i ssh'
alias scp='caffeinate -i scp'

alias glog='git log --graph --format=medium --decorate --all --full-history'
#alias glogs='git log --graph --decorate --all --oneline'
alias glogb='git log --graph --decorate --date=format:"%b-%d %H:%M" --pretty=format:"%C(auto)%h %<(50,trunc)%s %C(dim white) %cd %<(12,trunc)%cn %C(auto)%d"'
alias glogs='glogb --all'
alias gs='git branch && git status && echo "Changes already committed:" && git diff --name-status --color origin/mainline..'
alias gco='git checkout'

alias nds='echo "caffeinate -i nds -v" && caffeinate -i ninja-dev-sync -v'  # NEVER SLEEP!

sshme () {
  ssh mattzhu.aka.corp.amazon.com
}




alias bws='brazil ws'
alias bwssmd='brazil ws --sync --md'
 
# a helper to get to the root of a workspace
wsroot() {
  startdir=$PWD
 
  # Keep going up until packageInfo exists in current directory
  while [ ! -f packageInfo ]
  do
    cd ..
    # Failed to find root, we weren't in a workspace
    if [ $PWD == "/" ]; then
      cd $startdir
      echo "Not in a brazil workspace"
        return 1
      fi
  done
  return 0
}
# git pull mainline for all packages in workspace:  (also syncs version set)
gpall() {
  wsroot && cd src
  bwssmd
 
  for d in `find . -mindepth 1 -maxdepth 1 -type d`
  do
    echo ""
    echo ""
    echo "-----------------------"
    echo "$d:"
    echo "-----------------------"
 
 
    cd $d
    git branch
    echo ""
 
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    (git checkout mainline && git pull --rebase || git pull) && git checkout $current_branch
    echo ""
     
 
    git status
    cd - &> /dev/null
  done
}

gcoall() {
  branch_name=$1
  wsroot && cd src
  for d in `find . -mindepth 1 -maxdepth 1 -type d`
  do
    cd $d
    git checkout $branch_name
    cd - &> /dev/null
  done
}

# Git branch alias
source ~/.test


#=============

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

export PATH=$PATH:$HOME/Library/Python/3.7/bin
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /Users/mattzhu/Library/Python/3.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home
export LD_LIBRARY_PATH=/Applications/VLC.app/Contents/MacOS/lib:
export VLC_PLUGIN_PATH=/Applications/VLC.app/Contents/MacOS/plugins
export VLC_PATH=/Applications/VLC.app/Contents/MacOS/lib
