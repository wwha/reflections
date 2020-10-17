
" Basic VIM Setup
""""""""""""""""""""""""""""""""""""""""""


" Set how many lines of history VIM remembers
set history=500


" Warning if the file is changed while editing
set autoread

""""""""""""""""""""""""""""""""""""""""""
" VIM user infterface
""""""""""""""""""""""""""""""""""""""""""
" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.DS_Store 
" Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" Enable smart case when searching
set smartcase

" Highlight search results
set hlsearch

" Make search act like search in modern browers
set incsearch

" Do not redraw while executing macros
set lazyredraw

" Turn on magic for regular expressions
set magic

" Show matching brackets
set showmatch

" Add a bit extra margin to the left
set foldcolumn=1

""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""

"Enable syntax highlights
syntax enable

" Set utf-8 as encoding
set encoding=utf8

" Enable spell check
"set spell spelllang=en_us

""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent
""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" Set 1 tab to 4 spaces
set shiftwidth=4
set tabstop=4

" Set text width
set textwidth=80

" Linebreak on 500 characters
set lbr
set tw=500

" Auto indent
set ai

" Smart indent
set si

" Wrap lines
set wrap

" Always show the status line
set laststatus=2 

" Set nocompatible with VI
set nocompatible

" Disable backup, swap
set nobackup
set noswapfile

" Auto switch current dir
set autochdir


""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""

" Functions for creating python scripts title
func Setpytitle()
call setline(1, "\#!/usr/bin/python")
call setline(2, "\# -*- encoding=utf8 -*-")
call setline(3, "\"\"\"")
call setline(4, "\# @Created Time : ".strftime("%m-%d-%Y"))
call setline(5, "\# @Description : ")
call setline(6, "\"\"\"")
normal G
normal o
normal o
endfunc
autocmd bufnewfile *.py call Setpytitle()

" Functions for createing c code title
func Setctitle()
call setline(1, "/* main.c */")
call setline(2, "/* copyright/licensing */")
call setline(3, "/* includes */")
call setline(4, "/* defines */")
call setline(5, "/* external declarations */")
call setline(6, "/* typedefs */")
call setline(7, "/* global variable declarations */")
call setline(8, "/* function prototypes */")
call setline(9, "#include<stdio.h>")
call setline(10, "\int main(int argc, char *argv[]) {")
call setline(11, "\}")
normal G
normal o
normal o
endfunc
autocmd bufnewfile *.c call Setctitle()
