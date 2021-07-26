set backspace=indent,eol,start
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set expandtab
set smarttab

"  Fix smartindent stupidities
set autoindent "Retain indentation on next line
set smartindent "Turn on autoindenting of blocks

" And no shift magic on comments...
nmap <silent>  >>  <Plug>ShiftLine
nnoremap <Plug>ShiftLine :call ShiftLine()<CR>
function! ShiftLine() range
    set nosmartindent
    exec "normal! " . v:count . ">>"
    set smartindent
    silent! call repeat#set( "\<Plug>ShiftLine" )
endfunction
