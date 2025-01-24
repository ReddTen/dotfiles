# Create .zshrc
cat > shell/.zshrc << 'EOL'
# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source aliases
source ~/dotfiles/shell/aliases.zsh

# Plugins configuration
plugins=(
    git
    docker
    kubectl
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Load Powerlevel10k theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Load Powerlevel10k config
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
EOL

# Create aliases file
cat > shell/aliases.zsh << 'EOL'
# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

# Development aliases
alias mk='make'
alias mkc='make clean'
alias mka='make all'

# Navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
EOL
