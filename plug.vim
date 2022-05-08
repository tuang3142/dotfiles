call plug#begin(stdpath('data') . '/plugged')

Plug 'hoob3rt/lualine.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'neovim/nvim-lspconfig'
" Plug 'skwp/greplace.vim'
Plug 'gruvbox-community/gruvbox'
  let g:gruvbox_contrast_dark='hard'
Plug 'preservim/nerdtree'
  let NERDTreeShowLineNumbers=1
  let g:NERDTreeDirArrowExpandable = ''
  let g:NERDTreeDirArrowCollapsible = ''
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
  let g:fzf_preview_window = ['right:40%']
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-cucumber'
" Plug 'tpope/vim-endwise'
" Plug 'vim-test/vim-test'
" Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
  let g:tmux_navigator_no_mappings = 1
  " write all buffers before navigating from Vim to tmux pane
  let g:tmux_navigator_save_on_switch = 2
  " disable tmux navigator when zooming the Vim pane
  let g:tmux_navigator_disable_when_zoomed = 1
Plug 'https://github.com/edkolev/tmuxline.vim'

call plug#end()
