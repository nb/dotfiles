call pathogen#infect()

runtime mapmeta.vim

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
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

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on
  
endif " has("autocmd")

" COMMENTS
map ,# :s/(^\s*)/\1#/<CR> <Esc>:nohlsearch <CR>
map ,/ :s/^/\/\//<CR> <Esc>:nohlsearch <CR>
map ,> :s/^/> /<CR> <Esc>:nohlsearch<CR>
map ," :s/^/\"/<CR> <Esc>:nohlsearch<CR>
map ,% :s/^/%/<CR> <Esc>:nohlsearch<CR>
map ,! :s/^/!/<CR> <Esc>:nohlsearch<CR>
map ,; :s/^/;/<CR> <Esc>:nohlsearch<CR>
map ,- :s/^/--/<CR> <Esc>:nohlsearch<CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR> <Esc>:nohlsearch<CR>

" wrapping comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR> <Esc>:nohlsearch<CR>
map ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR><Esc>:nohlsearch <CR>
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR> <Esc>:nohlsearch<CR>
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR> <Esc>:nohlsearch<CR> 

" tabs
map <C-p> <Esc>:tabnext<CR>
map <C-o> <Esc>:tabprevious<CR>
map <C-t> <Esc>:tabedit<CR>
map <C-q> <Esc>:tabclose<CR>
map QQ <Esc>:qa!<CR>

highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black 

highlight Comment ctermfg=green guifg=green

" gettext
vmap t di<?php _e('<Esc>pa'); ?><Esc>
vmap tn di _e('<Esc>pa')<Esc>
vmap _ di<?php __('<Esc>pa'); ?><Esc>
vmap _n di__(<Esc>pa)<Esc>
vmap ta di<?php echo attribute_escape(__('<Esc>pa')); ?><Esc>

set background=light
colorscheme solarized

set guifont=Consolas:h14

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
