" let g:fzf_layout = {
"             \ 'up':'~90%',
"             \ 'window': {
"                 \ 'width': 0.8,
"                 \ 'height': 0.8,
"                 \ 'yoffset':0.5,
"                 \ 'xoffset': 0.5,
"                 \ 'highlight': 'Todo',
"                 \ 'border': 'sharp'}}
let g:fzf_layout = { 'down': '~40%'}

" Disable line numbering in fzf buffer
autocmd TermOpen * setlocal nonumber nornu

nnoremap ;b  :Buffers<cr>
nnoremap ;c  :Files ~/.config/<cr>
nnoremap ;f  :Files<cr>
nnoremap ;g  :Rg<CR>
nnoremap ;o  :History<CR>
nnoremap ;;  :Helptags<CR>
nnoremap ;n  :Files ~/Documents/Notes/<CR>

" Fix linger/delay exiting with ESC
autocmd! FileType fzf tnoremap <buffer> <Esc> <C-c>

" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')

" Global line completion (not just open buffers. ripgrep required.)
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

" Easier Thesaurus
function! s:make_sentence(lines)
  return substitute(join(a:lines), '^.', '\=toupper(submatch(0))', '').'.'
endfunction

inoremap <expr> <c-x><c-s> fzf#vim#complete({
  \ 'source':  'cat /usr/share/dict/words',
  \ 'reducer': function('<sid>make_sentence'),
  \ 'options': '--multi --reverse --margin 15%,0',
  \ 'left':    20})
