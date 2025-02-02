" ==================== Plugin Management ====================
" Install vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" UI Enhancements
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'

" Navigation & Search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'

" Syntax & Language Support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'saltstack/salt-vim'
Plug 'chr4/nginx.vim'
Plug 'sheerun/vim-polyglot'  " Modern replacement for various ftplugins
Plug 'tpope/vim-commentary'

" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'

" Code Linting & Completion
Plug 'dense-analysis/ale'  " Modern replacement for syntastic
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Alternative to deoplete

" Themes
Plug 'morhetz/gruvbox'
Plug 'EdenEast/nightfox.nvim'

call plug#end()

" ==================== General Config ====================
set nocompatible
set encoding=utf-8
set number
set ruler
set showcmd
set showmode
set cursorline
set laststatus=2
set clipboard=unnamedplus
set hidden
set backspace=indent,eol,start
set history=1000
set ignorecase
set smartcase
set wrap
set linebreak
set mouse=a
set incsearch
set hlsearch
set scrolloff=8
set sidescrolloff=15
set wildmode=list:longest,full
set wildmenu
set wildignore=*.o,*.obj,*.pyc,*.class,*.DS_Store,*.swp
set splitbelow
set splitright
set foldmethod=indent
set foldlevelstart=99

" Indentation
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set expandtab

" Statusline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Colors
colorscheme gruvbox
set background=dark

" ==================== Key Mappings ====================
let mapleader=" "

" Quick save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Toggle search highlighting
nnoremap <leader><space> :noh<CR>

" Navigate between buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Moving lines up and down
nnoremap <Up> :m-2<CR>==
nnoremap <Down> :m+<CR>==

" CtrlP mappings
if exists(":CtrlP")
  let g:ctrlp_max_files = 0
  let g:ctrlp_open_new_file = 'r'
  let g:ctrlp_open_multiple_files = 'i'
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_working_path_mode = 'ra'
endif

" ==================== AutoCmds ====================
if has("autocmd")
  augroup my_autocmds
    autocmd!

    " Trim trailing whitespace on save
    autocmd BufWritePre * %s/\s\+$//e

    " Filetype-specific settings
    autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
    autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
    autocmd FileType go setlocal noexpandtab shiftwidth=4 softtabstop=4
  augroup END
endif

" ==================== Plugin Configs ====================
" ALE Linting
let g:ale_fixers = {'python': ['black', 'isort'], 'javascript': ['prettier'], 'go': ['gofmt']}
let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 1

" CoC.nvim settings
let g:coc_global_extensions = ['coc-json', 'coc-pyright', 'coc-tsserver', 'coc-go']

