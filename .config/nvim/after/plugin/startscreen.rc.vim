function! Splash()
    if exists('g:indentLine_loaded')
        IndentLinesToggle
    endif

    " File containig the ascii art
    " Embed text read from this buffer
    silent read ~/.local/share/nvim/splash.txt

    syn match Banner / *\(█\|╚\).*/
    " hi Banner guifg=#84ABAC | " seoul
    hi Banner guifg=#5396CF | " codedark

    " Some margin for readability
    silent %>>

    " Insert Wikidates under banner
    if isdirectory(expand("$HOME") . '/.local/share/wikidates')
        read ! shuf -n1 ~/.local/share/wikidates/$(date +\%B_\%d) | fold -s -w 80

        " syn match Wikidates /^.*[0-9]* –.*\(\n.*\|$\)/
        " syn match Wikidates /[a-zA-Z0-9_,–.'"`!]/
        syn match Wikidates /^\s*[^█╚]*/
        " hi Wikidates guifg=#B67170 | " seoul
        hi Wikidates guifg=#C58D76 | " codedark
    endif


    " Get rid of ~ at the end

    " Read the value of the background color into a variable
    " https://stackoverflow.com/a/48715479/13041067
    " redir => s:bgcolor
    "     echo synIDattr(hlID("Normal"), "bg")
    " redir end

    highlight EndOfBuffer guifg=#1D1F21
    au BufLeave * hi EndOfBuffer guifg=#5A5A5A

    " Centeralize
    let &textwidth = winwidth(0)
    silent 0,$center
    let &textwidth = 0

    " Go to line 1
    :1
endfun

let g:Startscreen_function = function('Splash')
