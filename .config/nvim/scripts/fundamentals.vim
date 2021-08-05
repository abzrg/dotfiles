let mapleader = ' '
filetype plugin indent on

" Block plugins and extra dependency's {{{
" -----------------------------------------------------------------------------
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Disable extra plugins
let g:loaded_gzip         = 1
let g:loaded_tarPlugin    = 1
let g:loaded_zipPlugin    = 1
let g:loaded_2html_plugin = 1

" Don't use any remote plugins so no need to load them
let g:loaded_rrhelper       = 1
let g:loaded_remote_plugins = 1
" let g:loaded_netrw          = 1
" let g:loaded_netrwPlugin    = 1
" }}}

" Encoding Options {{{
" -----------------------------------------------------------------------------
scriptencoding utf-8
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set fileformat=unix
" }}}

 " Fold Settings {{{
 " -----------------------------------------------------------------------------
 set foldmethod=marker
 " set foldlevelstart=1
 function! MyFoldText()
     let line = getline(v:foldstart)
     let foldedlinecount = v:foldend - v:foldstart + 1
     return '  ' . line . ' '
 endfunction
 set foldtext=MyFoldText()
 set fillchars=fold:\ 
" }}}

" Misc. {{{
" -----------------------------------------------------------------------------
set autoread
set cpoptions+=$
set clipboard+=unnamedplus

if !exists('g:vscode')
    set cursorline
endif

set formatoptions+=r | " Add asterisks in block comments
set cmdheight=2
set hidden
set hlsearch
set ignorecase
set incsearch
set infercase
set isfname-== | " Avoid recognizing = as part of file name
set laststatus=2
" Don't redraw while executing macros (good performance config)
set lazyredraw
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,tab:▸\ ,trail:•,
set list
set mouse=a
set nobackup
set noequalalways
set nojoinspaces
set noshowmode
set noswapfile
set nowritebackup
set nowrap
set noruler
set noshowmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
set number
" set relativenumber
" set numberwidth=5
set path+=**
set path+=/home/ali/.config/nvim
set scrolloff=3
set sidescrolloff=5
set shell=zsh
set shortmess=filnxtToOIc
" Allow show signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved. (yes/auto/no)
set signcolumn=yes
set smartcase
set splitbelow splitright
set termguicolors
set thesaurus+=~/.config/nvim/moby-words.txt
set title
set wildignorecase
set wildignore=*.git/*,*.tags,tags,*.o,*.class
set wildmenu
set wildmode=longest,list,full

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" VSCode
if (!exists('g:vscode')) && has("nvim")
    set modifiable
endif
" }}}
