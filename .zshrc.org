# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
#export ZSH="$HOME/.oh-my-zsh"
#export ZSH="/home/user/.zplug/repos/robbyrussell/oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="candy"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)
#plugins=(
#	  git pip pyenv virtualenv
#	  #git pip pyenv virtualenv autojump
#  )
# User configuration

#export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"
#export PS1="%N %~ %# "
export PS1="[%D/%t] %~> "

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#setopt no_beep

#alias wh='cd C:\\Users\\hshimizu\\AppData\\Local\\Packages\\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\\LocalState\\rootfs\\home\\hshimizu'

# export FZF_DEFAULT_OPT=S"
# --height 90% --reverse --border
# --prompt='➜  ' --margin=0,1 --inline-info
# --tiebreak=index --no-mouse --filepath-word
# --color fg:-1,bg:-1,hl:33,fg+:250,bg+:235,hl+:33
# --color info:37,prompt:37,pointer:230,marker:230,spinner:37
# --bind='ctrl-w:backward-kill-word,ctrl-x:jump,down:preview-page-down'
# --bind='ctrl-z:ignore,ctrl-]:replace-query,up:preview-page-up'
# --bind='ctrl-a:toggle-all,?:toggle-preview'
# "

#alias git
alias g='git'
alias gg='git log --oneline --decorate --graph --branches --tags --remotes --all'

qp() {
    [[ -z "(" ]] && echo "Please enter a commit message:";
    typeset msg="$( [[ -n "(" ]] && echo "$*" || echo $(head -1) )";
    date;
    #git pull;
    git add .;
    git commit -m "$msg";
    git push;
    date
}

#alias py='python3'
alias py='bpython'
alias python='python'
alias bp='bpython'
alias zs='echo "source ~/.zshrc" && source ~/.zshrc'
alias zv='echo "vi ~/.zshrc" && vi ~/.zshrc'
alias l='ls -1A -G --color'
alias ls='ls -G --color'
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
alias sg='stack ghci'
alias lz='lazygit'

#alias vim='nvim'
alias vi='vim'
alias nv='nvim'
alias view='nvim -R'
alias ghci='TERM=dumb ghci'

alias zshconfig="vim ~/.zshrc"

# For windows python
alias wp='/mnt/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/Shared/Python39_64/python.exe'

#diff
#diff <(sort RPS-01-B6M25006F.csv|sed 's///g') <(sort g.txt|sed 's/^M//g') > diff.txt
function wmdiff(){
    #remove CRLF at each end of lines, sort and diff.
    diff -y <(sort $1 | sed 's///g') <(sort $2 | sed 's///g')
}
function wmdiff-supp(){
    #remove CRLF at each end of lines, sort and diff.
    diff -y -W 150 --suppress-common-lines <(sort $1 | sed 's///g') <(sort $2 | sed 's///g')
}
function wmdif-left(){
    diff -y -W 150 --left-column <(sort $1 | sed 's///g') <(sort $2 | sed 's///g')
}

function wm-gdiff(){
    diffwm <(git show origin:./$1 | sort ) <(git show HEAD:./$2 | sort)
}
#
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#[ -f "/Users/harveyshimizu/.ghcup/env" ] && source "/Users/harveyshimizu/.ghcup/env" # ghcup-env

## 補完機能の強化
## http://qiita.com/ToruIwashita/items/5cfa382e9ae2bd0502be
#autoload -Uz compinit && compinit -u
#zstyle ':completion:*' menu select interactive
#setopt menu_complete
#zmodload zsh/complist                                         # "bindkey -M menuselect"設定できるようにするためのモジュールロード
#bindkey -v '^i' expand-or-complete                            # 補完開始
#bindkey -M menuselect '^g' .send-break                        # send-break2回分の効果
#bindkey -M menuselect '^i' forward-char                       # 補完候補1つ右へ
#bindkey -M menuselect '^j' .accept-line                       # accept-line2回分の効果
#bindkey -M menuselect '^k' accept-and-infer-next-history      # 次の補完メニューを表示する
#bindkey -M menuselect '^n' down-line-or-history               # 補完候補1つ下へ
#bindkey -M menuselect '^p' up-line-or-history                 # 補完候補1つ上へ
#bindkey -M menuselect '^r' history-incremental-search-forward # 補完候補内インクリメンタルサーチ

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#source $ZSH/oh-my-zsh.sh
export DISPLAY=:0.0
export GOROOT=$HOME/tmp/go_src/go

# ディレクトリ名を入力するだけでcdできるようにする
# setopt auto_cd
alias ...='cd ../..'
alias ....='cd ../../..'
