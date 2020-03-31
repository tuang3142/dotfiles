# import auto suggestion history?
autoload -U promptinit; promptinit
prompt pure

# Path to arcanist
export PATH="$HOME/WWW/tools/arcanist/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/fcs/.oh-my-zsh"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

source ~/.profile # arcanist PATH
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
