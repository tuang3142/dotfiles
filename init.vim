" use Vim settings rather than Vi
set nocompatible

if has("autocmd")
  filetype indent plugin on
endif

" set noshowmode " hide mode, lightline does the jobs
" TODO: auto refresh files
set autowrite  " Automatically :write before running commands
set autoread
set hidden
set noswapfile
set nobackup
set nowb

autocmd VimResized * wincmd =
" enable filetype plugins
filetype plugin on

" set autoindent
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set nohlsearch

" show incomplete commands
set showcmd
set splitbelow
set splitright
set ignorecase
set incsearch
" suggestion for fills
set wildmenu
set wildmode=list:longest,list:full

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<Tab>"
"     else
"         return "\<C-p>"
"     endif
" endfunction

" " Use ag over grep
" if executable('ag')
"   " Use Ag over Grep
"   set grepprg=ag\ --nogroup\ --nocolor

"   " Use ag in fzf for listing files. Lightning fast and respects .gitignore
"   let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'

"   if !exists(":Ag")
"     command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
"     nnoremap \ :Ag<SPACE>
"   endif
" endif

set noequalalways

runtime! macros/matchit.vim
let test#strategy = "vimux"
" }
" -------

" PLUGS {
call plug#begin(stdpath('data') . '/plugged')
" Plug 'folke/which-key.nvim'
" Plug 'lewis6991/gitsigns.nvim'
Plug 'folke/trouble.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
" Plug 'kdheepak/tabline.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-abolish'
" Plug 'gruvbox-community/gruvbox'
"   let gruvbox_contrast_dark='hard'
"   let gruvbox_sign_column='none'
"   let gruvbox_invert_selection='false'
Plug 'ishan9299/nvim-solarized-lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'sevko/vim-nand2tetris-syntax'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'skwp/greplace.vim'
" Plug 'tpope/vim-unimpaired'
Plug 'preservim/vimux'
Plug 'vim-test/vim-test'
" TODO
" Plug 'folke/twilight.nvim'
call plug#end()
" }
" -------

" MAPS {
nnoremap <SPACE> <Nop>
let mapleader = " "

vnoremap <leader>c "*y
nnoremap <C-d> 30j
nnoremap <C-u> 30k
nmap <leader>ga :Git add %<cr>
nmap <leader>gb :Git blame<cr>
nmap <leader>gs :Git<cr>
nmap <leader>gr :Gread<cr>
nmap <leader>gcm :Git commit -m '

map <leader>us :UltiSnipsEdit<cr>
" map <leader>e :e!<cr>
" map <leader>E :bufdo e!<cr>
nnoremap <leader>x :x <cr>

"find and replace
nnoremap <leader>R :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <leader>w :wa <cr>
nnoremap <leader>q :q! <cr>
nnoremap <leader>Q :wqa! <cr>

nnoremap <silent> <leader>d :bd<cr>

" tab switching
nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <leader>tc :tabclose<cr>

" split switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" nnoremap sv <C-W>v
" nnoremap ss <C-W>s

nmap <leader>ga :Git add %<cr>
nmap <leader>gb :Git blame<cr>
nmap <leader>gs :Git<cr>
nmap <leader>gr :Gread<cr>
" toggle hlsearch
nnoremap <leader>hh :set hlsearch! hlsearch?<cr>
" nnoremap <leader>t :set relativenumber! relativenumber?<cr>
" map <leader>us :UltiSnipsEdit<cr>
map <leader>e :e!<cr>
map <leader>E :bufdo e!<cr>
nnoremap <leader>x :x <cr>

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

" zoom in/out
nnoremap zi <c-w>_ \| <c-w>\|
nnoremap zo <c-w>=

" jk when wrapper on
nmap k gk
nmap j gj

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<cr>:cw<cr><cr>
nnoremap <leader>a :Ag<cr><SPACE>

" autocompletion
" set completeopt=menuone,noinsert,noselect
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" TODO: vim test
nmap <silent> tn :TestNearest<cr>
nmap <silent> ts :TestSuite<cr>
nmap <silent> tl :TestLast<cr>
nmap <silent> tv :TestVisit<cr>
nmap <silent> tf :TestFile<cr>

" fzf
" TODO: search todo, search like telescope
nnoremap <silent> <leader>f :Files<cr>
nnoremap <silent> <leader>i :GFiles<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>r :History<cr>
nnoremap <silent> <leader>l :Lines<cr>

" tmux navigator
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <C-f>; :TmuxNavigatePrevious<cr>

" source settings
noremap <silent> <leader>ss :source ~/.config/nvim/init.vim<cr>
noremap <silent> <leader>sc :e ~/.config/nvim/init.vim<cr>

" nvim tree
nnoremap <silent> <cr> :NvimTreeFindFile<cr>
nnoremap <silent> <leader>e :NvimTreeToggle<cr>

" trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
" }
" -------


" VIEW {
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set t_Co=256
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  colorscheme solarized-flat
endif

" change shape of cursor bwt modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" render whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" misc
set number
set relativenumber
set cursorline
" }
" -------
