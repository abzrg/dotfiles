let g:lightline = {
\   'colorscheme' : 'wombat',
\   'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified'] ],
\   'right': [ [ 'lineinfo' ],
\              [ 'percent' ],
\              [ 'fileformat', 'fileencoding', 'filetype'] ]
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
\ 'component_function': {
\      'gstatus': 'LightLineGitStatus'
\    }
\ }

" function! LightLineGitStatus() abort
"   let blame = get(b:,'gitsigns_status','')
"   " return blame
"   return winwidth(0) > 120 ? blame : ''
" endfunction

" left:   " , 'charvaluehex'

" mode_map:
" 'component': {
   "     'charvaluehex': '0x%B'
   " },
