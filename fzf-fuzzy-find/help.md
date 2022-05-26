# fzf

## run with preview
--preview=bat

## install
```bash
sudo apt update && sudo apt install fzf

# for bat - preview
wget https://github.com/sharkdp/bat/releases/download/v0.19.0/bat_0.19.0_amd64.deb
sudo dpkg -i bat_0.19.0_amd64.deb
```

## Help
```
usage: fzf [options]

  Search
    -x, --extended        Extended-search mode
                          (enabled by default; +x or --no-extended to disable)
    -e, --exact           Enable Exact-match
    --algo=TYPE           Fuzzy matching algorithm: [v1|v2] (default: v2)
    -i                    Case-insensitive match (default: smart-case match)
    +i                    Case-sensitive match
    --literal             Do not normalize latin script letters before matching
    -n, --nth=N[,..]      Comma-separated list of field index expressions
                          for limiting search scope. Each can be a non-zero
                          integer or a range expression ([BEGIN]..[END]).
    --with-nth=N[,..]     Transform the presentation of each line using
                          field index expressions
    -d, --delimiter=STR   Field delimiter regex (default: AWK-style)
    +s, --no-sort         Do not sort the result
    --tac                 Reverse the order of the input
    --disabled            Do not perform search
    --tiebreak=CRI[,..]   Comma-separated list of sort criteria to apply
                          when the scores are tied [length|begin|end|index]
                          (default: length)

  Interface
    -m, --multi[=MAX]     Enable multi-select with tab/shift-tab
    --no-mouse            Disable mouse
    --bind=KEYBINDS       Custom key bindings. Refer to the man page.
    --cycle               Enable cyclic scroll
    --keep-right          Keep the right end of the line visible on overflow
    --scroll-off=LINES    Number of screen lines to keep above or below when
                          scrolling to the top or to the bottom (default: 0)
    --no-hscroll          Disable horizontal scroll
    --hscroll-off=COLS    Number of screen columns to keep to the right of the
                          highlighted substring (default: 10)
    --filepath-word       Make word-wise movements respect path separators
    --jump-labels=CHARS   Label characters for jump and jump-accept

  Layout
    --height=HEIGHT[%]    Display fzf window below the cursor with the given
                          height instead of using fullscreen
    --min-height=HEIGHT   Minimum height when --height is given in percent
                          (default: 10)
    --layout=LAYOUT       Choose layout: [default|reverse|reverse-list]
    --border[=STYLE]      Draw border around the finder
                          [rounded|sharp|horizontal|vertical|
                           top|bottom|left|right|none] (default: rounded)
    --margin=MARGIN       Screen margin (TRBL | TB,RL | T,RL,B | T,R,B,L)
    --padding=PADDING     Padding inside border (TRBL | TB,RL | T,RL,B | T,R,B,L)
    --info=STYLE          Finder info style [default|inline|hidden]
    --prompt=STR          Input prompt (default: '> ')
    --pointer=STR         Pointer to the current line (default: '>')
    --marker=STR          Multi-select marker (default: '>')
    --header=STR          String to print as header
    --header-lines=N      The first N lines of the input are treated as header
    --header-first        Print header before the prompt line

  Display
    --ansi                Enable processing of ANSI color codes
    --tabstop=SPACES      Number of spaces for a tab character (default: 8)
    --color=COLSPEC       Base scheme (dark|light|16|bw) and/or custom colors
    --no-bold             Do not use bold text

  History
    --history=FILE        History file
    --history-size=N      Maximum number of history entries (default: 1000)

  Preview
    --preview=COMMAND     Command to preview highlighted line ({})
    --preview-window=OPT  Preview window layout (default: right:50%)
                          [up|down|left|right][,SIZE[%]]
                          [,[no]wrap][,[no]cycle][,[no]follow][,[no]hidden]
                          [,border-BORDER_OPT]
                          [,+SCROLL[OFFSETS][/DENOM]][,~HEADER_LINES]
                          [,default]

  Scripting
    -q, --query=STR       Start the finder with the given query
    -1, --select-1        Automatically select the only match
    -0, --exit-0          Exit immediately when there's no match
    -f, --filter=STR      Filter mode. Do not start interactive finder.
    --print-query         Print query as the first line
    --expect=KEYS         Comma-separated list of keys to complete fzf
    --read0               Read input delimited by ASCII NUL characters
    --print0              Print output delimited by ASCII NUL characters
    --sync                Synchronous search for multi-staged filtering
    --version             Display version information and exit

  Environment variables
    FZF_DEFAULT_COMMAND   Default command to use when input is tty
    FZF_DEFAULT_OPTS      Default options
                          (e.g. '--layout=reverse --inline-info')

```
