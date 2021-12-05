call plug#begin('~/.vim/plugged')
	Plug 'airblade/vim-gitgutter'
	Plug 'dense-analysis/ale'
	Plug 'francoiscabrol/ranger.vim'
	Plug 'frazrepo/vim-rainbow'
	Plug 'iCyMind/NeoSolarized'
	Plug 'itchyny/lightline.vim' 
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'kshenoy/vim-signature'
	Plug 'liuchengxu/vim-which-key'
	Plug 'mattn/emmet-vim'
	Plug 'mhinz/vim-startify'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'norcalli/nvim-colorizer.lua'
	Plug 'rbgrouleff/bclose.vim'
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/nerdcommenter'
	Plug 'suan/vim-instant-markdown', {'rtp': 'after'}
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'
	Plug 'vim-syntastic/syntastic'
	Plug 'vimwiki/vimwiki'
call plug#end()

filetype plugin indent on
syntax on

set nocompatible

set noshowmode

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
let mapleader = " "
map <leader><space> :let @/=''<cr> " clear search

nnoremap j gj
nnoremap k gk

nnoremap gV `[V`]

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

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

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }


let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:instant_markdown_autostart = 0         " Turns off auto preview
let g:instant_markdown_browser = "surf"      " Uses surf for preview
map <Leader>md :InstantMarkdownPreview<CR>   " Previews .md file
map <Leader>ms :InstantMarkdownStop<CR>      " Kills the preview

nnoremap <Leader>b :ls<CR>:b<Space>

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-s><C-h> <C-w>h
nnoremap <C-s><C-j> <C-w>j
nnoremap <C-s><C-k> <C-w>k
nnoremap <C-s><C-l> <C-w>l

nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprev<CR>

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

source $HOME/.config/nvim/modules/which-key.vim

