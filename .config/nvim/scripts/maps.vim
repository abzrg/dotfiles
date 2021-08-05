" More Convinience!
nnoremap <leader>q :q!<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>z :wq!<cr>
vnoremap <M-q> <esc>:q!<cr>

" Notes
nnoremap <leader>n :exe "e $NOTES_DIR/Scratch/stash/".strftime("%F-%H%M%S").".md"<cr>

" Insert Current Time/Date
inoremap <M-t> <C-r>=strftime('%D %l:%M%P')<cr>
inoremap <M-T> <C-r>=strftime('%D')<cr>

" Type lang<C-Y> for shebang line
inoremap <C-y> <Esc>:sil exe ".!which <cWORD>" <bar> s/^/#!/ <bar> filetype detect <bar> nohlsearch <cr>o

" New tab like in browsers
nnoremap <C-t> :tabnew<cr>

" nnoremap <RightMouse> "+]p

" Add a virtual color-column at the 81th character
highlight ColorColumn ctermbg=darkmagenta ctermfg=black guibg=darkmagenta guifg=black
nnoremap <leader>l :call matchadd('ColorColumn', '\%81v', 1)<CR>

" Make script executable
nnoremap <silent> <leader>\ :silent! exe '!chmod 755 %' <bar> redraw <bar> echomsg 'Converted to an executable'<cr>

" toggle last buffer
nnoremap ''  :b#<cr>zz

" Open the current directory
nnoremap - :e %:h<CR>
cabbr <expr> %% expand('%:p:h')
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" CDC = Change to directory of current file
nnoremap cd :cd %:p:h<CR>:pwd<CR>
command! CDC cd %:p:h

" Easier navigaton between buffers
nnoremap <M-b> :bp<CR>
nnoremap <M-n> :bn<CR>

" Edit and source this file from anywhere
nnoremap <M-e> :e $MYVIMRC<CR>
nnoremap <M-s> :source $MYVIMRC<CR>
nnoremap <M-i> :PlugInstall<CR>

" Easier jump between two files
nnoremap <silent> <M-Tab> :b#<CR>

" Navigate between tabs easily
nnoremap <silent> <Tab> gt
nnoremap <silent> <s-Tab> gT

" if this is a normal buffer use <CR> to toggle folding
nmap <expr> <CR> &buftype ==# '' ? 'za' : "\<CR>"

" Even more convinience (use ; to go to the command mode)
nnoremap ; :
vnoremap ; :

" Add space bellow or above without leaving normal mode
nnoremap <silent> [<space>  :<c-u>put!=repeat([''],v:count)<bar>']+1<cr>
nnoremap <silent> ]<space>  :<c-u>put =repeat([''],v:count)<bar>'[-1<cr>

" Better vertical line-by-line navigation
nmap j gj
nmap k gk

" Fix the behavior of `Y`, to be similar to behavior of `C` and `D`
nmap Y y$

nnoremap H ^
nnoremap L g_

vnoremap K k

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Quick Fix List mappings + Centered
nnoremap <C-j> :cnext<CR>zzzv
nnoremap <C-k> :cprevious<CR>zzzv
nnoremap <C-l> :cnf<CR>zzzv
nnoremap <C-h> :cpf<CR>zzzv

" Toggle quickfixlist
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction
nnoremap <silent> <c-q> :call ToggleList("Quickfix List", 'c')<CR>

" Undo break points
inoremap , ,<C-g>U
inoremap . .<C-g>U
inoremap ! !<C-g>U
inoremap ? ?<C-g>U

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <A-C-j> <esc>:m .+1<CR>==a
inoremap <A-C-k> <esc>:m .-2<CR>==a
nnoremap <A-C-k> :m .-2<CR>==
nnoremap <A-C-j> :m .+1<CR>==

" Search and replace with dot
nnoremap cn *``cgn
nnoremap cN *``cgN

" Access to the meaning of the word via sdcv
map ,w yiw <bar> :!vimdic<CR>

" Easier regex search
" nnoremap / /\v

" mark position before search (Get back where you were with 's)
nnoremap / mszv/

" Throw away in to the black hole! (now, c does'nt put text into yank register)
nnoremap c "_c

" Stay in visual mode after indenting the selected area
vmap < <gv
vmap > >gv

" Temporarily remove annoying highlighted search item
nmap <silent> <BS> :nohlsearch<CR>

" Perform dot commands over visual blocks:
vnoremap . :normal .<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Save file as sudo on files that require root permission
if has('nvim')
    cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
else
    cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
endif

" Replace all instance of the word under the cursor with S
nnoremap S yiw:%s///g<Left><Left><Left><C-r>"<Right>
vnoremap S <Esc>yiw:%s///g<Left><Left><Left><C-r>"<Right>

" Search in visually selected area
vnoremap / <Esc>/\%V

" Get rid of accidental jump to ex mode and easily wrap text
map Q gq

" Check shell scripts with shell check
map ,s :!clear && shellcheck -x %<CR>

" Compile document, be it groff/LaTeX/markdown/etc.
map ,c :w! \| !compiler "<c-r>%"<CR>

" Open corresponding .pdf/.html or preview
map ,p :!opout <c-r>%<CR><CR>

" Toggle numbering
function! ToggleNumber()
    if &number == '1' && &relativenumber == '1'
        set rnu! nu!
        echo "Number and relative number disabled"
    elseif &number == '1' && &relativenumber == '0'
        set nu!
        echo "Number disabled"
    else
        set nu!
        echo "Number enabled"
    endif
endfunction
nnoremap <F9> :call ToggleNumber()<CR>


" Toggle syntax highlighting
map <silent> <F7> :if exists("g:syntax_on") <Bar>
    \ syntax off <CR>
    \ else <Bar>
    \ syntax enable <Bar>
    \ endif <CR>

" Function for toggling the bottom statusbar:
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>b :call ToggleHiddenAll()<CR>

" Disable clangd diagnostics
nnoremap <silent> <leader>d :echo 'Disabled Diagnostics' <bar> :call coc#config('languageserver.clangd.disableDiagnostics', v:true) <Bar> :silent! CocRestart<CR>

