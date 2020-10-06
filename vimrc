call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  let g:airline_theme='gruvbox'
  let g:airline_powerline_fonts = 1
  " let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_close_button = 0
  let g:airline#extensions#tabline#tabs_label = 'τ'
  let g:airline#extensions#tabline#buffers_label = 'β'
  let g:airline#extensions#show_buffer_count = 0
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  let g:airline_section_y = 0 " hide file encoding (might change in the future)
  let g:airline_section_b = 0 " hide file encoding (might change in the future)
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
Plug 'arcticicestudio/nord-vim'
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
Plug 'tpope/vim-endwise'
Plug 'vim-test/vim-test'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'ycm-core/YouCompleteMe'
call plug#end()
" end plug

" use Vim settings rather than Vi
set nocompatible
set autowrite     " Automatically :write before running commands
set autoread     " Automatically :write before running commands
" enable filetype plugins
filetype plugin on

" enable color
syntax enable

" highline current line
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
set cursorline

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

let mapleader = "'"
" call matchadd('ColorColumn', '\%81v', 100)
" <\+l> to toggle highlight.
nnoremap <leader>l :set hlsearch! hlsearch?<cr>
nnoremap <leader>t :set relativenumber! relativenumber?<cr>
nnoremap <leader>g :Gst<cr>
" ctrl+s to save
nnoremap <leader>s :w <cr>

" buffer switching
nnoremap <silent> <leader>q :bprevious<cr>
nnoremap <silent> <leader>w :bnext<cr>
nnoremap <silent> <leader>d :bd<cr>
" tab switching
" nnoremap <silent> <S-w> :tabnext<cr>
" nnoremap <silent> <S-q> :tabprevious<cr>
nnoremap <S-w> <C-w>
" split switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" noremap <C-o> <c-w>_ \| <c-w>\|
" noremap <C-0> <c-w>=
" " split rotate
" nnoremap <C-S-J> <C-W><S-i>
" nnoremap <C-S-K> <C-W><S-k>
" nnoremap <C-S-L> <C-W><S-l>
" nnoremap <C-S-H> <C-W><S-h>
set splitbelow
set splitright

" source vimrc
nnoremap <silent> <leader>r :source ~/.vimrc<cr>
nnoremap <silent> <leader>e :tabnew ~/.vimrc<cr>

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
nnoremap <silent> <leader>h :History<cr>
nnoremap <silent> <leader>i :Lines<cr>
nnoremap <silent> <leader>D :bufdo bd<cr>

" change shape of cursor bwt modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif

" color scheme
set background=dark
set noequalalways
colorscheme gruvbox " vim-material, gruvbox
set t_Co=256

" render whitespace
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=yellow guibg=orange
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" make test commands execute using vimux.vim
let test#strategy = "vimux"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g
