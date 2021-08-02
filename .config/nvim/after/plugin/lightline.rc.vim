let g:lightline = {
\   'colorscheme' : 'wombat',
\   'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
\   },
\   'mode_map': {
\       'n' : 'N',
\       'i' : 'I',
\       'R' : 'R',
\       'v' : 'V',
\       'V' : 'VL',
\       "\<C-v>": 'VB',
\       'c' : 'C',
\       's' : 'S',
\       'S' : 'SL',
\       "\<C-s>": 'SB',
\       't': 'T',
\   },
\ }

" left:   " , 'charvaluehex' 

" mode_map:
" 'component': {
   "     'charvaluehex': '0x%B'
   " },
