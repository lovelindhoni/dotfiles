# aliases
alias sudo="sudo "
alias cd="z"
alias ls="eza"
alias pn="pnpm"
alias ..="cd .."
alias ~="cd ~"
alias n="nvim"
alias tx="tmux"
alias py="python"
alias rmf="rm -rf"
alias c="clear"
alias wezterm='flatpak run org.wezfurlong.wezterm'
alias zen="flatpak run app.zen_browser.zen"

# env
set -a
source ~/.zsh-utils/.secrets.env
set +a

export EDITOR='nvim'
export GIT_EDITOR='nvim'
export GIT_PAGER='bat'
# export CMAKE_GENERATOR='Ninja'
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.cargo/bin
export DIRENV_LOG_FORMAT=

# zsh history stuffs
HISTFILE=~/.zsh_history # location of the history file
export HISTFILESIZE=10000000 # history limit of the file on disk
export HISTSIZE=10000000 # current session's history limit
export SAVEHIST=500000 # zsh saves this many lines from the in-memory history list to the history file upon shell exit
setopt INC_APPEND_HISTORY # history file is updated immediately after a command is entered
setopt SHARE_HISTORY # allows multiple Zsh sessions to share the same command history 
setopt EXTENDED_HISTORY # records the time when each command was executed along with the command itself
setopt APPENDHISTORY # ensures that each command entered in the current session is appended to the history file immediately after execution'
export ZSH_FZF_HISTORY_SEARCH_EVENT_NUMBERS=0 export ZSH_FZF_HISTORY_SEARCH_DATES_IN_SEARCH=0
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
_evalcache direnv hook zsh
# bindkey '^I' autosuggest-accept

# zinit ice depth=1; zinit light romkatv/powerlevel10k
### End of Zinit's installer chunk

source "/home/lovelin/.zsh-utils/functions.zsh"

# if [ -z "$TMUX" ]; then
#   tmux new-session -A -s master
# fi
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
