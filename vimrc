" use Vim settings rather than Vi
set nocompatible

if has("autocmd")
  filetype indent plugin on
endif

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
  let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \    'right': [ [ 'lineinfo' ] ],
      \ }
      \}
  let g:lightline.tabline = {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [ [ ] ] }
Plug 'preservim/nerdtree'
  let NERDTreeShowLineNumbers=1
  let g:NERDTreeDirArrowExpandable = ''
  let g:NERDTreeDirArrowCollapsible = ''
  map <C-n> :NERDTreeToggle<CR>
  map <C-m> :NERDTreeFind<CR>
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
  let g:indentLine_char_list = ['|', '¦', '┆', '┊']
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
  nmap <silent> g<C-a> :Git add %<CR> " git add current file
  nmap <silent> g<C-b> :Git blame<CR> " git blame
  nmap <silent> g<C-s> :Git<CR>       " git status
Plug 'tpope/vim-surround'
Plug 'ggreer/the_silver_searcher'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-endwise'
Plug 'vim-test/vim-test'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
  let g:tmux_navigator_no_mappings = 1
  " Write all buffers before navigating from Vim to tmux pane
  let g:tmux_navigator_save_on_switch = 2
  " Disable tmux navigator when zooming the Vim pane
  let g:tmux_navigator_disable_when_zoomed = 1
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/seoul256.vim'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

set noshowmode " hide mode, lightline does the jobs
set autowrite  " Automatically :write before running commands
set autoread   " Automatically :write before running commands
set hidden
set noswapfile
set nobackup
set nowb

autocmd VimResized * wincmd =
" enable filetype plugins
" filetype plugin on

" enable color
syntax enable

" highline current line only on focused window
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
set cursorline
" set textwidth=115
set colorcolumn=+1

set colorcolumn=113
" set spell
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
" <\+l> to toggle highlight.
nnoremap <leader>l :set hlsearch! hlsearch?<cr>
nnoremap <leader>t :set relativenumber! relativenumber?<cr>

"save and close
nnoremap <leader>x :x <cr>

"find and replace
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
" ctrl+s to save
nnoremap <leader>s :w <cr>

" buffer switching
nnoremap <silent> <leader>q :bprevious<cr>
nnoremap <silent> <leader>w :bnext<cr>
nnoremap <silent> <leader>d :bd<cr>
" tab switching
nnoremap <silent> tp :tabnext<cr>
nnoremap <silent> to :tabprevious<cr>
nnoremap <silent> tn :tabnew<cr>

" split switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
" nnoremap <silent> <C-f>; :TmuxNavigatePrevious<cr>

" noremap <C-o> <c-w>_ \| <c-w>\|
" noremap <C-O> <c-w>=

set splitbelow
set splitright

set ignorecase
set hlsearch
set incsearch

" be smart when using tabs ;)
set smarttab

" suggestion for fills
set wildmenu
set wildmode=list:longest,list:full

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" fzf
nnoremap <silent> <leader>f :Files<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>h :History<cr>
nnoremap <silent> <leader>i :Lines<cr>

" " Use ag over grep
" if executable('ag')
"   set grepprg=ag\ --nogroup\ --nocolor
" endif
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in fzf for listing files. Lightning fast and respects .gitignore
  let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>
nnoremap <leader>a :Ag<SPACE>


" nnoremap <silent> <leader>D :bufdo bd<cr>

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

set noequalalways
" color scheme
set t_Co=256
set background=dark
let g:seoul256_background = 233
" colorscheme seoul256
colorscheme base16-tomorrow-night
" colorscheme base16-tomorrow-night-eighties

" render whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=yellow guibg=orange
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" make test commands execute using vimux.vim
let test#strategy = "vimux"
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-v> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g

" ignore arrow
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

runtime! macros/matchit.vim

" edit vimrc
nnoremap <leader>vr :tabnew ~/tuang/dotfiles/vimrc<cr>
nnoremap <leader>vs :source ~/tuang/dotfiles/vimrc<cr>

" submit exercism
nnoremap <leader>es :!exercism submit %<cr>

" jk when wrapper on
nmap k gk
nmap j gj

" " only find completions within files and tags
set complete=.,t
