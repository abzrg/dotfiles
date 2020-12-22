"====[ Toggle visibility of naughty characters ]============

" Make naughty characters visible...
" (uBB is right double angle, uB7 is middle dot)
"set listchars=tab:▸\·,trail:·,nbsp:˷,eol:¬
"highlight InvisibleSpaces ctermfg=NONE ctermbg=NONE
"call matchadd('InvisibleSpaces', '\S\@<=\s\+\%#\ze\s*$')

"augroup VisibleNaughtiness
"    autocmd!
"    autocmd BufEnter  *       set list
"    autocmd BufEnter  *       set list
"    autocmd BufEnter  *.txt   set nolist
"    autocmd BufEnter  *.vp*   set nolist
"    autocmd BufEnter  *       if !&modifiable
"    autocmd BufEnter  *           set nolist
"    autocmd BufEnter  *       endif
"augroup END
