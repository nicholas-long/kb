# notes
  - tty is set to 999 by default? any command clears the screen

# ex commands
### Some of these might apply to ed as well

> 1z  
print from line 1 until tty height

> u
undo (undo stack in ex)

> =
current line number

> 2,$d
delete lines ranging from 2 to EOF

> 3 ls -al¬
`:s/ .*//`
> 3 ls¬
substitute with regex like sed

> :1z
>   1 text
>   2 text
>   3 ls¬
> :3c
> id; uname -a
> .
> :1z
>   1 text
>   2 text
>   3 id; uname -a¬
edit / change line buffer

>   3 id; uname -a¬
> :3!bash
> :3z
>   3 uid=1000(`... snip ...`)¬
>   4 Linux `... snip ...` GNU/Linux¬
pipe lines into the program and replace output like in vim.
pipe data send line or range of lines to stdin

> j
join referenced line or current line with next line.
> j!
join without spaces (ex does spaces, ed does not?)

> a
> text goes here. appending after current line.¬
> text
> .
append text lines ranging from 2 to EOF
