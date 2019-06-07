"----------------------------------------------
" Plugin management
"
" Download vim-plug from the URL below and follow the installation
" instructions:
" https://github.com/junegunn/vim-plug
"----------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'ctjhoa/spacevim'

" Integrations
Plug 'christoomey/vim-tmux-navigator'

" Appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

" Editor Features
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'w0rp/ale'                                " Syntax Highlight
Plug 'tpope/vim-commentary'                    " uncomment stuff
Plug 'jiangmiao/auto-pairs'                    " Add closing brackets
Plug 'tpope/vim-surround'                      " Modify surroundings

Plug 'ctrlpvim/ctrlp.vim'                      " CtrlP is installed to support tag finding in vim-go

Plug 'airblade/vim-gitgutter'

" Language Support
Plug 'fatih/vim-go'                            " Go support
Plug 'zchee/deoplete-go', { 'do': 'make'}      " Go auto completion

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'hashivim/vim-terraform'                  " Hashicorp Config Lang

Plug 'google/vim-jsonnet'                      " jsonnet

call plug#end()

"----------------------------------------------
" General settings
"----------------------------------------------
set encoding=utf-8
set termguicolors
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
set completeopt-=preview          " remove the horrendous preview window

" folding
set foldmethod=syntax
set foldlevelstart=20

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

fun! StripTrailingWhitespace()
    " Only strip if the b:noStripeWhitespace variable isn't set
    if exists('b:noStripWhitespace')
        return
    endif
    %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTrailingWhitespace()

" (disable) features
set clipboard=unnamedplus

set noerrorbells                  " No bells!
set novisualbell                  " I said, no bells!

" mouse support
if has('mouse')
    set mouse=a
endif

"----------------------------------------------
" Navigation
"----------------------------------------------
let mapleader = ' '	"leader

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
noremap <right> <nop>

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

set splitbelow
set splitright

" Movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap fd <ESC>
set timeoutlen=100

"----------------------------------------------
" Plugin: Shougo/deoplete.nvim
"----------------------------------------------
if has('nvim')
    " Enable deoplete on startup
    let g:deoplete#enable_at_startup = 1
endif

"----------------------------------------------
" Plugin: vim-airline/vim-airline
"----------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

"----------------------------------------------
" Plugin: zchee/deoplete-go
"----------------------------------------------
" Enable completing of go pointers
let g:deoplete#sources#go#pointer = 1

"----------------------------------------------
" Plugin: w0rp/ale
"----------------------------------------------
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

"----------------------------------------------
" Plugin: 'ctrlpvim/ctrlp.vim'
"----------------------------------------------
" Note: We are not using CtrlP much in this configuration. But vim-go depend on
" it to run GoDecls(Dir).

" Disable the CtrlP mapping, since we want to use FZF instead for <c-p>.
let g:ctrlp_map = ''

" Plugin: plasticboy/vim-markdown"
" ----------------------------------------------
let g:vim_markdown_math = 1
au FileType markdown set cole=2

au FileType markdown map <Leader>sld :set spelllang=de<CR>
au FileType markdown map <Leader>sle :set spelllang=en<CR>

"----------------------------------------------
" Language: Golang
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

let g:go_fmt_experimental = 1

" Run goimports when running gofmt
let g:go_fmt_command = "goimports"

" Enable syntax highlighting per default
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

" Show the progress when running :GoCoverage
let g:go_echo_command_info = 1

" Show type information
let g:go_auto_type_info = 1

" Highlight variable uses
let g:go_auto_sameids = 1

" Fix for location list when vim-go is used together with Syntastic
let g:go_list_type = "quickfix"

" gometalinter configuration
let g:go_metalinter_command = ""
let g:go_metalinter_deadline = "5s"
let g:go_metalinter_enabled = [
    \ 'deadcode',
    \ 'gas',
    \ 'goconst',
    \ 'gocyclo',
    \ 'golint',
    \ 'gosimple',
    \ 'ineffassign',
    \ 'vet',
    \ 'vetshadow'
\]

" Set whether the JSON tags should be snakecase or camelcase.
let g:go_addtags_transform = "snakecase"

"----------------------------------------------
" Language: gitcommit
"----------------------------------------------
au FileType gitcommit setlocal spell
au FileType gitcommit setlocal textwidth=80

"----------------------------------------------
" Language: gitconfig
"----------------------------------------------
au FileType gitconfig set noexpandtab
au FileType gitconfig set shiftwidth=2
au FileType gitconfig set softtabstop=2
au FileType gitconfig set tabstop=2

"----------------------------------------------
" Language: JSON
"----------------------------------------------
au FileType json set expandtab
au FileType json set shiftwidth=2
au FileType json set softtabstop=2
au FileType json set tabstop=2

"----------------------------------------------
" Language: YAML
"----------------------------------------------
au FileType yaml set expandtab
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
au FileType yaml set tabstop=2


"----------------------------------------------
" Language: TOML
"----------------------------------------------
au FileType toml set expandtab
au FileType toml set shiftwidth=2
au FileType toml set softtabstop=2
au FileType toml set tabstop=2

"----------------------------------------------
" Language: Markdown
"----------------------------------------------
au FileType markdown setlocal spell
au FileType markdown set expandtab
au FileType markdown set shiftwidth=4
au FileType markdown set softtabstop=4
au FileType markdown set tabstop=4
au FileType markdown set syntax=markdown

au FileType markdown let b:noStripWhitespace=1
