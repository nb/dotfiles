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
set nobackup
set ts=4
set sw=4
set fileencodings=utf8
set enc=utf8
set mouse=a
set ignorecase
syntax on
set hlsearch
set vb
set listchars=tab:▸\ ,eol:¬

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

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
