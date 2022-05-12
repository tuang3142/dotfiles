call plug#begin(stdpath('data') . '/plugged')

Plug 'Shougo/defx.nvim'
Plug 'kdheepak/tabline.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hoob3rt/lualine.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'gruvbox-community/gruvbox'
  let g:gruvbox_contrast_dark='hard'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
  let g:fzf_preview_window = ['right:40%']

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'sevko/vim-nand2tetris-syntax'
Plug 'christoomey/vim-tmux-navigator'
  let g:tmux_navigator_no_mappings = 1
  let g:tmux_navigator_save_on_switch = 2
  let g:tmux_navigator_disable_when_zoomed = 1
" Plug 'glepnir/lspsaga.nvim'
" Plug 'skwp/greplace.vim'
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-cucumber'
" Plug 'tpope/vim-endwise'
" Plug 'vim-test/vim-test'

call plug#end()
