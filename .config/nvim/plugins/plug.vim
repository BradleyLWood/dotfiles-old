call plug#begin('~/.vim/plugged')

	" Color Schemes =============================================
	Plug 'itchyny/lightline.vim' 
	"Plug 'arcticicestudio/nord-vim'
	Plug 'shaunsingh/nord.nvim'
	Plug 'lifepillar/vim-solarized8'
	Plug 'gruvbox-community/gruvbox'

	" Git =======================================================
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rhubarb'

	" LSP =======================================================
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'onsails/lspkind-nvim'

	Plug 'glepnir/lspsaga.nvim'

	" Telescope =================================================
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzy-native.nvim'

	" Treesitter=================================================
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-treesitter/playground'
	
	" Tools =====================================================
	Plug 'frazrepo/vim-rainbow'
	Plug 'dense-analysis/ale'
	Plug 'kevinhwang91/rnvimr'
	Plug 'kshenoy/vim-signature'
	Plug 'liuchengxu/vim-which-key'
	Plug 'mattn/emmet-vim'
	Plug 'mbbill/undotree'
	Plug 'norcalli/nvim-colorizer.lua'
	Plug 'rbgrouleff/bclose.vim'
	Plug 'sbdchd/neoformat'
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/nerdcommenter'
	Plug 'suan/vim-instant-markdown', {'rtp': 'after'}
	Plug 'ThePrimeagen/harpoon'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'vim-syntastic/syntastic'
	Plug 'vimwiki/vimwiki'
	Plug 'windwp/nvim-autopairs'

call plug#end()
