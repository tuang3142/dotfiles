" use Vim settings rather than Vi
set nocompatible

if has("autocmd")
  filetype indent plugin on
endif

" set noshowmode " hide mode, lightline does the jobs
set autowrite  " Automatically :write before running commands
set autoread
set hidden
set noswapfile
set nobackup
set nowb

autocmd VimResized * wincmd =
" enable filetype plugins
filetype plugin on

set autoindent
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set ruler
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
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction

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

set noequalalways

runtime! macros/matchit.vim
let test#strategy = "vimux"

runtime ./plug.vim
runtime ./maps.vim
runtime ./appear.vim
