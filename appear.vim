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
  colorscheme gruvbox
endif

" highlight current line only on focused window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

set cursorline
set colorcolumn=80 " line limit
set relativenumber

" change shape of cursor bwt modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" render whitespace
set list listchars=tab:»·,trail:·,nbsp:·

