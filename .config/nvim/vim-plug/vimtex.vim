" DOCUMENTATION:

" VimtexCompile: Start compiling the LaTex Code (in continuous mode since we set
" it above)
" VimtexView: Open the compiled pdf using the
" VimtexErrors: Display errors (if any) in the current file

let g:vimtex_view_method = 'zathura'
let g:tex_flavor  = 'latex'
"let g:vimtex_quickfix_enabled = '0'
let g:vimtex_compiler_progname = 'nvr'
autocmd FileType tex map <leader>c :VimtexCompile<CR>
