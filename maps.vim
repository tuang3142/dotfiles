" RULES
" leader: command
" ctr: hold and repeat

let mapleader = "'"

vnoremap <leader>c "*y
nnoremap <C-d> 30j
nnoremap <C-u> 30k
nmap <leader>ga :Git add %<cr>
nmap <leader>gb :Git blame<cr>
nmap <leader>gs :Git<cr>
nmap <leader>gr :Gread<cr>

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
nnoremap sv <C-W>v
nnoremap ss <C-W>s

nmap <leader>ga :Git add %<cr>
nmap <leader>gb :Git blame<cr>
nmap <leader>gs :Git<cr>
nmap <leader>gr :Gread<cr>
nnoremap <leader>l :set hlsearch! hlsearch?<cr>
" nnoremap <leader>t :set relativenumber! relativenumber?<cr>
" map <leader>us :UltiSnipsEdit<cr>
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

" zoom in/out
nnoremap zi <c-w>_ \| <c-w>\|
nnoremap zo <c-w>=

" jk when wrapper on
nmap k gk
nmap j gj

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<cr>:cw<cr><cr>
nnoremap <leader>a :Ag<SPACE>

" autocompletion
set completeopt=menuone,noinsert,noselect
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" TODO: vim test
" nmap <silent> <leader>tn :TestNearest<cr>
" nmap <silent> <leader>ts :TestSuite<cr>
" nmap <silent> <leader>tl :TestLast<cr>
" nmap <silent> <leader>tv :TestVisit<cr>
" nmap <silent> <leader>tf :TestFile<cr>

" fzf
nnoremap <silent> <leader>ff :Files<cr>
nnoremap <silent> <leader>fg :GFiles<cr>
nnoremap <silent> <leader>fb :Buffers<cr>
nnoremap <silent> <leader>fh :History<cr>
nnoremap <silent> <leader>fl :Lines<cr>

" nerd tree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nr :NERDTreeRefreshRoot<CR>
nnoremap <cr> :NERDTreeFind<CR>

" tmux navigator
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <C-f>; :TmuxNavigatePrevious<cr>

" source settings
noremap <silent> <leader>ss :source ~/.config/nvim/init.vim<cr>
