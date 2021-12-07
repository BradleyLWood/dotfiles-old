call plug#begin('~/.vim/plugged')
	Plug 'airblade/vim-gitgutter'
	Plug 'arcticicestudio/nord-vim'
	Plug 'dense-analysis/ale'
	Plug 'francoiscabrol/ranger.vim'
	Plug 'frazrepo/vim-rainbow'
	Plug 'lifepillar/vim-solarized8'
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

