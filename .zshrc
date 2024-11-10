# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# lazygit
alias lzg="lazygit"

# python
alias py="python"
alias pip="python -m pip"

# List
alias ls="eza"

# NVIM
alias vi="nvim"

# Directory
alias dot='f() { cd ~/.config/$1 };f'
alias self="cd ~/Desktop/self/"
alias work="cd ~/Desktop/work/"
alias uni="cd ~/Desktop/unideb/"

# Git
alias gs="git status"
alias gcl="git clone"
alias gco="git checkout"
alias gp="git pull"
alias gps="git push"
alias gst="git stash"
alias gl="git log"
alias gc="git commit"

# Shell config
alias shcf="nvim ~/.zshrc"
alias shsrc="source ~/.zshrc"

alias shadsv="pnpm dlx shadcn-svelte@latest add"
alias shad="pnpm dlx shadcn@latest add"

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# PLUGINS ZSH
# zsh-completions
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# CMD HISTORY
eval "$(atuin init zsh)"
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# LATEX + Zathura
export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"

export PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
export PATH="$(brew --prefix)/opt/python@3/libexec/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
