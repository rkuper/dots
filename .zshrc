HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000

autoload -U colors && colors
export PS1="[%{$fg[cyan]%}%n%{$reset_color%}:%{$fg[yellow]%}%~%{$reset_color%}]$ "

alias q='exit'
alias h='history'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -la'
alias grep='grep --color=auto -n -C 2'
alias diff='diff -C 1'
alias c='clear'
alias v='vim -p'
alias tas='tmux attach-session -t'
alias tl='tmux ls'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
