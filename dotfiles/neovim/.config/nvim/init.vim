" enable python support
let g:python_host_prog='/usr/bin/python'

" set encoding to utf-8
set encoding=utf-8

" load plugins using pathogen
execute pathogen#infect()

" turn syntax highlighting on
syntax on

" set indentation to default 4 spaces
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

" set color scheme to dracula
color molokai

" turn powerline fonts on for airline
let g:airline_powerline_fonts = 1

" turn off auto-commenting lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" set system clipboard default
set clipboard=unnamedplus

" turn on line numbers
set number

" highlight current line
set cursorline

" set paste toggle to F2
set pastetoggle=<F2>

" remap leader to space bar
let mapleader = "\<Space>"

" set history
set history=500

" restore position in previous files (unless git commit)
au BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
    \ execute("normal `\"") |
  \ endif

" L/H
map H ^     " Jump to beginning of line
map L $     " Jump to end of line

" toggle nerd tree
map <C-n> :NERDTreeToggle<CR>

" enable deoplete
let g:deoplete#enable_at_startup = 1

" rebind deoplete up/down
inoremap <expr><c-k> pumvisible() ? "\<c-p>" : "\<c-k>"
inoremap <expr><c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
