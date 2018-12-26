source ~/.notifyme

export PATH=$PATH:/apollo/env/GordianKnot/bin

alias gs='git branch && git status && echo "Changes already committed:" && git diff --name-status --color origin/mainline..'
alias bbc='bb clean'
alias now='date "+%b %d %H:%M"'
alias testserver='python -m SimpleHTTPServer'

git-vm-warning() {
  echo 'WHY ARE YOU DOING GIT TREE OPERATIONS ON THE DESKTOP???  Ninja-dev-sync may overwrite this!'
  echo "If you are so sure, do:  /apollo/env/SDETools/bin/git $@"
}

git() {
  case $1 in
    "add")      git-vm-warning "$@"; return ;;
    "checkout") git-vm-warning "$@"; return ;;
    "commit")   git-vm-warning "$@"; return ;;
    "merge")    git-vm-warning "$@"; return ;;
    "mv")       git-vm-warning "$@"; return ;;
    "pull")     git-vm-warning "$@"; return ;;
    "push")     git-vm-warning "$@"; return ;;
    "rebase")   git-vm-warning "$@"; return ;;
    "reset")    git-vm-warning "$@"; return ;;
    "rm")       git-vm-warning "$@"; return ;;
    "stash")    git-vm-warning "$@"; return ;;
    "tag")      git-vm-warning "$@"; return ;;
  esac

  # Allow 'git status', 'git branch', diff, etc. as those are OK read-only operations:
  /apollo/env/SDETools/bin/git $@
}

post-review() {
  echo 'WHY ARE YOU POSTING CODE REVIEWS FROM THE DESKTOP???  Ninja-dev-sync may overwrite this!'
  echo "If you are so sure, do:  /apollo/env/SDETools/bin/post-review $@"
}

alias deesos-integration-test='/apollo/bin/env -e DeeSOS brazil-build macaw-desktop -DaccountPool=PlaE2EAccounts-devo -DwhaAccountPool=PlatformWholeHomeAudioAccounts-devo'















source /apollo/env/envImprovement/var/zshrc

export BRAZIL_WORKSPACE_DEFAULT_LAYOUT=short

for f in SDETools envImprovement AmazonAwsCli OdinTools; do
    if [[ -d /apollo/env/$f ]]; then
        export PATH=$PATH:/apollo/env/$f/bin
    fi
done

export AUTO_TITLE_SCREENS="NO"

export PROMPT="
%{$fg[white]%}(%D{%b %d %H:%M:%S}) <%?> [%~] $program %{$fg[default]%}
%{$bg[cyan]%}%{$fg_bold[white]%} $USER ☁ %{$reset_color%}%{$bg[default]%}%{$fg[cyan]%}%{$fg[default]%} "
#

#export RPROMPT="%{$fg[white]%}%m%{$fg[default]%} "
export RPROMPT=

set-title() {
    echo -e "\e]0;$*\007"
}

ssh() {
    set-title $*;
    /usr/bin/ssh -2 $*;
    set-title $HOST;
}

alias e=emacs
alias bb=brazil-build

alias bba='brazil-build apollo-pkg'
alias bre='brazil-runtime-exec'
alias brc='brazil-recursive-cmd'
alias bws='brazil ws'
alias bwsuse='bws use --gitMode -p'
alias bwscreate='bws create -n'
alias brc=brazil-recursive-cmd
alias bbr='brc brazil-build'
alias bball='brc --allPackages'
alias bbb='brc --allPackages brazil-build'
alias bbra='bbr apollo-pkg'

if [ -f ~/.zshrc-dev-dsk-post ]; then
    source ~/.zshrc-dev-dsk-post
fi










bindkey '^[f' forward-word
bindkey '^[b' backward-word
