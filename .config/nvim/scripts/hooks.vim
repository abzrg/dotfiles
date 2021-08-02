" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Jump to the last known cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" xrdb update on save
autocmd BufRead,BufNewFile xresources,xdefaults set filetype=xdefaults
autocmd BufWritePost .Xresources,.Xdefaults,.xresources,.xdefaults !xrdb %

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Completion during search (via Command window)
function! s:search_mode_start()
    cnoremap <tab> <c-f>:resize 1<CR>a<c-n>
    let s:old_complete_opt = &completeopt
    let s:old_last_status = &laststatus
    set completeopt-=noinsert
    set laststatus=0
endfunction

function! s:search_mode_stop()
    try
        silent cunmap <tab>
    catch
    finally
        let &completeopt = s:old_complete_opt
        let &laststatus  = s:old_last_status
    endtry
endfunction

augroup SearchCompletions
    autocmd!
    autocmd CmdlineEnter [/\?] call <SID>search_mode_start()
    autocmd CmdlineLeave [/\?] call <SID>search_mode_stop()
augroup end

" File types
au BufNewFile,BufRead *.es6 setf javascript
au BufNewFile,BufRead *.tsx setf typescriptreact
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.flow set filetype=javascript
set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md
au FileType coffee setlocal shiftwidth=2 tabstop=2
au FileType ruby setlocal shiftwidth=2 tabstop=2
au FileType yaml setlocal shiftwidth=2 tabstop=2
