call pathogen#infect()

set nocompatible
set history=10000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set showcmd
let mapleader=","

syntax on
filetype plugin indent on
set t_Co=256  " 256 colors
set background=dark
colorscheme inkpot
hi CursorLine cterm=none ctermbg=236

" Freemarker highlighting
function! LoadHtmlFtl()
    set filetype=ftl
    unlet b:current_syntax
    runtime! syntax/html.vim
    let b:current_syntax="ftl"
endfunction
au BufNewFile,BufRead *.ftl call LoadHtmlFtl()

set incsearch
set hlsearch
set ignorecase smartcase
set cursorline

set wildmode=longest,list
set wildmenu
set wildignore=cache/** " for pegasus

set hidden

" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" tslime bindings
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

" Settings for VimClojure
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1

" Load current file into clojure repl
function! LoadFileIntoRepl()
    :w
    :call Send_to_Tmux("(load-file \"" . expand('%:p') . "\")\n")
endfunction
:map <leader>g :call LoadFileIntoRepl()<cr>

