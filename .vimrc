set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on

" Colors
let g:airline_theme='solarized'
syntax enable
set background=dark
"let g:solarized_termtrans=1 "for transparent background, but selected text has bad contrast
let g:solarized_termcolors=256 "for grey background
colorscheme solarized

" Helpful things
set nocompatible
set backspace=indent,eol,start
set ruler
set number
syntax on
filetype on
filetype indent on
filetype plugin on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set showcmd
set listchars=tab:»·,trail:·,extends:>,precedes:<
set list
set virtualedit=onemore

" On pressing enter, highlight all matches of word under cursor; navigate with n/N
let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction
nnoremap <silent> <expr> <CR> Highlighting()
