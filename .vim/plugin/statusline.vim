"" " status bar colors
"" au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
"" au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
"" hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
""
"" " Status line
"" " default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)
""
"" " Status Line Custom
"" let g:currentmode={
""     \ 'n'  : 'Normal',
""     \ 'no' : 'Normal·Operator Pending',
""     \ 'v'  : 'Visual',
""     \ 'V'  : 'V·Line',
""     \ '^V' : 'V·Block',
""     \ 's'  : 'Select',
""     \ 'S'  : 'S·Line',
""     \ '^S' : 'S·Block',
""     \ 'i'  : 'Insert',
""     \ 'R'  : 'Replace',
""     \ 'Rv' : 'V·Replace',
""     \ 'c'  : 'Command',
""     \ 'cv' : 'Vim Ex',
""     \ 'ce' : 'Ex',
""     \ 'r'  : 'Prompt',
""     \ 'rm' : 'More',
""     \ 'r?' : 'Confirm',
""     \ '!'  : 'Shell',
""     \ 't'  : 'Terminal'
""     \}
""
"" set laststatus=2
"" set noshowmode
"" set statusline=
"" set statusline+=%0*\ %n\                                 " Buffer number
"" set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
"" set statusline+=%3*│                                     " Separator
"" set statusline+=%2*\ %Y\                                 " FileType
"" set statusline+=%3*│                                     " Separator
"" set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
"" set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
"" set statusline+=%=                                       " Right Side
"" set statusline+=%2*\ col:\ %02v\                         " Colomn number
"" set statusline+=%3*│                                     " Separator
"" set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
"" set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode
""
"" hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
"" hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
"" hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
"" hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e

" -- Custom statusline
" function My_statusline()
"     local filepath = '%<%f %h%m%r'
"     local align_section = '%='
"     local file_encoding = '%{"[".(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?",B":"")."] "}'
"     local file_format = '[%{&fileformat}]'
"     local percentage_through_file = ' %3p%% '
"     local column_and_line_number = '%3l→ ,%3c↓'
"     local filetype = '%y %q'
"     return string.format(
"         '%s%s%s%s%s%s%s%s',
"         filepath,
"         align_section,
"         column_and_line_number,
"         percentage_through_file,
"         align_section,
"         filetype,
"         file_encoding,
"         file_format
"     )
" endfunction

set statusline=\ %<%f\ %h%m%r
set statusline+=%{FugitiveStatusline()}%=
set statusline+=%3l→\ ,%3c↓
set statusline+=\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ |
set statusline+=%y%q
set statusline+=[%{&fileformat}]
set statusline+=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}
set statusline+=\ %3p%%

" setglobal statusline=[%n]\ %<%.99f\ %y%h%w%m%r%=%-14.(%l,%c%V%)\ %P
" setglobal statusline+=%{FugitiveStatusline()}

