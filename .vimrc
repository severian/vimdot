call pathogen#infect()

set nocompatible
set history=10000
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2
set showcmd
set nu
set ruler
set visualbell t_vb=
set autoread
let mapleader=","

syntax on
filetype plugin indent on
set background=dark
colorscheme solarized

" Freemarker highlighting
function! LoadHtmlFtl()
    set filetype=ftl
    unlet b:current_syntax
    runtime! syntax/html.vim
    let b:current_syntax="ftl"
endfunction
au BufNewFile,BufRead *.ftl call LoadHtmlFtl()

au BufNewFile,BufRead *.js.twig set filetype=javascript
au BufNewFile,BufRead *.thrift set filetype=thrift

function! SetupProto()
    set filetype=proto
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
endfunction
au BufNewFile,BufRead *.proto call SetupProto()

au BufNewFile,BufRead nginx*.conf set filetype=nginx

au BufNewFile,BufRead *.clj let g:auto_save = 1
let g:paredit_shortmaps = 1

set incsearch
set hlsearch
set ignorecase smartcase
set cursorline

set wildmode=longest,list
set wildmenu
set wildignore=out/**,*/target/** " for mekka

set hidden

" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map \ :noh<Cr>

