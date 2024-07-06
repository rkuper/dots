###################################
#                                 #
#            ZSH Setup            #
#                                 #
###################################


###################################
#        Environment Setup        #
###################################

# Standard ZSH setup for history
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
autoload -Uz compinit
compinit

# Adjust prompt and directory colors
autoload -U colors && colors
export PS1="[%{$fg[cyan]%}%m%{$reset_color%}:%{$fg[yellow]%}%3~%{$reset_color%}]$ "
# For Bash: export PS1=\
#   \[\e[37m\][\[\e[m\]\[\e[36m\]\h\[\e[m\]\[\e[37m\]:\[\e[33m\]\w\[\e[m\]\[\e[37m\]]\[\e[m\]\[\e[37m\]\\$\[\e[m\] "
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

# Setup for environment variables
export PATH="$PATH:/home/$USER/.local/bin"



###################################
#             Aliases             #
###################################

alias q='exit'
alias h='history'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -la'
alias grep='grep --color=auto'
alias diff='diff -C 1'
alias c='clear'
alias v='vim "+autocmd VimEnter * NERDTree" "+autocmd VimEnter * Tagbar" -p'
alias tas='tmux attach-session -t'
alias tl='tmux ls'
alias p3='python3'
alias sc='source ~/.zshrc'
alias pdf='xdg-open'
alias cpc='sudo sysctl vm.drop_caches=1'
alias f="~/.local/bin/fzf --preview 'batcat --theme=Nord --color=always --style=numbers --line-range=:500 {}' \
        --margin 10% --border rounded \
        --color=fg:#e5e9f0,bg:#2e3440,hl:#81a1c1 --color=fg+:#e5e9f0,bg+:#2e3440,hl+:#81a1c1 \
        --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b \
        --bind 'enter:become(vim \"+autocmd VimEnter * NERDTree\" \"+autocmd VimEnter * Tagbar\" {})'"
alias fzf="~/.local/bin/fzf --preview 'batcat --theme=Nord --color=always --style=numbers --line-range=:500 {}' \
          --margin 10% --border rounded \
          --color=fg:#e5e9f0,bg:#2e3440,hl:#81a1c1 --color=fg+:#e5e9f0,bg+:#2e3440,hl+:#81a1c1 \
          --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b"
alias wave='/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=gtkwave io.github.gtkwave.GTKWave -f'
alias ver='rm -rf objs; verilator --timing --main --trace --sv -cc --Mdir ./objs'
alias lg='~/.local/bin/lazygit'



###################################
#           Key Bindings          #
###################################

case "${TERM}" in
  cons25*|linux) # plain BSD/Linux console
    bindkey '\e[H'    beginning-of-line   # home
    bindkey '\e[F'    end-of-line         # end
    bindkey '\e[5~'   delete-char         # delete
    bindkey '[D'      emacs-backward-word # esc left
    bindkey '[C'      emacs-forward-word  # esc right
    ;;
  *rxvt*) # rxvt derivatives
    bindkey '\e[3~'   delete-char         # delete
    bindkey '\eOc'    forward-word        # ctrl right
    bindkey '\eOd'    backward-word       # ctrl left
    # workaround for screen + urxvt
    bindkey '\e[7~'   beginning-of-line   # home
    bindkey '\e[8~'   end-of-line         # end
    bindkey '^[[1~'   beginning-of-line   # home
    bindkey '^[[4~'   end-of-line         # end
    ;;
  *xterm*) # xterm derivatives
    bindkey '\e[H'    beginning-of-line   # home
    bindkey '\e[F'    end-of-line         # end
    bindkey '\e[3~'   delete-char         # delete
    bindkey '\e[1;5C' forward-word        # ctrl right
    bindkey '\e[1;5D' backward-word       # ctrl left
    # workaround for screen + xterm
    bindkey '\e[1~'   beginning-of-line   # home
    bindkey '\e[4~'   end-of-line         # end
    ;;
  screen)
    bindkey '^[[1~'   beginning-of-line   # home
    bindkey '^[[4~'   end-of-line         # end
    bindkey '\e[3~'   delete-char         # delete
    bindkey '\eOc'    forward-word        # ctrl right
    bindkey '\eOd'    backward-word       # ctrl left
    bindkey '^[[1;5C' forward-word        # ctrl right
    bindkey '^[[1;5D' backward-word       # ctrl left
    ;;
esac



###################################
#      New/Modified Commands      #
###################################

# Easy verilator command that simulates and opens gtkwave of a module testbench
# Argument 0: the top module of design
# Argument 1: File contaning all files used within the design
veri() {
  top_mod="$1"
  file="$2"
  files=()

  while IFS= read -r line; do
    files+=("$line")
  done < ${file}

  if [ -d "objs" ]; then
    rm -rf objs
  fi

  echo "verilator --timing --main --trace --sv -cc --Mdir ./objs --top ${top_mod} --exe ${files}"
  verilator --timing --main --trace --sv -cc --Mdir ./objs --top ${top_mod} --exe ${files} 2> veri.log

  errors=$(cat veri.log | grep -c "Error")
  if [ $errors -eq 0 ]; then
    if [ -d "objs" ]; then
      cd objs
      make -f V${top_mod}.mk
      if [ -e "V${top_mod}" ]; then
        ./V${top_mod}
        cd ..
        if [ -e "objs/waves.vcd" ]; then
          wave objs/waves.vcd &
        else
          echo "[FAILED] no generated waves"
        fi
      else
        echo "[FAILED] compiling C++ files"
      fi
    else
      echo "[FAILED] compiling Verilog files with sources : ${sources}"
    fi
  else
    if [ -d "objs" ]; then
      rm -rf objs
    fi
    cat veri.log
    rm veri.log
  fi
}

# Print out directory contents when changing to the directory
cd()
{
  builtin cd $@
  ls
}



###################################
#         Plugin Support          #
###################################

# Add fzf support
source <(~/.local/bin/fzf --zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Create antigen file through: curl -L git.io/antigen > antigen.zsh
source ~/antigen.zsh

plugins={dirhistory}

# antigen bundle desyncr/auto-ls
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-autocomplete
antigen apply
