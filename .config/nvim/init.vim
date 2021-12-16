runtime ./plugins/*.vim

filetype plugin indent on
syntax on

set nocompatible

set noshowmode


set nowrap
set ruler
set number
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

" Status line
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

" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:instant_markdown_autostart = 0         " Turns off auto preview
let g:instant_markdown_browser = "surf"      " Uses surf for preview
map <Leader>md :InstantMarkdownPreview<CR>   " Previews .md file
map <Leader>ms :InstantMarkdownStop<CR>      " Kills the preview


" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1

" LSP configuration
set completeopt=menu,menuone,noselect
lua require('lsp')

" Telescope configuration
lua require('telescope-config')

lua require('autopairs')

" Themes
set termguicolors
set background=dark
runtime ./themes/nord.vim
"runtime ./themes/solarized.vim

" ===========================================================
" Description: Keymaps
" ===========================================================

nnoremap <SPACE> <Nop>
let mapleader=' ' 
"let mapleader=',' 

" WhichKey
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Disable Q ex mode
nnoremap <silent> Q <nop>

nnoremap <leader>u :UndotreeShow<CR>


map <leader><space> :let @/=''<cr> " clear search

nnoremap <S-C-p> "0p
" Delete without yank
nnoremap <leader>d "_d
nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" List buffers
nnoremap <Leader>b :ls<CR>:b<Space>

" Delete a word backwards
nnoremap dw vb"_d

" Select all
nmap <C-a> gg<S-v>G

" Save with root permission
command! W w !sudo tee > /dev/null %

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Tabs and Buffers ==========================================

nmap <leader>te :tabedit 
"nmap <silent><leader>tj :tabnext<CR>
"nmap <silent><leader>tk :tabprev<CR>
nmap <silent><leader>l :tabnext<CR>
nmap <silent><leader>h :tabprev<CR>
nmap <silent><Tab> :tabnext<CR>
nmap <silent><S-Tab> :tabprev<CR>
nmap <silent><leader>bj :bNext<CR>
nmap <silent><leader>bk :bPrev<CR>

" Windows ===================================================

" Split window
" Split horizontal
nmap <leader>ss :split<Return><C-w>w
" Split vertical
nmap <leader>sv :vsplit<Return><C-w>w

" Move window
" Move to split on the left
map sh <C-w>h
" Move to split on the below
map sj <C-w>j
" Move to split on the above
map sk <C-w>k
" Move to split on the right
map sl <C-w>l

" Resize window
" Increase split's width
nnoremap <C-w><C-h> <C-w>5>
" Increase split's height
nnoremap <C-w><C-j> <C-w>5+
" Decrease split's height
nnoremap <C-w><C-k> <C-w>5-
" Decrease split's width
nnoremap <C-w><C-l> <C-w>5<
nnoremap <Leader>rp :resize 100<CR>

nnoremap <C-k> :cnext<CR>zz
nnoremap <C-j> :cprev<CR>zz
nnoremap <leader>k :lnext<CR>zz
nnoremap <leader>j :lprev<CR>zz

" Better wrapped navigation
nnoremap j gj
nnoremap k gk

" Move lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap Y y$

" Keep center line
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mxJ`z

" Undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'

nnoremap gV `[V`]

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>

" numberline controls
nmap <C-N><C-N> :set number!<CR>
nmap <C-M><C-M> :set relativenumber!<CR>

nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

nnoremap <leader>r :RnvimrToggle<CR>

let g:gitgutter_map_keys = 0
nmap <leader>gp :GitGutterPreviewHunk<CR>
nmap <leader>gu :GitGutterUndoHunk<CR>
nmap <leader>gs :GitGutterStageHunk<CR>
