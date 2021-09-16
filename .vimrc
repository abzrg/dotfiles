filetype plugin indent on
syntax on
let mapleader = ' '


" plugins
source ~/.vim/plug.vim

"------------------------------------------------------------------------------
" settings
"------------------------------------------------------------------------------

scriptencoding utf-8
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set fileformat=unix

set foldmethod=marker
function! MyFoldText()
    let line = getline(v:foldstart)
    let foldedlinecount = v:foldend - v:foldstart + 1
    return '  '. foldedlinecount . line
endfunction
set foldtext=MyFoldText()
set fillchars=fold:\

set cursorline

" number
set number
set rnu

" completion settings
set completeopt+=menuone
set completeopt+=noinsert
set completeopt+=noselect
let g:mucomplete#enable_auto_at_startup = 1

set cmdheight=1

set textwidth=80

" Fix syntax highlighting
augroup BgHighlight
    autocmd!
    autocmd BufEnter,FocusGained,VimEnter,WinEnter * setlocal cursorline | ownsyntax
    autocmd BufEnter,FocusGained,VimEnter,WinEnter * redraw!
    autocmd FocusLost,WinLeave * setlocal nocursorline | ownsyntax off
    " Highlight up to 255 columns (this is the current Vim max) beyond 'textwidth'
    autocmd BufEnter,FocusGained,VimEnter,WinEnter * let &l:colorcolumn='+' . join(range(0, 254), ',+')
    autocmd FocusLost,WinLeave * let &l:colorcolumn=join(range(1, 255), ',')
augroup END
set wrapmargin=0


" indentation
set tabstop=4
set sw=4
set expandtab

set cpoptions+=$
set encoding=utf-8
set fileformat=unix
set hidden
set hlsearch
set ignorecase
set incsearch
set smartcase
set infercase
set splitbelow splitright
set title
set noshowmode

set sidescroll=1
set sidescrolloff=3

set undofile
set undodir=~/.local/share/vim/undo

set nowrap

set listchars=nbsp:¬,extends:»,precedes:«,tab:▸\ ,trail:•,
set list

set mouse=a

" No backup
set nobackup
set noswapfile
set nowritebackup

set backspace=indent,eol,start

set termguicolors
" let g:seoul256_background = 234
" colo seoul256
colo jellybeans
highlight ColorColumn   guibg=#000000
highlight CursorLineNr  guibg=#000000
highlight LineNr        guibg=#000000
highlight SignColumn    guibg=#000000
highlight EndOfBuffer   guibg=#000000
set fillchars+=eob: 


set scrolloff=3
set shortmess=filnxtToOI
set signcolumn=yes

set path+=**

set wildignore=*.git/*,*.tags,tags,*.o,*.class
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

set wildignorecase
set wildmenu
set wildmode=longest,list,full

set updatetime=1000
set timeoutlen=1000
set ttimeoutlen=0

set virtualedit=block

set showcmd
set laststatus=2

" Some color stuff
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Cursor shape
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END


"------------------------------------------------------------------------------
" -- mappings
"------------------------------------------------------------------------------

" General
nnoremap ; :
nnoremap Y y$
nnoremap v <C-v>
nnoremap <C-v> v

nnoremap ''  :b#<cr>

" new note
nnoremap <space>n :edit $NOTES_DIR/<C-d>

" Change to directory of current file
nnoremap cd :cd %:p:h<CR>:pwd<CR>

" Edit and source this file from anywhere
nnoremap <silent> <leader>e :e $MYVIMRC<CR>
nnoremap <silent> <leader>s :source $MYVIMRC<CR>
nnoremap <silent> <leader>i :PlugInstall<CR>

nnoremap # #<C-o>
nnoremap * *<C-o>

" vmath plugin
xmap <silent><expr>  ++  VMATH_YankAndAnalyse()
nmap <silent>        ++  vip++

" Better vertical line-by-line navigation
nmap j gj
nmap k gk

nnoremap H ^
nnoremap L $

" Saner commandline history
" source: https://github.com/mhinz/vim-galore/blob/master/README.md#saner-command-line-history
cnoremap <expr> <c-n> wildmenumode() ? "\<c-n>" : "\<down>"
cnoremap <expr> <c-p> wildmenumode() ? "\<c-p>" : "\<up>"

" Move the search item's position to the middle of the page
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" C style comment with pressing Ctrl-/
inoremap <C-_> /**/<Left><Left>

" Comment (C-style) visually selected area
" ref: https://vi.stackexchange.com/a/18170/30665
xnoremap # s/* <c-r>" */<esc>

" Easily surround stuff in visual mode
vmap * S*
vmap _ S_
vmap ' S'
vmap " S"
vmap ` S`
vmap ( S(
vmap [ S[


" Throw away in to the black hole! (now, c does'nt put text into yank register)
nnoremap c "_c

" Stay in visual mode after indenting the selected area
vmap < <gv
vmap > >gv

" Access to the meaning of the word via sdcv
map ,w yiw <bar> :!vimdic<CR>

" Perform dot commands over visual blocks:
vnoremap . :normal .<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Replace all instance of the word under the cursor with S
nnoremap S yiw:%s///g<Left><Left><Left><C-r>"<Right>

" Search in visually selected area
vnoremap / <Esc>/\%V

" Get rid of accidental jump to ex mode and easily wrap text
map Q gq

" Make BS/DEL work as expected in visual modes (i.e. delete the selected text)...
xmap <BS> x

" Make vaa select the entire file...
xmap aa VGo1G

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==

" Undo break points
inoremap , ,<C-g>U
inoremap . .<C-g>U
inoremap ! !<C-g>U
inoremap ? ?<C-g>U

" Search and replace with dot
nnoremap cn *``cgn
nnoremap cN *``cgN

" mark position before search (Get back where you were with 's)
nnoremap / mszv/\v

" More Convinience!
nnoremap <leader>q :q!<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>x :wq!<cr>

" Escape terminal mode easier
tnoremap <silent> ,<Esc> <C-\><C-n>

" Type lang<C-l> for shebang line
inoremap <silent> <C-l>
            \ <Esc>:sil exe ".!which <cWORD>" <bar> s/^/#!/
            \ <bar> filetype detect <bar> nohlsearch <cr>o

" if this is a normal buffer use <CR> to toggle folding
nmap <expr> <CR> &buftype ==# '' ? 'za' : "\<CR>"

" Quick Fix List mappings + Centered
nnoremap <C-n> :cnext<CR>zzzv
nnoremap <C-p> :cprevious<CR>zzzv
nnoremap <C-l> :cnf<CR>zzzv
nnoremap <C-h> :cpf<CR>zzzv

nnoremap <silent> <leader>zz :call mappings#zap()<CR>

" some abbreviation for exiting vim
cnoreabbrev w! w!
cnoreabbrev q! q!
cnoreabbrev qall qall
cnoreabbrev qall! qall!
cnoreabbrev wq wq
cnoreabbrev wa wa
cnoreabbrev wq wq
cnoreabbrev wq wq
cnoreabbrev w w
cnoreabbrev q q
cabbr <expr> %% fnameescape(expand('%:p:h'))


" -----------------------------------------------------------------------------
" -- hooks
" -----------------------------------------------------------------------------

" Jump to the last known cursor position
au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$")
            \ | exe "normal! g`\"" | endif

" Disables automatic commenting on newline
autocmd FileType * setlocal
            \ formatoptions-=c
            \ formatoptions-=o
            \ formatoptions+=j
            \ formatoptions+=l

" xrdb update on save
autocmd BufRead,BufNewFile xresources,xdefaults set filetype=xdefaults
autocmd BufWritePost .Xresources,.Xdefaults,.xresources,.xdefaults !xrdb %

" FileType Detection
au BufNewFile,BufRead *.es6 setf javascript
au BufNewFile,BufRead *.tsx setf typescriptreact
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.flow set filetype=javascript
au BufNewFile,BufRead *.rss,*.atom setfiletype xml
set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md
au FileType coffee setlocal shiftwidth=2 tabstop=2
au FileType ruby setlocal shiftwidth=2 tabstop=2
au FileType yaml setlocal shiftwidth=2 tabstop=2

" -- Better help
" Open help in a new tab instead of a split
augroup HelpInTabs
autocmd!
autocmd BufEnter *.txt call HelpInNewTab()
augroup END

function! HelpInNewTab()
if &buftype == 'help'
  "Convert the help window to a tab...
  execute "normal \<C-W>T"
  endif
  endfunction

" -- Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" -- Auto resize splits upon window resize
autocmd vimResized * execute "normal! \<C-w>="


" -----------------------------------------------------------------------------
" Netrw
" -----------------------------------------------------------------------------

let g:netrw_banner         = 0
let g:netrw_liststyle      = 3
let g:netrw_browse_split   = 4
let g:netrw_fastbrowse     = 1
let g:netrw_altv           = 1
let g:netrw_silent         = 1
let g:netrw_sort_by        = 'name'
let g:netrw_sort_direction = 'normal'
let g:netrw_winsize = 25

" Don't show dotfiles by default (press gh to toggle dot file hiding)
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" Inherit custom wildignore
let g:netrw_list_hide = &wildignore

" Close netrw if its the last window
aug netrw_close
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw"|q|endif
aug END

" Toggle netrw
let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
noremap <silent> <leader>f :call ToggleNetrw()<CR>


"------------------------------------------------------------------------------
" HIGHLIGHTS
"------------------------------------------------------------------------------

" highlight StatusLine guifg=white guibg=#007ACC
" highlight link EndOfBuffer ColorColumn

"------------------------------------------------------------------------------
" ALE
"------------------------------------------------------------------------------
" Write this in your vimrc file
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" function! Dump(cmd) abort
"     put =execute(a:cmd)
" endfunction
