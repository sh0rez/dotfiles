"----------------------------------------------
" Plugin management
"
" Download vim-plug from the URL below and follow the installation
" instructions:
" https://github.com/junegunn/vim-plug
"----------------------------------------------

call plug#begin('~/.vim/plugged')

" Integrations
Plug 'christoomey/vim-tmux-navigator'

" Appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

" Editor Features
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" Language Support
Plug 'fatih/vim-go'
Plug 'hashivim/vim-terraform'

call plug#end()

"----------------------------------------------
" General settings
"----------------------------------------------
set encoding=utf-8
set noswapfile                    " disable swapfile usage
set title                         " let vim set the terminal title

set updatetime=100                " redraw the status bar often
set lazyredraw                    " redraw only when we need to.

" visuals
syntax enable

set number                        " show number ruler
set relativenumber                " show relative line numbers
set ruler

set showcmd                       " show command in bottom bar
set cursorline                    " highlight current line
set colorcolumn=81                " highlight the 80th column as an indicator

" tabs
set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set expandtab                     " expands tabs to spaces
set softtabstop=2
set tabstop=2

" auto read/save
set autoread                      " reload file if the file changes on the disk
set autowrite                     " write when switching buffers
set autowriteall                  " write on :quit
autocmd BufLeave * silent! :wa    " Autosave buffers before leaving them
autocmd BufWritePre * :%s/\s\+$//e " Remove trailing white spaces on save

" (disable) features
set clipboard=unnamedplus

set noerrorbells                  " No bells!
set novisualbell                  " I said, no bells!

"set wildmenu                      " visual autocomplete for command menu

" mouse support
if has('mouse')
    set mouse=a
endif

" neovim specific settings
if has('nvim')
    " Set the Python binaries neovim is using. Please note that you will need to
    " install the neovim package for these binaries separately like this for
    " example:
    " pip3.6 install -U neovim
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python3'
endif

"----------------------------------------------
" Navigation
"----------------------------------------------
let mapleader = ","	"leader

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap j gj
nnoremap k gk

"----------------------------------------------
" Colors
"----------------------------------------------
colorscheme gruvbox 
set background=dark
let g:gruvbox_contrast_dark = 'hard'


"----------------------------------------------
" Searching
"----------------------------------------------
set incsearch		                " move cursor to first match
set hlsearch		                " highlight
set ignorecase		                " case insensitive
set smartcase		                " uppercase is case sensitive
set showmatch		                " show matches

nnoremap <leader><space> :noh<cr>   " clear results

"----------------------------------------------
" Splits + Tabs
"----------------------------------------------
" Splits
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>W :vsp .<cr>

nnoremap <leader>h <C-w>s<C-w>j
nnoremap <leader>H :sp .<cr>

nnoremap <leader>= <C-w>=

set splitbelow
set splitright

" Tabs
nnoremap <leader>C :tabnew .<cr>
nnoremap <leader>c :tabnew <cr>
nnoremap <leader>& :tabclose<cr>

" Movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"----------------------------------------------
" Plugin: vim-airline/vim-airline
"----------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'