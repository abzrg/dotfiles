let g:table_mode_corner                 = '|'
let g:table_mode_corner_corner          = '|'
let g:table_mode_header_fillchar        = '='
let g:table_mode_fillchar               = '-'
let g:table_mode_align_char             = ':'
let g:table_mode_cell_text_object_a_map = 'ac'
let g:table_mode_cell_text_object_i_map = 'ic'
let g:table_mode_syntax                 = 1
let g:table_mode_delimiter              = ' \{2,}'

nmap <TAB> :TableModeToggle<CR>
xmap <TAB> <ESC><TAB>gv
xmap <silent> T :<C-U>call ToggleTabularization()<CR>

function! ToggleTabularization ()
    let range = getpos('''<')[1] .','. getpos('''>')[1]
    if getline("'<") =~ '\\\@!|'
        silent TableModeEnable
        exec 'silent! ' . range . 's/[-= ]\@<=+\|+[-= ]\@=/  /g'
        exec 'silent! ' . range . 's/[-= ]|[-= ]\|[^\\]\zs|[-= ]\|[-= ]|/  /g'
        exec 'silent! ' . range . 's/\s\+$//'
        nohlsearch
        TableModeDisable
    else
        TableModeEnable
        '<,'>Tableize
    endif
    normal gv
endfunction
