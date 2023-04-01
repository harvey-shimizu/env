#!/bin/zsh

if [[ ! "$PATH" == */Users/harvey/src/potion/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/$HOME/src/potion/bin"
fi

if [[ -f ~/.nodebrew/nodebrew ]]; then
    export PATH=$HOME/.nodebrew/current/bin:$HOME/homebrew/bin:$PATH
    #nodebrew use v14.15.5
fi

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_DEF=$'%f'
COLOR_USR=$'%F{243}'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'
#export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '
export NEWLINE=$'\n'

export PATH=$HOME/homebrew/bin:$HOME/.local/bin:$PATH
export LSCOLORS="gxbxcxdxfxegedabagacad"
export GREP_COLOR="37;45"
export PYENV_SHELL="zsh"
export PYENV_VIRTUALENV_INIT="1"

#export PS1="%F{green}%D{%b/%d/%y(%a)}%f%F{yellow}%D{%R(%Z)}%f:[%F{cyan1}%~%f]${NEWLINE}%% "
#export PS1="%F{green}%D{%b/%d/%y(%a)}%f%F{yellow}%D{%R(%Z)}%f:[%F{cyan1}%~%f]${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}%% "
#export PROMPT="%F{green}%D{%b/%d/%y(%a)}%f%F{yellow}%D{%R(%Z)}%f:[%F{cyan1}%~%f]${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}%% "
#
# Load vcs information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
#COLOR_GIT=$'\e[38;5;39m'
COLOR_DEF=$'\e[0m'
#zstyle ':vcs_info:git:*' formats ${COLOR_GIT}'(%b)'${COLOR_DEF}

# Setup the prompt with git branch name
setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' check-for-changes true
#zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' stagedstr "%F{red}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
#zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' formats "%F{blue}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

#export PROMPT='%n@%m %F{green}%D{%b/%d/%y(%a)}%f%F{yellow}%D{%R(%Z)}%f:[%F{cyan1}%~%f]${vcs_info_msg_0_}${NEWLINE}%% '
export PROMPT='%F{green}%D{%b/%d/%y(%a)}%f%F{yellow}%D{%R(%Z)}%f:[%F{cyan1}%~%f]${vcs_info_msg_0_}${NEWLINE}%% '

#PROMPT='%n@%m in ${PWD/#$HOME/~} ${vcs_info_msg_0_} > '
#export PS1="%F{green}%D{%b/%d/%y(%a)}%f%F{yellow}%D{%R(%Z)}%f:[%F{cyan1}%~%f]${vcs_info_msg_0_}${NEWLINE}%% "

export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_OPTS='--preview "bat --color=always --style=header,grid --line-range :100 {}"'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!\.git/*"'
export FZF_DEFAULT_OPTS='--height 50% --reverse --inline-info --preview "bat --color=always --style=header,grid --line-range :100 {}"'

export NVM_DIR="$HOME/.nvm"
[ -s "/Users/harveyshimizu/homebrew/opt/nvm/nvm.sh" ] && \. "/Users/harveyshimizu/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/Users/harveyshimizu/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/Users/harveyshimizu/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# Tcl-tk
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"
export PYTHON_CONFIGURE_OPTS="--with-tcltk-includes='-I/usr/local/opt/tcl-tk/include' --with-tcltk-libs='-L/usr/local/opt/tcl-tk/lib -ltcl8.6 -ltk8.6'"

#alias py='python3'
alias py='bpython'
alias python='python3'
alias bp='bpython'
alias zs='echo "source ~/.zshrc" && source ~/.zshrc'
alias zv='echo "vi ~/.zshrc" && vi ~/.zshrc'
alias l='ls -1A -G'
alias ls='ls -G'
alias ll='ls -lh -G'
alias la='ll -A'
alias lc='lt -c'
alias lk='ll -Sr'
alias lm='la | "$PAGER"'
alias ln='nocorrect ln -i'
alias lni='nocorrect ln -i'
alias locate='noglob locate'
alias lr='ll -R'
alias lt='ll -tr'
alias lu='lt -u'
alias lx='ll -XB'
alias zs="source $HOME/.zshrc"
alias zv="vi $HOME/.zshrc"
alias vv="vi $HOME/.vimrc"
alias p='potion'
alias t='tmux'
alias g='TERM=dumb && ghci'
alias ghci='TERM=dumb && ghci'

#alias vim='nvim'
alias vi='vim'
alias nv='nvim'
alias view='nvim -R'

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias lzg='lazygit'
