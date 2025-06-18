export ZSH="$HOME/.oh-my-zsh"

autoload -Uz compinit
compinit

# OH-MY-POSH
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/posh/theme.omp.json)"
fi

source <(kubectl completion zsh)

plugins=(
  git
  zsh-syntax-highlighting
  fast-syntax-highlighting
  # zsh-autocomplete
  zsh-autosuggestions
  you-should-use
)

source $ZSH/oh-my-zsh.sh

# lazygit
alias lzg="lazygit"

# List
alias ls="eza -l"

# SUPERFILE - FILE EXPLORER
alias fe="spf"

# Clear
alias cl="clear"

# NVIM
alias vi="nvim"

# Directory
alias dot='f() { cd ~/.config/$1 };f'
alias self="cd ~/Desktop/self/"
alias work="cd ~/Desktop/work/"
alias uni="cd ~/Desktop/unideb/"

# Shell config
alias shcf="nvim ~/.zshrc"
alias shsrc="source ~/.zshrc"

# PYTHON ENV
alias act="source .env/bin/activate"
alias deact="deactivate"
alias venv="pyenv exec python -m venv .env"
alias plocal="pyenv local"
alias pglobal="pyenv global"
alias pi="pyenv install"
alias freeze="pip freeze > requirements.txt"
alias requirement="pip install -r requirements.txt"

# SHAD
alias shad="pnpm dlx shadcn@latest add"

# DOTNET EF
alias mia="dotnet ef migrations add"
alias miu="dotnet ef database update"
alias mid="dotnet ef database drop --force"

# PRISMA
alias prisma="npx prisma"

# K8s
alias k="kubectl --kubeconfig='./kubeconfig'"
alias ktoken="kubectl --kubeconfig=./kubeconfig -n kubernetes-dashboard create token admin-user"
alias kdb="kubectl --kubeconfig=./kubeconfig -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443"
alias t="talosctl"

# FASTAPI
alias fast='f() { 
  if [ -n "$1" ]; then
    fastapi dev "$1"
  else
    fastapi dev app/main.py
  fi
}; f'

gpush() {
  branch=$(git symbolic-ref --short HEAD)
  upstream=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)

  if [ -z "$upstream" ]; then
    echo "No upstream found for branch '$branch'. Setting upstream to origin/$branch."
    git push --set-upstream origin "$branch" "$@"
  else
    git push "$@"
  fi
}

alias gp='gpush'


# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# CMD HISTORY
eval "$(atuin init zsh)"
export PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"


# # pnpm
# export PNPM_HOME="/Users/olmaoster/Library/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# # pnpm end

## Add .NET Core SDK tools
export PATH="$PATH:/Users/olmaoster/.dotnet/tools"

