" This plugin will let us manage our sessions very easily

" :SLoad       load a session
" :SSave[!]    save a session
" :SDelete[!]  delete a session
" :SClose      close a session

" Add ! to skip the prompt

" Specify where we want Startify to keep our sessions
let g:startify_session_dir = '~/.config/nvim/session'

" Specify what shows up in our menu like this:
let g:startify_lists = [
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'files',     'header': ['   Recent Files']          },
            \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ ]

" Bookmarks
let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ ]

" Let Startify take care of buffers
let g:startify_session_delete_buffers = 1

" Considers the root where there is a .git (if there is one)
let g:startify_change_to_vcs_root = 1

" Enable Unicode support
let g:startify_fortune_use_unicode = 1

" Automatically Update Sessions
let g:startify_session_persistence = 1

" Get rid of empty buffer and quit
let g:startify_enable_special = 0

" Custom Header
let g:startify_custom_header = [
            \ '    ███╗   ██╗    ███████╗     ██████╗     ██╗   ██╗    ██╗    ███╗   ███╗',
            \ '    ████╗  ██║    ██╔════╝    ██╔═══██╗    ██║   ██║    ██║    ████╗ ████║',
            \ '    ██╔██╗ ██║    █████╗      ██║   ██║    ██║   ██║    ██║    ██╔████╔██║',
            \ '    ██║╚██╗██║    ██╔══╝      ██║   ██║    ╚██╗ ██╔╝    ██║    ██║╚██╔╝██║',
            \ '    ██║ ╚████║    ███████╗    ╚██████╔╝     ╚████╔╝     ██║    ██║ ╚═╝ ██║',
            \ '    ╚═╝  ╚═══╝    ╚══════╝     ╚═════╝       ╚═══╝      ╚═╝    ╚═╝     ╚═╝',
            \]
