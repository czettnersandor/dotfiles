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

#bindkey "\e[1~" beginning-of-line # Home
#bindkey "\e[4~" end-of-line # End
#bindkey "\e[5~" beginning-of-history # PageUp
#bindkey "\e[6~" end-of-history # PageDown
#bindkey "\e[2~" quoted-insert # Ins
#bindkey "\e[3~" delete-char # Del
#bindkey "\e[5C" forward-word
#bindkey "\eOc" emacs-forward-word
#bindkey "\e[5D" backward-word
#bindkey "\eOd" emacs-backward-word
#bindkey "\e\e[C" forward-word
#bindkey "\e\e[D" backward-word
#bindkey "\e[Z" reverse-menu-complete # Shift+Tab
# for rxvt
#bindkey "\e[7~" beginning-of-line # Home
#bindkey "\e[8~" end-of-line # End
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
#bindkey "\eOH" beginning-of-line
#bindkey "\eOF" end-of-line
# for freebsd console
#bindkey "\e[H" beginning-of-line
#bindkey "\e[F" end-of-line

#PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%1~ %{$reset_color%}%# "
#PROMPT="%{${fg[cyan]}%}%B%~%b$(prompt_git_info)%{${fg[default]}%} "
PROMPT=$'%{${fg[cyan]}%}%B%~%b$(prompt_git_info)%{${fg[default]}%}\n$ '
RPROMPT="%(?..%{$fg[red]%}%? ↵%{$fg[default]%})"

#PROMPT="%c$(prompt_git_info) %% "
export EDITOR="vim"

# command alias
alias ls='ls -F --color=auto' 
alias ll='ls -lh'
alias grep='grep --color=auto'
alias node='nodejs'

PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ssh-add ~/.ssh/id_rsa &> /dev/null

# TMUX
if which tmux 2>&1 >/dev/null; then
   #if not inside a tmux session, and if no session is started, start a new session
   test -z "$TMUX" && (tmux attach || tmux new-session)
fi

