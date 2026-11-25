export ZSH="$HOME/.oh-my-zsh"

export PATH="/opt/homebrew/bin:$PATH"
export HOMEBREW_PREFIX="/opt/homebrew"

# source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-you-should-use/you-should-use.plugin.zsh
source $HOMEBREW_PREFIX/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# OH-MY-POSH
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/posh/theme.omp.json)"
fi

plugins=(git)

source $ZSH/oh-my-zsh.sh

# lazygit
alias lzg="lazygit"
# lazydocker
alias lzd='lazydocker'

# List
alias ls="eza -l"

# SUPERFILE - FILE EXPLORER
alias fe="yazi"

# Clear
alias cl="clear"

# Zoxide
alias cd="z"

# Claude
alias ai="claude"

# NVIM
alias vi="nvim"

# Directory
alias dot='f() { z ~/.config/$1 };f'
alias self="z ~/Desktop/self/"
alias work="z ~/Desktop/work/"

# Shell config
alias shcf="nvim ~/.zshrc"
alias shsrc="source ~/.zshrc"

# SHAD
alias shad="yarn dlx shadcn@latest add"

# DOTNET EF
# alias mia="dotnet ef migrations add"
# alias miu="dotnet ef database update"
# alias mid="dotnet ef database drop --force"

# PRISMA
alias prisma="npx prisma"

alias cdklocal="npx cdklocal"

# K8s
# alias k="kubectl --kubeconfig='./kubeconfig'"
# alias ktoken="kubectl --kubeconfig=./kubeconfig -n kubernetes-dashboard create token admin-user"
# alias kdb="kubectl --kubeconfig=./kubeconfig -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443"
# alias t="talosctl"

# AWS Localstack
alias awslocal="aws --endpoint-url=http://localhost:4566"

# FASTAPI
# alias fast='f() { 
#   if [ -n "$1" ]; then
#     fastapi dev "$1"
#   else
#     fastapi dev app/main.py
#   fi
# }; f'

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

# PYTHON ENV
# alias act="source .env/bin/activate"
# alias deact="deactivate"
# alias venv="pyenv exec python -m venv .env"
# alias plocal="pyenv local"
# alias pglobal="pyenv global"
# alias pi="pyenv install"
# alias freeze="pip freeze > requirements.txt"
# alias requirement="pip install -r requirements.txt"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion



# AUTOLOAD .NVMRC IF EXISTS
autoload -U add-zsh-hook
load-nvmrc() {
    local nvmrc_path="$(nvm_find_nvmrc)"
    if [ -n "$nvmrc_path" ]; then
        local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
        if [ "$nvmrc_node_version" = "N/A" ]; then
            nvm install
        elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
            nvm use
        fi
    elif [ "$(nvm version)" != "$(nvm version default)" ]; then
        nvm use default
    fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

eval "$(atuin init zsh)"

# Added by Antigravity
export PATH="/Users/ngoc.hai.dang.nguyen/.antigravity/antigravity/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# edit command line in neovim
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^v' edit-command-line # Press Ctrl-v to open the current line in Neovim
export EDITOR='nvim'

# pnpm
export PNPM_HOME='/Users/ngoc.hai.dang.nguyen/Library/pnpm'
case ":$PATH:" in
  ":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

# zoxide must be initialised last
eval "$(zoxide init zsh)"

# elive: el runs the repository's CLI (pnpm run cli)
alias el='/Users/ngoc.hai.dang.nguyen/Desktop/work/elive/elive/.elive/cli/el'
