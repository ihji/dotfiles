set nocompatible
filetype on " workaround for OSX vim bug
filetype off

" settings
filetype plugin indent on
syntax on
set nu
set hls
set ai
set si
set ts=4
set sw=4
set expandtab
"set bg=dark
set wildmode=longest:full
set wildmenu
set guifont=Menlo:h12

" mapping to make movements operate on 1 screen line in wrap mode 
function! ScreenMovement(movement) 
    if &wrap
        return "g" . a:movement
    else
        return a:movement
    endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")
