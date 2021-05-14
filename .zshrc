# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors && colors
# export PS1="\[\e[37m\][\[\e[m\]\[\e[36m\]\u\[\e[m\]\[\e[37m\]:\[\e[33m\]\w\[\e[m\]\[\e[37m\]]\[\e[m\]\[\e[37m\]\\$\[\e[m\] "
export PS1="[%{$fg[cyan]%}%n%{$reset_color%}:%{$fg[yellow]%}%~%{$reset_color%}]$ "

alias q='exit'
alias h='history'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -la'
alias grep='grep --color=auto -n'
alias diff='diff -C 1'
alias c='clear'
alias v='vim -p'
alias tas='tmux attach-session -t'
alias tl='tmux ls'
alias p3='python3'

cd()
{
  builtin cd $@
  ls
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Autocomplete
# source ~/zsh-autocomplete.plugin.zsh

# curl -L git.io/antigen > antigen.zsh
source ~/antigen.zsh

# antigen bundle desyncr/auto-ls
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-autocomplete

antigen apply
