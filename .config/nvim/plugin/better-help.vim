nmap <silent> <RIGHT>       :cnext<CR>
nmap <silent> <RIGHT><RIGHT>    :cnfile<CR><C-G>
nmap <silent> <LEFT>        :cprev<CR>
nmap <silent> <LEFT><LEFT>  :cnfile<CR><C-G>

augroup HelpInTabs
    autocmd!
    autocmd BufEnter *.txt call HelpInNewTab()
augroup END

function! HelpInNewTab()
    if &buftype == 'help'
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction
