"  FUGITIVE

" s :: stage
" U :: unstage
" :Gcommit :: commit canges
" :Gpush :: to push the unpushed changes
nnoremap <leader>gs :G<CR>

" Vim Diff:
" dv :: go to diff mode to resolve conflicts
" when cursor is on the <<<<<<< HEAD
" get diff from the right window (b)
nnoremap <leader>gl :diffget //3<CR>
" get diff from the left window (a)
nnoremap <leader>gh :diffget //2<CR>
" do 'CTRL-w O' to jump back after the diff page
