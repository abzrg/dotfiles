" Latex
call lexima#add_rule({'char': '$', 'input_after': '$', 'filetype': 'latex'})
call lexima#add_rule({'char': '$', 'at': '\%#\$', 'leave': 1, 'filetype': 'latex'})
call lexima#add_rule({'char': '<BS>', 'at': '\$\%#\$', 'delete': 1, 'filetype': 'latex'})

" Before  Input   After
" ---------------------
" |       $       $|$
" ---------------------
" $|$     $       $$|
" ---------------------
" $|$     <BS>    |
" ---------------------

" C-style /*comment*/ for css, c, cpp, java, javascript, ...
let s:langs = [ 'css', 'c', 'cpp', 'java', 'javascript' ]

call lexima#add_rule({'char': '/*', 'input_after': '*/', 'filetype': s:langs })
call lexima#add_rule({'char': '*', 'at': '/\*\%#', 'leave': '*/', 'filetype': s:langs })
call lexima#add_rule({'char': '<BS>', 'at': '/\*\%#\*/', 'input': '<BS><BS><Del><Del>', 'filetype': s:langs })
