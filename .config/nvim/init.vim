runtime ./maps.vim
runtime ./plug.vim
runtime ./which-key.vim

filetype plugin indent on
syntax on

set nocompatible

set noshowmode

set background=dark
set termguicolors
"colorscheme solarized8
colorscheme nord

set nowrap
set ruler
set relativenumber
set numberwidth=5
set cursorline

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

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

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
      \ 'colorscheme': 'nord',
      \ }


let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:instant_markdown_autostart = 0         " Turns off auto preview
let g:instant_markdown_browser = "surf"      " Uses surf for preview
map <Leader>md :InstantMarkdownPreview<CR>   " Previews .md file
map <Leader>ms :InstantMarkdownStop<CR>      " Kills the preview

nnoremap <Leader>b :ls<CR>:b<Space>

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1

