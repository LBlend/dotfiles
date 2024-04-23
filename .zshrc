export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh
plugins=(
  zsh-autosuggestions
)


if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
  export VISUAL='nvim'
else
  export EDITOR='vim'
  export VISUAL='vim'
fi


alias ll="exa -lahg --git --group-directories-first -F"
alias vpnon="wg-quick up wg0"
alias vpnoff="wg-quick down wg0"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gs="git status"
alias dl="cd ~/Downloads"
alias d="cd ~/Documents"
alias open="xdg-open"
alias grep="rg --color=auto"
alias find="fd"
alias ff="fastfetch"
alias bat="batcat"
alias cat="batcat --paging=never"
alias ydl="yt-dlp --all-subs --embed-subs --embed-thumbnail --embed-chapters"


HIST_STAMPS="yyyy-mm-dd"
export histcontrol=ignoreboth


eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GOPATH="$HOME/.go"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
