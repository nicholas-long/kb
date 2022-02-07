" :source example-vimrc-bindings.vim <Enter>
" example macros
" let @q="yyp"

set number
set relativenumber
set noerrorbells

" source the file
nmap <Space>gs :source example-vimrc-bindings.vim <Enter>

" terminal normal mode escape for neovim
tmap <Esc> <C-\><C-N>

" movement in terminal
tmap <C-w>j <Esc><C-w>j
tmap <C-w>k <Esc><C-w>k
tmap <C-w>l <Esc><C-w>l
tmap <C-w>h <Esc><C-w>h

" exit insert mode with jj
imap jj <Esc>

" ctrl w p to paste in terminal
tmap <C-w>p <C-\><C-N>pi

" exit terminal
tmap <C-w><C-q> <C-\><C-N>:q!<Enter>
nmap <C-w><C-q> <C-\><C-N>:q!<Enter>

" leave terminal mode and go to normal mode
tmap ;; <Esc>

" split terminal from normal mode
nmap <Space>t :split<Enter> :term<Enter>i
nmap <Space>tg :vert split<Enter> :term<Enter>i
nmap <Space>g :vert split<Enter>

" split new terminals
tmap <C-w><Space>t <C-\><C-N>:split<Enter> :term<Enter>i
tmap <C-w><Space>g <C-\><C-N>:vert split<Enter> :term<Enter>i

"tmap <C-w><Space>e <C-\><C-N>:vert split<Enter> :term<Enter>i
"tmap <Space>tg :vert term<Enter>
"tmap <Space>tt :term<Enter>

" edit the current terminal line 
"nmap <C-w><Space>e yy:term <Enter>
tmap <C-w>e <C-\><C-N>yy:split<Enter><C-w>j:e cmdscratch<Enter>p

