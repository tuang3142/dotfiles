call plug#begin(stdpath('data') . '/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hoob3rt/lualine.nvim'
" Plug 'neovim/nvim-lspconfig'
Plug 'RRethy/nvim-base16'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'sevko/vim-nand2tetris-syntax'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'glepnir/lspsaga.nvim'
" Plug 'skwp/greplace.vim'
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-cucumber'
" Plug 'tpope/vim-endwise'
" Plug 'vim-test/vim-test'

call plug#end()
