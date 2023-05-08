runtime mapmeta.vim

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off

" enable loading filetype and indentation plugins
filetype plugin on
filetype indent on


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set viminfo='20,\"1024
set history=200
set ruler
set showcmd
set incsearch
set backup
if v:version >= 703
	set undofile
	set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
endif
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" If we backup temporary files often automated editing tools like the crontab
" editor get confused
set backupskip=/tmp/*,/private/tmp/*"
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set ts=4
set sw=4
set fileencodings=utf8
set enc=utf8
set mouse=a
set ignorecase
" Switch to case-sensitive search if term has uppercase letters
set smartcase
syntax on
set hlsearch
set vb
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.DS_Store,.*.un~
set cursorline
" use system clipboard on OSX
set clipboard=unnamed

" don't limit window dimensions
set winminheight=0
set winminwidth=0

" always show status bar
set laststatus=2

" disable folding
set nofoldenable

" Source vimrc files after editing
autocmd bufwritepost .vimrc source <afile>
autocmd bufwritepost vimrc.vim source <afile>

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

set background=light
colorscheme solarized

set guifont=Fira\ Code:h16

set number

MapMeta 1 :tabnext 1<CR>
MapMeta 2 :tabnext 2<CR>
MapMeta 3 :tabnext 3<CR>
MapMeta 4 :tabnext 4<CR>
MapMeta 5 :tabnext 5<CR>
MapMeta 6 :tabnext 6<CR>
MapMeta 7 :tabnext 7<CR>
MapMeta 8 :tabnext 8<CR>
MapMeta 9 :tabnext 9<CR>

let mapleader = ";"
map <Space> :
:nnoremap <CR> :nohlsearch<cr>

autocmd FileType php MapMeta % :w!<CR>:!php %<CR>
autocmd FileType php MapMeta ^ :w!<CR>:!php -l %<CR>
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" automatically source vim sessions so I can open them with the finder
au BufRead *.vis so %

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Add Spaces inside parentheses, A8C Style
map <Leader>s ci(<space><space><Esc>hp

au! BufNewFile,BufRead *.lecture setf lecture
autocmd FileType lecture setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

autocmd FileType markdown setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType mkd setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
let g:vim_markdown_initial_foldlevel=3

au! BufNewFile,BufRead *.json setf json
autocmd FileType json setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

nmap <leader>md :!/usr/local/bin/markdown "%" \| pbcopy<cr>
nmap <leader>ms :!echo "<meta charset='UTF-8'>" > /tmp/vim-md.html && /usr/local/bin/markdown % >> /tmp/vim-md.html<cr>
nmap <leader>mr :!echo "<meta charset='UTF-8'>" > /tmp/vim-md.html && /usr/local/bin/markdown % >> /tmp/vim-md.html && open /tmp/vim-md.html<cr>
