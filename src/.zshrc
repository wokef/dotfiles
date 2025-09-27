plugins=(
    colored-man-pages
    colorize
    composer
    cp
    docker
    docker-compose
    common-aliases
    rand-quote
    fzf
    git
    laravel
    node
    nvm
    sudo
    themes
    zsh-autosuggestions
    zsh-syntax-highlighting
)

ZSH_THEME="robbyrussell"

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

export CL_OPTIONS='--color=auto'

alias ls='ls $CL_OPTIONS'
alias ll='ls $CL_OPTIONS -l'
alias l='ls $CL_OPTIONS -lav --group-directories-first'
alias ld='ls $CL_OPTIONS -lav | grep ^d'

alias vi='nvim'
alias svi='sudo nvim'
alias swapclear="sudo swapoff -a;sudo swapon -a"
alias home='cd ~'

alias g="lazygit"
alias d="lazydocker"

export EDITOR="nvim"

export PATH="${PATH}:${HOME}/.local/bin/"

export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"
alias tl='tmuxifier load-session'

# Include local configs
DIR="$(dirname $(readlink -f .zshrc))"
for config_file in $(find $DIR/local -name "*.sh" -type f); do
    [ -f $config_file ] && source $config_file
done

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
