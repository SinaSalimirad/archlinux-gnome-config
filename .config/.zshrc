
# ~/.zshrc


# ----------------------------------------
# Auto Start Tmux
# ----------------------------------------

#if [[ -z "$TMUX" && -o interactive ]]; then
#    exec tmux
#fi


# ----------------------------------------
# BindKey
# ----------------------------------------

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word


# ----------------------------------------
# Completion
# ----------------------------------------

autoload -Uz compinit
compinit


# ----------------------------------------
# Aliases
# ----------------------------------------

alias ls='eza -la --color=auto'
alias grep='grep --color=auto'

alias reset-mirror="sudo reflector --verbose --sort rate -l 20 --save /etc/pacman.d/mirrorlist"


# ----------------------------------------
# Autosuggestions
# ----------------------------------------

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# ----------------------------------------
# Syntax Highlighting
# ----------------------------------------

# Disabled to preserve terminal text colors.
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# ----------------------------------------
# Starship
# ----------------------------------------

eval "$(starship init zsh)"


# ----------------------------------------
# FZF
# ----------------------------------------

source <(fzf --zsh)
