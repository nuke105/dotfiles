" Plugins directory.
call plug#begin('~/.vim/plugged')

" List of plugins.
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tomasr/molokai'                   "colorscheme
Plug 'patstockwell/vim-monokai-tasty'   "colorscheme
Plug 'dracula/vim', { 'as': 'dracula' } "colorscheme
Plug 'sjl/gundo.vim'                    "undo tree visualized
Plug 'vim-airline/vim-airline'          "fancy statusline
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'godlygeek/tabular'

call plug#end()

set nocompatible
filetype plugin on
syntax on

" colorscheme dracula
colorscheme molokai
" colorscheme vim-monokai-tasty

set history=200

set nu
set rnu

set encoding=utf-8

set wildmenu
set incsearch
set hlsearch

set ruler
set showcmd

set splitbelow
set splitright

set expandtab
set tabstop=2
set shiftwidth=2

set hidden

set undofile
set undodir=~/.vim/undodir

"movement in split panes
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"man pages in vim
runtime ftplugin/man.vim
let g:ft_man_open_mode = 'tab'

"Search for the Current Selection
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

"Fix gundo
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

let mapleader=" "
map <Leader>J :!node -i -e "$(<%)"<Enter>
map <Leader>j :!node %<Enter>
map <Leader>h :!open %<Enter>
map <Leader>y "+y
map <Leader>p "+p
map <Leader>V :source ~/.vimrc<Enter>
map <Leader>vv ggVG
map <Leader>u :GundoToggle<Enter>
