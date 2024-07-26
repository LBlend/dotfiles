### Env / home cleanup ###
# Default programs
export BROWSER=librewolf
export TERMINAL=alacritty
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
  export VISUAL='nvim'
else
  export EDITOR='vim'
  export VISUAL='vim'
fi
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
export PYENV_ROOT=$XDG_DATA_HOME/pyenv
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep/config
export RUFF_CACHE_DIR=$XDG_CACHE_HOME/ruff
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export STARSHIP_CONFIG="$XDG_CONFIG_HOME"/starship.toml
export STARSHIP_CACHE="$XDG_CACHE_HOME"/starship
export WAKATIME_HOME="$XDG_CONFIG_HOME/wakatime"
# Home cleanup - zsh
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION


### History ###
HISTFILE="$XDG_STATE_HOME"/zsh/history
HIST_STAMPS="yyyy-mm-dd"
export histcontrol=ignoreboth


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
alias ll="exa -lahg --git --group-directories-first -F"
alias open="xdg-open"
alias grep="rg --color=auto"
alias find="fd"
alias ff="fastfetch"
alias bat="bat"
alias cat="bat --paging=never"
alias ydl="yt-dlp --all-subs --embed-subs --embed-thumbnail --embed-chapters"
alias gdl="gallery-dl --cookies-from-browser firefox"
alias mirrorphone="scrcpy --video-codec=h265 -m1920 --max-fps=60 --no-audio -K"


### Load Programs ###
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(mise activate zsh)"


### Plugins ###
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.plugin.zsh
source /usr/share/zsh/plugins/zsh-auto-notify/auto-notify.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
