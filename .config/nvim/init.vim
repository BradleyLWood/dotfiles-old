call plug#begin('~/.local/share/nvim/plugged')
Plug 'iCyMind/NeoSolarized'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'mattn/emmet-vim'
Plug 'vimwiki/vimwiki'
call plug#end()

filetype plugin indent on
syntax on

set nocompatible

set termguicolors
colorscheme NeoSolarized
set background=dark

set nowrap
set ruler
set number
set numberwidth=5
set cursorline
nmap <C-N><C-N> :set number!<CR>
nmap <C-M><C-M> :set relativenumber!<CR>

set visualbell

set encoding=utf-8

set tabstop=2
set shiftwidth=2
set softtabstop=2
set scrolloff=3
set backspace=indent,eol,start

set laststatus=2
set showmode
set showcmd

set wildmenu

nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
let mapleader = ","
map <leader><space> :let @/=''<cr> " clear search

nnoremap j gj
nnoremap k gk

nnoremap gV `[V`]

imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
