" use Vim settings rather than Vi
set nocompatible

if has("autocmd")
  filetype indent plugin on
endif

call plug#begin('~/.vim/plugged')
Plug 'sirver/UltiSnips'
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsEditSplit="horizontal"
Plug 'itchyny/lightline.vim'
  let g:lightline = {
  \ 'mode_map': {
    \ 'n' : 'λ',
    \ 'i' : 'i',
    \ 'R' : 'r',
    \ 'v' : 'v',
    \ 'V' : 'vl',
    \ "\<C-v>": 'vb',
    \ 'c' : 'c',
    \ 's' : 's',
    \ 'S' : 'sl',
    \ "\<C-s>": 'sb',
    \ 't': 't',
    \ },
  \   'colorscheme': 'jellybeans',
  \   'active': {
  \      'left': [ [ 'mode', 'paste' ],
  \                [ 'readonly', 'relativepath' ] ],
  \      'right': [ ],
  \   },
  \ }
  let g:lightline.separator = {
  \   'left': '', 'right': ''
  \}
  let g:lightline.subseparator = {
  \   'left': '', 'right': ''
  \}
  let g:lightline.tabline = {
  \   'left': [ [ 'tabs' ] ],
  \   'right': []
  \ }
Plug 'preservim/nerdtree'
  let NERDTreeShowLineNumbers=1
  let g:NERDTreeDirArrowExpandable = ''
  let g:NERDTreeDirArrowCollapsible = ''
  map <C-n> :NERDTreeToggle<cr>
  map <C-m> :NERDTreeFind<cr>
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
  let g:fzf_preview_window = []
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-endwise'
Plug 'ggreer/the_silver_searcher'
Plug 'slim-template/vim-slim'
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
Plug 'nanotech/jellybeans.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
Plug 'ycm-core/YouCompleteMe'
Plug 'https://github.com/edkolev/tmuxline.vim'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'Yggdroot/indentLine'
  let g:indentLine_char_list = ['|', '¦', '┆', '┊']
  let g:indentLine_enabled = 0
call plug#end()

set noshowmode " hide mode, lightline does the jobs
set autowrite  " Automatically :write before running commands
" set autoread
set hidden
set noswapfile
set nobackup
set nowb

autocmd VimResized * wincmd =
" enable filetype plugins
filetype plugin on

" enable color
syntax enable
" highline current line only on focused window
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
set cursorline
set colorcolumn=100 " line limit
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
set splitbelow
set splitright
set ignorecase
set hlsearch
set incsearch
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
" inoremap <Tab> <C-r>=InsertTabWrapper()<cr>
" inoremap <S-Tab> <C-n>

" " Use ag over grep
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
  set t_Co=256
endif

set noequalalways

" color scheme
set background=dark
colorscheme jellybeans

" render whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=yellow guibg=orange
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

runtime! macros/matchit.vim

" source "~tuang/dotfiles/vim/mapping.vim"
let mapleader = "'"

nmap <leader>ga :Git add %<cr>
nmap <leader>gb :Git blame<cr>
nmap <leader>gs :Git<cr>
nmap <leader>gr :Gread<cr>
" access vimrc
nnoremap <leader>tv :tabnew ~/tuang/dotfiles/vimrc<cr>
nnoremap <leader>sv :source ~/tuang/dotfiles/vimrc<cr>

nnoremap <leader>l :set hlsearch! hlsearch?<cr>
map <leader>us :UltiSnipsEdit<cr>
map <leader>e :e!<cr>
map <leader>E :bufdo e!<cr>
map <leader>I :PlugInstall<cr>
nnoremap <leader>x :x <cr>

"find and replace
nnoremap <leader>R :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <leader>w :w <cr>
nnoremap <leader>q :q! <cr>
nnoremap <leader>Q :wqa! <cr>

" fzf shortcut
nnoremap <silent> <leader>f :Files<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>h :History<cr>
nnoremap <silent> <leader>i :Lines<cr>

nnoremap <silent> <leader>d :bd<cr>

" tab switching
nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <leader>tc :tabclose<cr>

" split switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>vv <C-W>v
nnoremap <leader>vs <C-W>s

nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <C-f>; :TmuxNavigatePrevious<cr>

" nmap <leader>ga :Git add %<cr>
nmap <leader>gb :Git blame<cr>
nmap <leader>gs :Git<cr>
nmap <leader>gr :Gread<cr>
nnoremap <leader>l :set hlsearch! hlsearch?<cr>
nnoremap <leader>t :set relativenumber! relativenumber?<cr>
map <leader>us :UltiSnipsEdit<cr>
map <leader>e :e!<cr>
map <leader>E :bufdo e!<cr>
map <leader>I :PlugInstall<cr>
nnoremap <leader>x :x <cr>

""find and replace
nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <leader>w :w <cr>
nnoremap <leader>q :q! <cr>
nnoremap <leader>Q :wqa! <cr>

"" fzf shortcut
nnoremap <silent> <leader>f :Files<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>h :History<cr>
nnoremap <silent> <leader>i :Lines<cr>

nnoremap <silent> <leader>d :bd<cr>

" tab switching
nnoremap <silent> <leader>t :tabnew<cr>

" split switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>vv <C-W>v
nnoremap <leader>vs <C-W>s

nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <C-f>; :TmuxNavigatePrevious<cr>

" markdown preview
nnoremap <leader> mp :MarkdownPreview<cr>

" zoom in/out
nnoremap zi <c-w>_ \| <c-w>\|
nnoremap zo <c-w>=

let test#strategy = "vimux"

" jk when wrapper on
nmap k gk
nmap j gj

" open dropbox note
map <leader>n :tabnew ~/Dropbox/notes/draft.md<cr>
nmap <silent> tn :TestNearest<cr>
nmap <silent> ts :TestSuite<cr>
nmap <silent> tl :TestLast<cr>
nmap <silent> tv :TestVisit<cr>
nmap <silent> tf :TestFile<cr>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<cr>:cw<cr><cr>
nnoremap <leader>a :Ag<SPACE>
