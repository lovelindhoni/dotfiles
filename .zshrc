# aliases
alias dnf="dnf5"
alias stfu="shutdown now"
alias cd="z"
alias cat="bat"
alias ls="eza"
alias pn="pnpm"
alias ..="cd .."
alias ~="cd ~"
alias n="nvim"
alias tx="tmux"
alias l="ls"
alias py="python"
alias sync-music="rsync -avzP ~/Music/ vivo1820:storage/music/"
alias bharath="java"
alias bharathc="javac"
alias c="clear"

# env
export CC=clang
export CXX=clang++
export GIT_EDITOR='nvim'
export GIT_PAGER='bat'
export FZF_COMPLETION_TRIGGER='--'
export PATH=/home/lovelindhoni/Downloads/solana-release/bin:$PATH

# zsh history stuffs
HISTFILE=~/.zsh-utils/zsh_history # location of the history file
export HISTFILESIZE=10000000 # history limit of the file on disk
export HISTSIZE=10000000 # current session's history limit
export SAVEHIST=500000 # zsh saves this many lines from the in-memory history list to the history file upon shell exit
setopt INC_APPEND_HISTORY # history file is updated immediately after a command is entered
setopt SHARE_HISTORY # allows multiple Zsh sessions to share the same command history 
setopt EXTENDED_HISTORY # records the time when each command was executed along with the command itself
setopt APPENDHISTORY # ensures that each command entered in the current session is appended to the history file immediately after execution'
export ZSH_FZF_HISTORY_SEARCH_EVENT_NUMBERS=0
export ZSH_FZF_HISTORY_SEARCH_DATES_IN_SEARCH=0
export ZSH_FZF_HISTORY_SEARCH_REMOVE_DUPLICATES=0

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh
zinit light zsh-users/zsh-syntax-highlighting 
zinit light zsh-users/zsh-autosuggestions                 
zinit light chitoku-k/fzf-zsh-completions
zinit light mroth/evalcache
# Load starship theme
# line 1: `starship` binary as command, from github release
# line 2: starship setup at clone(create init.zsh, completion)
# line 3: pull behavior same as clone, source init.zsh
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship
_evalcache fzf --zsh
_evalcache zoxide init zsh

# zinit ice depth=1; zinit light romkatv/powerlevel10k
### End of Zinit's installer chunk

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lovelindhoni/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
    if [ -f "/home/lovelindhoni/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lovelindhoni/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lovelindhoni/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# sourcing
source "/home/lovelindhoni/.zsh-utils/functions.zsh"
source $HOME/.cargo/env

