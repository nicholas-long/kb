# zsh

## see default bindings for vim command and insert modes keybinds
```bash
bindkey -M vicmd
bindkey -M viins
```

## arrow key based history autocomplete browse
add to `.zshrc`
```bash
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
```

## stuff at bottom of zshrc
```
source $HOME/functions.sh
source $HOME/tmux-scripts/gruvbox.zsh-theme
source $HOME/tmux-scripts/agnoster.zsh-theme

zle -C hist-complete complete-word _generic
zstyle ':completion:hist-complete:*' completer _history
```
