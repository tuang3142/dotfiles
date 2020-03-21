" TODO: suggestion (auto complete) or intelisence, csv, vimcmd,
" remap c-w and
" contrinbute to gruvbox airline
" what is mapping, ignomap? silence?

" plug
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  let g:airline_theme='gruvbox' " [minimalism, gruvbox]
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_close_button = 0
  let g:airline#extensions#tabline#tabs_label = 'τ'
  let g:airline#extensions#tabline#buffers_label = 'β'
  let g:airline#extensions#show_buffer_count = 0
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  let g:airline_section_y = 0 " hide file encoding (might change in the future)
  let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab number
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
  let g:gruvbox_underline = 1
  let g:gruvbox_invert_selection = 0
  " let g:gruvbox_italicize_comments = 1 currently not working
Plug 'Yggdroot/indentLine'
  let g:indentLine_char_list = ['|', '¦', '┆', '┊']
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'wakatime/vim-wakatime'
Plug 'slim-template/vim-slim'
call plug#end()
" end plug

" use Vim settings rather than Vi
set nocompatible

" enable filetype plugins
filetype plugin on

" enable color
syntax enable

" highline current line
set cursorline

set number

set autoindent

set tabstop=2

set softtabstop=2

set expandtab

set shiftwidth=2
set ruler

" show incomplete commands
set showcmd

" <\+l> to toggle highlight.
let hlstate=0
nnoremap <C-l> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=(hlstate+1)%2<cr>
"nnoremap <C-<> :tabnew ~/.vim/vimrc<cr>
"nnoremap <C-s> :w need to change to double esc

set ignorecase
set hlsearch
set incsearch

" be smart when using tabs ;)
set smarttab

" set list
set listchars=tab:>¬∑,trail:~,extends:>,precedes:<,space:.

" suggestion for fills
set wildmenu

 " number of screenlines to keep above/below the cursor
set scrolloff=3

" open NERD tree
map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :FZF<cr>

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
if (has('termguicolors'))
  set termguicolors
endif

set background=dark
colorscheme gruvbox

