# get current active pane in tmux
```bash
tmux list-panes | grep active | cut -d ']' -f 3 | awk '{print $1}'
```
