# notes
  - tty is set to 999 by default? any command clears the screen

# ex commands
### Some of these might apply to ed as well

print from line 1 until tty height
> 1z

undo (undo stack in ex)
> u

current line number
> =

delete lines ranging from 2 to EOF
> 2,$d

substitute with regex like sed
> 3 ls -al¬
`:s/ .*//`
> 3 ls¬

edit / change line buffer
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

pipe lines into the program and replace output like in vim.
pipe data send line or range of lines to stdin
>   3 id; uname -a¬
> :3!bash
> :3z
>   3 uid=1000(`... snip ...`)¬
>   4 Linux `... snip ...` GNU/Linux¬

join referenced line or current line with next line.
> j
join without spaces (ex does spaces, ed does not?)
> j!

append text lines ranging from 2 to EOF
> a
> text goes here. appending after current line.¬
> text
> .
