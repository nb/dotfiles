call pathogen#infect()

runtime mapmeta.vim

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

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
set undofile
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set ts=4
set sw=4
set fileencodings=utf8
set enc=utf8
set mouse=a
set ignorecase
syntax on
set hlsearch
set vb
set list
set listchars=tab:▸\ ,
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.DS_Store,.*.un~
set cursorline

" remember undo changes between sessions
if v:version >= 703
  set undofile
endif
" disable folding
set nofoldenable
" Visual line marker
if v:version >= 703
  set colorcolumn=72
endif

" Source vimrc files after editing
autocmd bufwritepost .vimrc source <afile>
autocmd bufwritepost vimrc.vim source <afile>

autocmd FileType text setlocal textwidth=72

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

map <Space> :
:nnoremap <CR> :nohlsearch<cr>

autocmd FileType php MapMeta % :w!<CR>:!php %<CR>
autocmd FileType php MapMeta ^ :w!<CR>:!php -l %<CR>
autocmd FileType php MapMeta & :w!<CR>:!recurse_phpunit %:h --testdox --no-colors %:p<CR>
autocmd FileType php MapMeta * :w!<CR>:!recurse_phpunit %:h --no-colors %:p<CR>
autocmd FileType php set keywordprg=phpnetman
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

let g:syntastic_phpcs_disable = 1

" automatically source vim sessions so I can open them with the finder
au BufRead *.vis so %
" auto-save on losing focus
au FocusLost * :wa

let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\.min\.\(js\|css\)$'

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
