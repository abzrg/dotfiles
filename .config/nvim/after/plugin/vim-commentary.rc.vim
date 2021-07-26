" Fix commentary for C and JSON files
autocmd FileType  cpp setlocal commentstring=//\ %s
autocmd FileType    c setlocal commentstring=//\ %s
autocmd FileType foam setlocal commentstring=//\ %s
autocmd FileType json setlocal commentstring=//\ %s
autocmd FileType  sql setlocal commentstring=--\ %s

" Correct C-style json commenting
autocmd FileType json syntax match Comment +\/\/.\+$+
