function! Splash()
    if exists('g:indentLine_loaded')
        IndentLinesToggle
    endif

    " File containig the ascii art
    " Embed text read from this buffer
    silent read ~/.local/share/nvim/splash.txt

    syn match Banner / *\(█\|╚\).*/
    hi Banner guifg=#5396CF

    " Some margin for readability
    silent %>>

    " Insert Wikidates under banner
    read ! shuf -n1 ~/.local/share/wikidates/$(date +\%B_\%d) | fold -s -w 80

    " syn match Wikidates /^.*[0-9]* –.*\(\n.*\|$\)/
    " syn match Wikidates /[a-zA-Z0-9_,–.'"`!]/
    syn match Wikidates /^\s*[^█╚]*/
    hi Wikidates guifg=#C58D76


    " Centeralize
    let &textwidth = winwidth(0)
    silent 0,$center

    " Go to line 1
    :1
endfun

let g:Startscreen_function = function('Splash')
