# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="xiong-chiamiov-plus"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

### Env / home cleanup ###
# Default programs
export BROWSER=librewolf
export TERMINAL=kitty
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
  export VISUAL='nvim'
else
  export EDITOR='vim'
  export VISUAL='vim'
fi
export MANPAGER='nvim +Man!'
# Home cleanup
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export DISCORD_USER_DATA_DIR="${XDG_DATA_HOME}"
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export FFMPEG_DATADIR="$XDG_CONFIG_HOME"/ffmpeg
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GPG_TTY=$(tty)
export GOPATH="$XDG_DATA_HOME"/go
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export NVM_DIR="$XDG_DATA_HOME"/nvm
#export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep/config
export RUFF_CACHE_DIR=$XDG_CACHE_HOME/ruff
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export STARSHIP_CONFIG="$XDG_CONFIG_HOME"/starship.toml
export STARSHIP_CACHE="$XDG_CACHE_HOME"/starship
export WAKATIME_HOME="$XDG_CONFIG_HOME/wakatime"

# Set-up icons for files/folders in terminal
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
### Aliases ###
# Git
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gs="git status"
# Wireguard
alias vpnon="wg-quick up wg0"
alias vpnoff="wg-quick down wg0"
# Navigation
alias dl="cd ~/Downloads"
alias d="cd ~/Documents"
# Misc
alias ll="eza -lahg --git --group-directories-first -F"
alias open="xdg-open"
alias grep="rg --color=auto"
alias find="fd"
alias du="dust"
alias df="duf"
alias bat="bat"
alias cat="bat --paging=never"
alias ff="fastfetch"
alias ydl="yt-dlp --all-subs --embed-subs --embed-thumbnail --embed-chapters --sponsorblock-remove all"
alias gdl="gallery-dl --cookies-from-browser firefox"
alias mirrorphone="scrcpy --video-codec=h265 -m1920 --max-fps=60 --no-audio -K"

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

### Load Programs ###
eval "$(zoxide init --cmd cd zsh)"

function restart-gpg() {
    echo "🔍 Checking for GPG lock files..."
    
    # Remove any existing lock files
    if [ -d ~/.gnupg ]; then
        find ~/.gnupg -name "*.lock" -delete 2>/dev/null
        rm -f ~/.gnupg/public-keys.d/pubring.db.lock 2>/dev/null
        echo "🗑️  Removed lock files"
    fi
    
    # Restart GPG agent
    echo "🔄 Restarting GPG agent..."
    gpgconf --reload gpg-agent
    
    # Test GPG
    echo "🧪 Testing GPG signing..."
    if echo "test" | gpg --clearsign > /dev/null 2>&1; then
        echo "✅ GPG is working properly now!"
    else
        echo "❌ GPG is still having issues. You may need manual intervention."
    fi
}

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
