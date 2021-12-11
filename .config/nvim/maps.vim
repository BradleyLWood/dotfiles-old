" Description: Keymaps

nnoremap <SPACE> <Nop>
let mapleader=' ' 
"let mapleader=',' 

nnoremap / /\v
vnoremap / /\v
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

" Tabs ======================================================

" Open current directory
nmap te :tabedit 
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

" Windows ===================================================

" Split window
" Split horizontal
nmap ss :split<Return><C-w>w
" Split vertical
nmap sv :vsplit<Return><C-w>w

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
nmap <C-w><C-h> <C-w>5>
" Increase split's height
nmap <C-w><C-j> <C-w>5+
" Decrease split's height
nmap <C-w><C-k> <C-w>5-
" Decrease split's width
nmap <C-w><C-l> <C-w>5<

" Better wrapped navigation
nnoremap j gj
nnoremap k gk

nnoremap gV `[V`]

" numberline controls
nmap <C-N><C-N> :set number!<CR>
nmap <C-M><C-M> :set relativenumber!<CR>

nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

nnoremap <leader>r :RnvimrToggle<CR>
