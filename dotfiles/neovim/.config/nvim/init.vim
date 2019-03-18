set nocompatible

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



if (has("nvim"))
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set ttyfast " Faster terminal
endif
if (has("termguicolors"))
    set termguicolors
endif



" plug ------------------------------------------------------------------------
call plug#begin('~/vim/bundle')
  Plug 'mileszs/ack.vim'                  " awk
  Plug 'rking/ag.vim'                     " file searching
  Plug 'vim-airline/vim-airline'          " statusbar
  Plug 'ntpeters/vim-better-whitespace'   " better whitespace
  Plug 'moll/vim-bbye'                    " kill buffers without affecting window layout
  Plug 'kien/ctrlp.vim'                   " go-to-anything
  Plug 'tacahiroy/ctrlp-funky'            " extension for jumping to functions
  Plug 'jasoncodes/ctrlp-modified.vim'    " extension for listing git modified files
  Plug 'raimondi/delimitmate'             " autoclose delimiters
  Plug 'shougo/deoplete.nvim'             " simple autocomplete
  Plug 'othree/eregex.vim'                " better regexps
  Plug 'terryma/vim-expand-region'        " easily expand regions using scopes
  Plug 'tpope/vim-fugitive'               " git in vim
  Plug 'airblade/vim-gitgutter'           " visual git diffs in the gutter
  Plug 'szw/vim-maximizer'                " toggling maximizing of a buffer
  Plug 'joshskidmore/vim-monokai-phoenix' " monokai-phoenix colorscheme
  Plug 'scrooloose/nerdtree'              " file explorer sidebar
  Plug 'xuyuanp/nerdtree-git-plugin'      " nerdtree git support
  Plug 'vim-scripts/pickacolor.vim'       " color picker pop-up
  Plug 'sheerun/vim-polyglot'             " support for a variety of languages
  Plug 'airblade/vim-rooter'              " working directory == project root
  Plug 'justinmk/vim-sneak'               " 2-character search motions
  Plug 'tpope/vim-surround'               " manipulation of surrounding delimiters
  Plug 'andrewradev/switch.vim'           " switching between true/false, yes/no, etc
  Plug 'godlygeek/tabular'                " for aligning text
  Plug 'tomtom/tcomment_vim'              " comment out code with native comment syntax
  Plug 'vim-scripts/vis'                  " improved visual commands
  Plug 'thinca/vim-visualstar'            " smarter * and #
  Plug 'chrisbra/colorizer'               " highlight color codes
  Plug 'pseewald/vim-anyfold'             " non-shitty code folding
call plug#end()



" nvim plugin
  let g:python_host_prog='/usr/bin/python2'
  let g:python3_host_prog = '/usr/bin/python3'



" encoding --------------------------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary



" appearance ------------------------------------------------------------------
syntax on
set background=dark
set number
set cursorline
set showcmd
color monokai-phoenix
"set colorcolumn=80
hi Normal guibg=NONE ctermbg=NONE

" questionable appearance settings
set fillchars=vert:│
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+



" behavior --------------------------------------------------------------------
set autoread
set modeline
set mouse=a
set backspace=indent,eol,start
set fileformats+=mac
set hidden                      " allow buffer switching without saving
set lazyredraw                  " don't update the screen too often
set noeol
set visualbell
set titlestring=%f%m            " show buffer name in tmux
set title

" word boundaries
set iskeyword-=.
set iskeyword-=_
set iskeyword-=#

" switch to current file directory
autocmd BufEnter * silent! lcd %:p:h

" automatically close the popup menu
au InsertLEave * if pumvisible() == 0|silent! pclose|endif

" do syntax highlighting from start
au BufEnter * :syntax sync fromstart

" clipboard
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
else
  set clipboard=unnamed
endif

" remember cursor position
augroup vimrc-remember-cursor-position
  au!
  au BufWinEnter * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

  " Instead of reverting the cursor to the last position in the buffer, we
  " set it to the first line when editing a git commit message
  au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
augroup END



" movement --------------------------------------------------------------------
set nostartofline
set sidescrolloff=5
set incsearch                    " find as you type
set hlsearch                     " highlight search terms
set ignorecase                   " case insensitive search
set smartcase                    " case sensitive when uc present
set gdefault                     " global flag for substitute by default



" formatting ------------------------------------------------------------------
filetype plugin indent on
set autoindent
set expandtab
set shiftround
set shiftwidth=2 tabstop=2 softtabstop=2
set nowrap
set formatoptions=qrn1lr        " see :h fo-table

" turn off auto-commenting lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" strip tailing whitespace
function! <SID>StripTrailingWhitespaces()
  if &ft =~ 'vim'
    return
  endif
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()



" persistence -----------------------------------------------------------------
set nobackup
set nowritebackup
set noswapfile
if has('persistent_undo')
  set undodir=~/vim/tmp/undo
  set undolevels=500
  set undoreload=500
endif
set history=5000

" preserve buffer state (cursor location, folds, etc.)
set viewdir=~/.vim/tmp/views
set viewoptions=cursor,folds,unix,slash
augroup vimrc-persistence
  au!
  au BufWinLeave * if expand("%") != "" | silent! mkview | endif
  au BufWinEnter * if expand("%") != "" | silent! loadview | endif
augroup END



" plugins ---------------------------------------------------------------------
" deoplete
let g:deoplete#enable_at_startup = 1
" rebind deoplete up/down
inoremap <expr><c-k> pumvisible() ? "\<c-p>" : "\<c-k>"
inoremap <expr><c-j> pumvisible() ? "\<c-n>" : "\<c-j>"

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'

" vim-maximizer
let g:maximizer_set_default_mapping = 0
nnoremap <silent> <C-w>o :<C-u>MaximizerToggle!<CR>

" tcomment_vim
let g:tcomment_types = {'blade': '{-- %s --}', 'twig': '{# %s #}'}


" NERDTree
let NERDTreeChDirMode = 2
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\~$', '\.swo$', '\.swp$', '\.git$', '\.hg', '\.svn', '\.bzr', '\.settings', '\.project', '\.DS_Store']

" ctrlp
if executable('ag')
  let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
else
  let s:ctrlp_fallback = 'find %s -type f'
endif
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
let g:ctrlp_extensions = ['tag', 'buffertag', 'funky']
let g:ctrlp_cache_dir = "~/.vim/tmp/ctrlp"
let g:ctrlp_match_window = 'bottom,order:btt,min:10,max:10,results:10'
let g:ctrlp_custom_ignore = {
      \   'dir':  '\.(git|hg|svn|settings)$|tmp$',
      \   'file': '\.(exe|so|dll|sass-cache|classpaths|project|cache|jpg|png|gif|swf)$'
      \ }
let g:ctrlp_user_command = {
      \   'types': {
      \     1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
      \     2: ['.hg', 'hg --cwd %s locate -I .'],
      \   },
      \   'fallback': s:ctrlp_fallback
      \ }



" keybindings -----------------------------------------------------------------
" remap leader to space bar
let mapleader = "\<Space>"

" set paste toggle to F2
set pastetoggle=<F2>

" normalize all the navigation keys to move by row/col despite any wrapped text
noremap j gj
noremap k gk

" don't yank empty line
nnoremap <expr> dd match(getline('.'), '^\s*$') == -1 ? 'dd' : '"_dd'

" jump to beginning of line
nnoremap H ^
vnoremap H ^

"jump to end of line
nnoremap L g_
vnoremap L g_

" make Y act consistant with C and D
nnoremap Y y$

" do't leave visual mode after indenting
vnoremap < <gv
vnoremap > >gv

" turn off search highlighting
noremap <silent> <leader>? :nohlsearch<CR>

nnoremap <silent> <leader>; :CtrlPFunky<CR>
nnoremap <silent> <leader>fm :CtrlPModified<CR>
nnoremap <silent> <leader>] :CtrlPBufTag<CR>
nnoremap <silent> <leader>} :CtrlPBufTagAll<CR>

" nerdtree
map <localleader>\ :NERDTree <C-r>=FindRootDirectory()<CR><CR>
map <localleader>. :NERDTreeFind<CR>



" emacs-like ------------------------------------------------------------------
noremap <silent> <leader><Tab> :b#<CR>

" project
nnoremap <silent> <leader>pr :CtrlPMRU<CR>
nnoremap <silent><expr> <leader>pf getcwd() != $HOME ? ":<C-u>CtrlP<CR>" : ":<C-u>echoe 'Cannot open CtrlP in HOME'<CR>"
nnoremap <silent> <leader>pt :NERDTreeToggle <C-r>=FindRootDirectory()<CR><CR>

" file
nnoremap <silent> <leader>ff :CtrlPCurFile<CR>
nnoremap <silent> <leader>fs :w<CR>
nnoremap <silent> <leader>ft :NERDTreeToggle<CR>

" buffer
nnoremap <silent> <leader>bb :CtrlPBuffer<CR>

" editing
nnoremap <C-l> zz

" window
nnoremap <silent> <leader>wm :<C-u>MaximizerToggle!<CR>
nnoremap <silent> <leader>wh :wincmd h<CR>
nnoremap <silent> <leader>wj :wincmd j<CR>
nnoremap <silent> <leader>wk :wincmd k<CR>
nnoremap <silent> <leader>wl :wincmd l<CR>
nnoremap <silent> <leader>w- :split<CR>
nnoremap <silent> <leader>w/ :vsplit<CR>
nnoremap <silent> <leader>wd :close<CR>
noremap <silent> <leader>/ :Ag

" WrapOn
function! WrapOn()
  set wrap
  set linebreak
endfunction

command! WrapOn call WrapOn()

" WrapOff
function! WrapOff()
  set nowrap
  set nolinebreak
endfunction

command! WrapOff call WrapOff()

" Tabify
function! Tabify()
  set noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
  %retab!
endfunction

command! Tabify call Tabify()

" Spaceify
function! Spaceify()
  set expandtab shiftwidth=2 tabstop=2 softtabstop=2
  %retab!
endfunction

command! Spaceify call Spaceify()

" WW (acts like `ww`, but with sudo)
command! WW w !sudo tee % >/dev/null

" anyfold
set foldlevel=99
autocmd BufEnter * AnyFoldActivate

" don't fold large files
let g:LargeFile = 500000
autocmd BufReadPre,BufRead * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
function LargeFile()
  augroup anyfold
    autocmd!
    autocmd BufEnter * setlocal foldmethod=indent
  augroup END
endfunction

" toggle folding
nnoremap <C-Space> za

" vim:set ft=vim: