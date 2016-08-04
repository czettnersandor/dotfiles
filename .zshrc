# TMUX
if which tmux 2>&1 >/dev/null; then
   #if not inside a tmux session, and if no session is started, start a new session
   test -z "$TMUX" && (tmux attach || tmux new-session)
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sandor/.zshrc'

autoload -Uz compinit
compinit
autoload -U colors
colors

# Autoload zsh functions.
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)
# Enable auto-execution of functions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
# Append git functions needed for prompt.
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'
# Allow for functions in the prompt.
setopt PROMPT_SUBST

# End of lines added by compinstall
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kpp]}" beginning-of-history # PageUp
bindkey "${terminfo[knp]}" end-of-history # PageDown
bindkey "${terminfo[kich1]}" quoted-insert # Ins
bindkey "${terminfo[kdch1]}" delete-char # Del
bindkey "^[[C" forward-word # [Ctrl-RightArrow] - move forward one word
bindkey "^[[D" backward-word # [Ctrl-LeftArrow] - move backward one word
# for rxvt
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
#bindkey "\eOH" beginning-of-line
#bindkey "\eOF" end-of-line
# for freebsd console
#bindkey "\e[H" beginning-of-line
#bindkey "\e[F" end-of-line

PROMPT=$'%{${fg[cyan]}%}%B%~%b$(prompt_git_info)%{${fg[default]}%}\n$ '
RPROMPT="%(?..%{$fg[red]%}%? ↵%{$fg[default]%})"

export EDITOR="vim"

# command alias
alias ls='ls -F --color=auto' 
alias ll='ls -lh'
alias drupal='drupal --ansi'
alias grep='grep --color=auto'
alias node='nodejs'

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/node_modules/.bin"
export MC_SKIN=$HOME/.mc/lib/mc-solarized/solarized.ini
eval "$(rbenv init -)"

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ssh-add ~/.ssh/id_rsa &> /dev/null

eval `dircolors $HOME/.config/dircolors`
