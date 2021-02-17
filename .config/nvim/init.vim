filetype on
syntax on


"" Source Vim-Plug settings =======================================

source ~/.config/nvim/vim-plug/vim-plug.vim



"" Set leader key =================================================

let mapleader = ' '



""  Options =======================================================

filetype plugin indent off
set clipboard+=unnamedplus
" set cursorcolumn 
set cursorline
set encoding=utf-8
" set foldlevel=1             " default foldlevel 1 to see headings
" set foldmethod=marker       " sets the fold method to {{{ }}} markers
set hidden
set hlsearch
set ignorecase
set incsearch
set mouse=a
set nobackup
set nocindent noautoindent indentexpr= "disable autoindents
set noshowmode
set noswapfile
set nowritebackup
set smartindent
set scrolloff=7
set shiftwidth=4
set shortmess+=I
set signcolumn=auto
set smartcase
set splitbelow splitright
set tabstop=4
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_8f=\[[38;2;%lu;%lu;%lum
set t_8b=\[[48;2;%lu;%lu;%lum
set termguicolors
set thesaurus+=~/.config/nvim/moby-words.txt
set title
set undofile
set updatetime=300
"" Wildmenu
set wildignore=*.git/*,*.tags,tags,*.o,*.class  " What to ignore in completion
set wildignorecase                              " Case insensitive cpmpletion
set wildmenu                                    " How completion is done
set wildmode=longest,list,full                  " How completion is done

"""" Add (Append) directories to vim's Path
set path+=**
set path+=/home/ali/.config/nvim
set path+=/home/ali/OpenFOAM/OpenFOAM-7/src/**

"""" Add (Append) tag files to vim recognize them.
set tags+=~/OpenFOAM/OpenFOAM-7/tags



"" Pluging Setting ================================================

source ~/.config/nvim/vim-plug/coc.vim
source ~/.config/nvim/vim-plug/easy-motion.vim
source ~/.config/nvim/vim-plug/emmet.vim
source ~/.config/nvim/vim-plug/fzf.vim
source ~/.config/nvim/vim-plug/goyo.vim
source ~/.config/nvim/vim-plug/nerd-tree.vim
source ~/.config/nvim/vim-plug/table-mode.vim
source ~/.config/nvim/vim-plug/vim-airline.vim
source ~/.config/nvim/vim-plug/vim-commentary.vim
source ~/.config/nvim/vim-plug/vim-hexokinase.vim
source ~/.config/nvim/vim-plug/vimtex.vim



"" Color settings =================================================

"""" Colorscheme: colo | colorscheme

colo Tomorrow-Night
"""" transparent background
" hi! Normal ctermbg=NONE guibg=NONE
" hi! NonText ctermbg=NONE guibg=NONE
"""" Add a virtual color-column at the 81th character
highlight ColorColumn guibg=darkmagenta guifg=black ctermbg=darkmagenta ctermfg=black

call matchadd('ColorColumn', '\%81v', 1)
" custom highlight
" highlight PmenuSel ctermbg=gray ctermfg=black
" highlight Visual cterm=reverse
" highlight StatusLine ctermfg=101 ctermbg=235
" highlight Search ctermbg=darkyellow ctermfg=white
" highlight Comment ctermfg=240
" highlight SpellBad ctermbg=NONE cterm=underline
" highlight SpellCap cterm=undercurl ctermbg=NONE


"" Mapping ========================================================

""""     ,    : out of vim
"""" <leader> : plugins
""""     \    : vim built-in

" -----------------------------------------------------------------
"""" `jj` as escape
inoremap jj <ESC>

nnoremap ; :

""" Better vertical line-by-line navigation
nmap j gj
nmap k gk
"""" Fixing the behaviour of `Y`, similar to `C`, `D` etc.
nmap Y y$
"""" Move the search item's position to the middle of the page
nnoremap n nzzzv
nnoremap N Nzzzv
"""" Easier regex search
nnoremap / /\v
"""" Throw away in to the black hole!
nnoremap c "_c
"""" Stay in visual mode after indenting the selected area
vmap < <gv
vmap > >gv
" -----------------------------------------------------------------
"""" Compile and open document
map ,c :w! \| !compiler <c-r>%<CR>
map ,p :!opout <c-r>%<CR><CR>
"""" Check your shell script
map ,s :!clear && shellcheck --shell=sh %<CR>
map ,w yiw <bar> :!vimdic<CR>
"""" Use urlview to choose and open a url
map ,u :w<Home>silent <End> !urlview<CR>
" -----------------------------------------------------------------
"""" Enable English language spell checking
map \o :setlocal spell! spelllang=en_au<CR>
"""" Search and replace (globally)
nnoremap \s :%s///g<Left><Left><Left>
nnoremap \r :so $MYVIMRC<CR>
" Search through
nnoremap \/ :e /<C-d>
nnoremap \f :find ~/
" -----------------------------------------------------------------
"""" Easier path autocompletion
" inoremap <C-f> <C-x><C-f>
"""" Easy Navigation between the splits
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
"""" Easier Navigation between the buffers and tabs
nnoremap <silent> <C-K> :bn<CR>
nnoremap <silent> <C-J> :bp<CR>
nnoremap <silent> <C-L> :tabn<CR>
nnoremap <silent> <C-H> :tabp<CR>
" -----------------------------------------------------------------
"""" Toggle numbering
map <F9> :set rnu! nu!<CR>
"""" Toggle syntax highlighting
map <silent> <F7> :if exists("g:syntax_on") <Bar>
    \ syntax off <Bar>
    \ else <Bar>
    \ syntax enable <Bar>
    \ endif <CR>
"""" Temporarily remove annoying highlighted search item
nmap <silent> <BS> :nohlsearch<CR>
"""" Edit Only-Read files? TODO
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!


"" autocmds =============================================================

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Treat .C and .H files as c/cpp files
au BufReadPost *.C set filetype=cpp
au BufReadPost *.H set filetype=cpp

" Treat .md files as markdown file
au BufEnter *.md set ft=markdown

" Have dwmblocks automatically recompile and run when you edit this file in
" vim with the following line in your vimrc/init.vim:
autocmd BufWritePost ~/.config/dwmblocks/blocks.def.h !cd ~/.config/dwmblocks/; rm blocks.h; sudo make clean install && { killall -q dwmblocks;setsid dwmblocks & }
