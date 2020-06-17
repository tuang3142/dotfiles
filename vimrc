" plug
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  let g:airline_theme='gruvbox'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_close_button = 0
  let g:airline#extensions#tabline#tabs_label = 'τ'
  let g:airline#extensions#tabline#buffers_label = 'β'
  let g:airline#extensions#show_buffer_count = 0
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  let g:airline_section_y = 0 " hide file encoding (might change in the future)
  let g:airline#extensions#tabline#show_tab_nr = 0 " disable tab number
Plug 'preservim/nerdtree'
  let NERDTreeShowLineNumbers=1
  let g:NERDTreeDirArrowExpandable = ''
  let g:NERDTreeDirArrowCollapsible = ''
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
  let g:gruvbox_contrast_dark = 'hard'
  let g:gruvbox_invert_selection = 0
  let g:gruvbox_bold=0
Plug 'Yggdroot/indentLine'
  let g:indentLine_char_list = ['|', '¦', '┆', '┊']
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'rking/ag.vim'
Plug 'slim-template/vim-slim'
Plug 'takac/vim-hardtime'
  let g:hardtime_default_on = 0
Plug 'tpope/vim-cucumber'
Plug 'nvie/vim-flake8'
Plug 'kchmck/vim-coffee-script'
call plug#end()
" end plug

" use Vim settings rather than Vi
set nocompatible
set autowrite     " Automatically :write before running commands
" enable filetype plugins
filetype plugin on

" enable color
syntax enable

" highline current line
" set cursorline

set number
set relativenumber
set autoindent

set tabstop=2

set softtabstop=2

set expandtab

set shiftwidth=2
set ruler

" show incomplete commands
set showcmd

" <\+l> to toggle highlight.
nnoremap <leader>l :set hlsearch! hlsearch?<cr>
nnoremap <leader>t :set relativenumber! relativenumber?<cr>
" ctrl+s to save
nnoremap <C-s> :w <cr>

" buffer switching
nnoremap <silent> <leader>q :bprevious<cr>
nnoremap <silent> <leader>w :bnext<cr>
" tab switching
nnoremap <silent> <S-w> :tabnext<cr>
nnoremap <silent> <S-q> :tabprevious<cr>
" split switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" " split rotate
" nnoremap <C-S-J> <C-W><S-i>
" nnoremap <C-S-K> <C-W><S-k>
" nnoremap <C-S-L> <C-W><S-l>
" nnoremap <C-S-H> <C-W><S-h>
set splitbelow
set splitright

" source vimrc
nnoremap <silent> <leader>r :source ~/tuang3142/dotfiles/vimrc<cr>
nnoremap <silent> <leader>e :tabnew ~/tuang3142/dotfiles/vimrc<cr>

set ignorecase
set hlsearch
set incsearch

" be smart when using tabs ;)
set smarttab

" suggestion for fills
set wildmenu
set wildmode=list:longest,full

" number of screenlines to keep above/below the cursor
set scrolloff=10

" open NERD tree
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>
nnoremap <silent> <leader>f :Files<cr>
nnoremap <silent> <leader>b :Buffers<cr>

" change shape of cursor bwt modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
" if (has('termguicolors'))
"   set termguicolors
" endif

" color scheme
set background=dark
set noequalalways
colorscheme gruvbox " vim-material, gruvbox
set t_Co=256

" render whitespace
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.
