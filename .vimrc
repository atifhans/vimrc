let mapleader=" "

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'

" MY-OWN-PLUGINS
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'Lokaltog/vim-powerline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-commentary'
Plugin 'tmhedberg/matchit'
Plugin 'dracula/vim'

" MY-PLUGINS
Plugin 'vim-scripts/vim-systemverilog'
Plugin 'vim-scripts/verilog_emacsauto.vim'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/LargeFile'
Plugin 'vim-scripts/molokai'
Plugin 'mtikekar/vim-bsv'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" MY-OWN-CONFIG
set showtabline=1
set guifont=Source\ Code\ Pro\ 9
syntax on
set number
set encoding=utf-8
"set clipboard=unnamed "Yank and paste with the system clipboard
"set backspace=2
set hls
set incsearch
let NERDTreeIgnore=['\.pyc$', '\~$'] " ignore files in NERDTree
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif
set hidden
" set showtabline=0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_root_markers = ['package.json']

set autoindent
set autoread

" As most of the stuff is in git anyway
set nobackup
set nowb
set noswapfile

" Use persistent undo when available
if has("persistent_undo")
   set undodir=~/.vim/undo/
   set undofile
endif

" Yank to clipboard by default
if has('unnamedplus')
   set clipboard=unnamedplus
else
   set clipboard=unnamed
endif

set visualbell
set backspace=indent,eol,start

" Enable wildmenu completion
set wildmenu
set wildmode=list:longest
" patterns to ignore during file-navigation
set wildignore+=.git,.svn,.sass-cache

color molokai 

if has('gui_running')
    color molokai 
    set guioptions-=m
    set guioptions-=T
endif

" quick command in insert mode
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>o
inoremap SS <Esc>S
inoremap CC <Esc>C

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" insert new line with staying with normal mode
nnoremap <CR> o<Esc>
nnoremap <S-CR> o<Esc>k

" Force the cursor onto a new line after 80 characters
set textwidth=80
" In Git commit messages, make it 72 characters
autocmd FileType gitcommit set textwidth=72
" Colour the 73rd column so that we don’t type over our limit
set colorcolumn=+1
" In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51

" toggle number / relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
  else
    set rnu
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
autocmd FocusLost * :set nornu
autocmd FocusGained * :set rnu
autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu

nnoremap <silent><leader>p :CtrlSpace<CR>

" NERDTree
nnoremap <space>t :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>
" NERDTree GIT
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" ACK
let g:ackprg = 'ag --nogroup --nocolor --column'

" On Pressing tab, insert spaces
set expandtab
set tabstop=3 
set softtabstop=3 
set shiftwidth=3 
