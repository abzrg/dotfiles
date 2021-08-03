

" Default value is clap
let g:dashboard_default_executive ='telescope'

" Remove all that garbage
let g:dashboard_custom_section={}

let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]

" let g:dashboard_custom_footer = [
"             \ strftime('%D %l:%M%P'),
"             \ matchstr(execute('version'), 'NVIM v\zs[^\n]*')
" \]

let g:dashboard_custom_footer = [
    \ system('shuf -n1 ~/.wikidates/$(date +%B_%d) | cut -c 1-120 | tr "\n" " "'),
    \ "NVim" . matchstr(execute('version'), 'NVIM v\zs[^\n]*')
\]


let g:dashboard_session_directory = [ '~/.local/share/nvim/session' ]

" Highlight group
" - DashboardHeader
" - DashboardCenter
" - DashboardShortcut
" - DashboardFooter
highlight DashboardFooter guifg=#C58D76
