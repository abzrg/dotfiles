" When syntax is `off` in line above, enables the syntax for diff files.

augroup PatchDiffHighlight
    autocmd!
    autocmd FileType diff syntax enable
augroup END
