runtime mapmeta.vim
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" shows trailing whitespace, clear it using :FixWhitespace
Plugin 'nb/vim-trailing-whitespace'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rizzatti/dash.vim'
Plugin 'danro/rename.vim'
call vundle#end()

" enable loading filetype and indentation plugins
filetype plugin on
filetype indent on
syntax on

set ruler
set number
set ignorecase
set smartcase " Switch to case-sensitive search if term has uppercase letters
set ts=4
set sw=4
set showcmd
set cursorline
set clipboard+=unnamedplus " Try using the system clipboard for everything, because I am not great with registers

" Colors
set t_Co=256
set background=light
colorscheme solarized

" Source nvimrc files after editing
autocmd bufwritepost init.vim source <afile>

" Saving undo history between lanuches is precious
set undofile
set undodir=~/.nvim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" Centralize backups, so that they are easier to manage
set backup
set backupdir=~/.nvim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" If we backup temporary files often automated editing tools like the crontab
" editor get confused
set backupskip=/tmp/*,/private/tmp/*"
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.DS_Store,.*.un~

let mapleader = ";"

" Unmap arrows :D
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" I use : so often that the huge space makes sense
map <Space> :
" I use the escape so often than jk in INSERT mode is easy to type, yet
" doesn't appear in almost any words
imap jk <Esc>
" Enter cleans the search highlight
:nnoremap <CR> :nohlsearch<cr>
" Add Spaces inside parentheses, A8C Style
map <Leader>s ci(<space><space><Esc>hp

MapMeta 1 :tabnext 1<CR>
MapMeta 2 :tabnext 2<CR>
MapMeta 3 :tabnext 3<CR>
MapMeta 4 :tabnext 4<CR>
MapMeta 5 :tabnext 5<CR>
MapMeta 6 :tabnext 6<CR>
MapMeta 7 :tabnext 7<CR>
MapMeta 8 :tabnext 8<CR>
MapMeta 9 :tabnext 9<CR>

" Set local working directory to the nearest project dir, or in the current
" directory if not in a project
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.vimproject']
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\.min\.\(js\|css\)\|build\|vendor\|node_modules$'

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = { 'passive_filetypes': ['php'] }
