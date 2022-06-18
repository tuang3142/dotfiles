call plug#begin(stdpath('data') . '/plugged')
Plug 'sainnhe/gruvbox-material'
Plug 'preservim/nerdtree'
Plug 'gruvbox-community/gruvbox'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'ishan9299/nvim-solarized-lua'
" Plug 'lunarvim/onedarker.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'edkolev/tmuxline.vim'
" Plug 'nvim-lualine/lualine.nvim'
Plug 'LunarVim/onedarker.nvim'
Plug 'itchyny/lightline.vim'
  let g:lightline = {
        \ 'colorscheme': 'gruvbox_material',
        \ }
" Plug 'neovim/nvim-lspconfig'
" Plug 'RRethy/nvim-base16'
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
Plug 'preservim/vimux'
Plug 'vim-test/vim-test'
  nmap <silent> tn :TestNearest<CR>
  nmap <silent> tf :TestFile<CR>
  nmap <silent> ts :TestSuite<CR>
  nmap <silent> tl :TestLast<CR>
  nmap <silent> tv :TestVisit<CR>
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
