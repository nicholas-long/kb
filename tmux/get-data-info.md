# tmux

## get current pane
```bash
tmux list-panes | grep active | cut -d ']' -f 3 | awk '{print $1}'
pane=$(tmux list-panes | grep active | cut -d ']' -f 3 | awk '{print $1}')
```

### working directory
```bash
panepath=$(tmux display-message -t "$pane" -a | grep pane_current_path | cut -d '=' -f 2)
```
