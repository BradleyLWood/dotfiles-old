call plug#begin('~/.vim/plugged')

	" ===========================================================
	" Color Schemes =============================================
	Plug 'itchyny/lightline.vim' 
	Plug 'arcticicestudio/nord-vim'
	Plug 'lifepillar/vim-solarized8'

	" Git =======================================================
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'

	" LSP =======================================================
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	
	
	" Tools =====================================================
	Plug 'frazrepo/vim-rainbow'
	Plug 'dense-analysis/ale'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'kevinhwang91/rnvimr'
	Plug 'kshenoy/vim-signature'
	Plug 'liuchengxu/vim-which-key'
	Plug 'mattn/emmet-vim'
	Plug 'mbbill/undotree'
	Plug 'norcalli/nvim-colorizer.lua'
	Plug 'rbgrouleff/bclose.vim'
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/nerdcommenter'
	Plug 'suan/vim-instant-markdown', {'rtp': 'after'}
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'vim-syntastic/syntastic'
	Plug 'vimwiki/vimwiki'
call plug#end()
