runtime mapmeta.vim

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nb/vim-trailing-whitespace'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git.git'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'groenewege/vim-less'
Bundle 'edsono/vim-matchit'
Bundle 'ap/vim-css-color'
Bundle 'jnwhiteh/vim-golang'
Bundle 'stephpy/vim-yaml'
Bundle 'plasticboy/vim-markdown'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/greper.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'zerowidth/vim-copy-as-rtf'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mikewest/vimroom'
Bundle 'rayburgemeestre/phpfolding.vim'
Bundle 'goldfeld/vim-seek'
Bundle 'mhinz/vim-signify'
Bundle 'danro/rename.vim'

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
" Visual line marker
if v:version >= 703
  set colorcolumn=72
endif

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

highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black

set t_Co=256
set background=light
colorscheme solarized

set guifont=Consolas:h13

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
autocmd FileType php MapMeta & :w!<CR>:!recurse_phpunit %:h --testdox %:p<CR>
autocmd FileType php MapMeta * :w!<CR>:!recurse_phpunit %:h %:p<CR>
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" disable phpcs
let g:syntastic_php_checkers = ['php', 'phpmd']

" automatically source vim sessions so I can open them with the finder
au BufRead *.vis so %

let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\.min\.\(js\|css\)$'

let g:gist_detect_filetype = 1
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1

let g:html_number_lines = 0
let g:copy_as_rtf_using_local_buffer = 1

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

au! BufNewFile,BufRead *.coffee setf coffee
autocmd FileType coffee setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

au! BufNewFile,BufRead *.json setf json
autocmd FileType json setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

nmap <leader>md :!/usr/local/bin/markdown % \| pbcopy<cr>
