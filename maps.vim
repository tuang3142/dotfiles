let mapleader = "'"

vnoremap <leader>c "*y
nnoremap <C-d> 30j
nnoremap <C-u> 30k
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

" zoom in/out
nnoremap zi <c-w>_ \| <c-w>\|
nnoremap zo <c-w>=

" jk when wrapper on
nmap k gk
nmap j gj

nmap <silent> tn :TestNearest<cr>
nmap <silent> ts :TestSuite<cr>
nmap <silent> tl :TestLast<cr>
nmap <silent> tv :TestVisit<cr>
nmap <silent> tf :TestFile<cr>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<cr>:cw<cr><cr>
nnoremap <leader>a :Ag<SPACE>

" autocompletion
set completeopt=menuone,noinsert,noselect
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <silent> <leader>f :GFiles<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>h :History<cr>
nnoremap <silent> <leader>i :Lines<cr>
