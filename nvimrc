" manage plugins with Plug
" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/plugged')

"function! DoRemote(arg)
"  UpdateRemotePlugi
"endfunction

Plug 'tpope/vim-fugitive'                                       " A Git wrapper so awesome, it should be illegal
Plug 'gregsexton/gitv'                                          " gitk for vim
Plug 'idanarye/vim-merginal', { 'tag': '2.2.1' }                " provide a nice inteface for dealing with Git branches. needs fugitive
Plug 'airblade/vim-gitgutter'                                   " shows a git diff in the sign column and stages/previews/undoes hunks and partial hunks.
Plug 'samoshkin/vim-mergetool'                                  " better mergetool

Plug 'vim-airline/vim-airline'                                  " lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes'                           " A collection of themes for vim-airline
Plug 'dense-analysis/ale'                                       " async lint engine
"Plug 'int3/vim-extradite'
Plug 'junegunn/vim-easy-align'                                  " A Vim alignment plugin
Plug 'mtth/scratch.vim'                                         " Unobtrusive scratch window

" completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'

"Plug 'roxma/nvim-completion-manager'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"
"Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" syntax
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'saltstack/salt-vim'
"Plug 'https://github.com/chr4/nginx.vim'
Plug 'chr4/nginx.vim'
"Plug 'https://github.com/xolox/vim-misc.git'
"Plug 'xolox/vim-lua-ftplugin.git'
Plug 'hashivim/vim-terraform'

" install sniprun. rust toolchain required
" Plug 'michaelb/sniprun', {'do': 'bash install.sh'}


" themes
Plug 'https://github.com/tomasr/molokai.git'
Plug 'fenetikm/falcon'
Plug 'NLKNguyen/papercolor-theme'
Plug 'folke/tokyonight.nvim'

call plug#end()
"
" =================== General Config ====================

set backspace=indent,eol,start " Allow backspace in insert mode
"set esckeys                    " Function keys that start with an <Esc> are recognized in Insert mode
set gcr=a:blinkon0             " Disable cursor blink
set hidden                     " allows you to change buffers without saving
set history=1000               " Store lots of :cmdline history
set number                     " Line numbers are good
set ruler                      " Show the line and column number of the cursor position
set showcmd                    " Show (partial) command in status line.
set showmode                   " Show current mode down the bottom
set visualbell                 " Use visual bell instead of beeping
set nomodeline                 " Disables modeline
"set mls=5                      " search first/last lines for modeline
set showmatch                  " When a bracket is inserted, briefly jump to the matching one.
set cursorline                 " Highlight the screen line of the cursor with CursorLine
"set cursorcolumn               " vertical cursorline
set nostartofline              " Try to preserve column where cursor is positioned.
set ls=2                       " show a status line even when only one window is shown
set shm=at                     " short message
set ww=<,>,h,l                 " Allow specified keys that move the cursor left/right to move to the previous/next line when the cursor is on the first/last character in the line
"set cpoptions=ces$             " show $ at end of word when you use cw
set nopaste                    " default to no paste mode
set nodigraph                  " Disable the entering of digraphs in Insert mode with {char1} <BS>
set ignorecase                 " make searches case insensitive
set smartcase                  " if one or more chars is upper case, make the search case sensitive
set textwidth=79
set formatoptions=qrn1
set lazyredraw                 " When this option is set, the screen will not be redrawn while executing macros, registers and other commands that have not been typed.  Also, updating the window title is postponed.  To force an update use |:redraw|.

" =================== Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
" viminfo stores the the state of your previous editing session
set viminfo+=n~/.config/nvim/viminfo
set viminfo='100,f1  "Save up to 100 marks, enable capital marks
"set viminfo=%,'50,\"100,:100,n~/.viminfo


" =======Indentation ===========
set autoindent "Copy indent from current line when starting a new line
set smartindent
set smarttab "when we autoindent, backspace will delete the entire tab width, not just individual spaces

set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Display tabs and trailing spaces visually
"set list listchars=tab:\ \ ,trail:·
set list listchars=tab:»·,trail:·,nbsp:·

set wrap         "wrap lines
set linebreak    "Wrap lines at convenient points


" =================== Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" =================== Completion =======================

set wildmode=list:longest         " When more than one match, list all matches and complete first match.

set wildmenu                      " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~       " stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" =================== Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" =================== Set Variables ====================
let g:terminal_scrollback_buffer_size = 2147483647  " set :terminal scrollback to maximum
"let g:python_host_prog = $HOME.'/.pyenv/shims/python'
"let g:python3_host_prog = $HOME.'/.pyenv/shims/python3'

" =================== Navigation =======================

" change arrow key mapping.
" left and right change buffers
" up and down will move lines
"nnoremap <Down> :m+<CR>==
"nnoremap <Up> :m-2<CR>==
"nnoremap <left> :bp<cr>
"nnoremap <right> :bn<cr>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <Up> <nop>
vnoremap <Up> <nop>
vnoremap <Down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
vnoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
" set some mappings for :term
tnoremap <Esc> <C-\><C-n>

" ================= change default behavior =======
nmap Y Y

" ================= mouse  ========================
set mouse=

" ================= Colors ========================
set background=dark
colorscheme PaperColor
"colorscheme tokyonight


" ================= TokyoNight settings ===========
let g:tokyonight_style = "night"
" =============================================================

"improve autocomplete menu color
" dont need this since we have nice colors from solarize
"        highlight Pmenu ctermbg=238 gui=bold
"highlight BadWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" =================== Custom Mappings ==============
nnoremap <leader><space> :noh<cr>
"nnoremap <tab> %
"vnoremap <tab> %
" toggle cursorcolumn
nnoremap <leader>\| :set cursorcolumn!<cr>

" append timestamp at end of line
nnoremap <F5> :call setline(".", getline(".") . strftime(" %c"))<CR>

" =================== AutoCmd ======================
if has("autocmd")
    " Source the nvimrc file after saving it. This way, you don't have to reload Vim to see the changes.
     augroup mynvimrchooks
      au!
      autocmd bufwritepost .config/nvimrc source %
     augroup END
endif

" ==================== AirLine ====================
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 0
let g:airline_theme='papercolor'

" ==================== fugitive ====================
set diffopt+=vertical

" ==================== deoplete ====================
let g:deoplete#enable_at_startup = 1

" ==================== backups ====================
if isdirectory($HOME . '/.config/nvim/backup') == 0
  :silent !mkdir -p ~/.config/nvim/backup >/dev/null 2>&1
endif
set backupdir=~/.config/nvim/backup//
set backup

if isdirectory($HOME . '/.config/nvim/swap') == 0
  :silent !mkdir -p ~/.config/nvim/swap >/dev/null 2>&1
endif
set directory=~/.config/nvim/swap//
set undofile
set undodir=~/.config/nvim/undo//


" Automatically create .backup directory, writable by the group.
if filewritable(".") && ! filewritable("/.config/nvim/backup")
  silent execute '!umask 002; mkdir ~/.config/nvim/backup'
endif


" ================== rgrep ===========================
 if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep\ --smart-case
  set grepformat=%f:%l:%c:%m
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
  let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

  command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
endif

" ================== ultisnips ===========================
"let g:UltiSnipsExpandTrigger="<C-j>"
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" ================= vim-mergetool ========================
let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'


" ================= fzf ========================
nnoremap <leader>f :Files<cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>r :Rg<space>
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" ctrl-z causes fzf to hang, map it to nothing
function! CtrlZWorkaround(lines)
  return "	"
endfunction
let g:fzf_action = {
  \ 'ctrl-z': function('CtrlZWorkaround') }
" allow escape to close fzf window, since we remap it for :term
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

" =================== yaml file settings ===============
autocmd FileType yaml setl ts=2 sts=2 sw=2 expandtab indentkeys-=<:>


" =================== ALE settings =====================
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
