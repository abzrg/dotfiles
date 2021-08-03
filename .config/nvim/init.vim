" Imports
" -----------------------------------------------------------------------------

runtime ./scripts/plug.vim
runtime ./scripts/fundamentals.vim
runtime ./scripts/visual.vim
runtime ./scripts/help.vim
runtime ./scripts/indentation.vim
runtime ./scripts/hooks.vim
runtime ./scripts/maps.vim
runtime ./scripts/abbreviations.vim

" if has("unix")
"   let s:uname = system("uname -s")
"   " Do Linux stuff
"   if s:uname == "Linux\n"
"     runtime ./linux.vim
"   endif
" endif



" Syntax Theme
" -----------------------------------------------------------------------------

" true colors
if exists("&termguicolors") && exists("&winblend")
    syntax enable
    set termguicolors
    set winblend=0
    set wildoptions=pum
    set pumblend=5
    set background=dark
    " Use nord
    colorscheme codedark
endif

" Add a virtual color-column at the 81th character
" highlight ColorColumn ctermbg=darkmagenta ctermfg=black guibg=darkmagenta guifg=black
" call matchadd('ColorColumn', '\%81v', 1)



" Extras
" -----------------------------------------------------------------------------

set exrc " consider this file as the main init script

" Emmet variable should be loaded here!
let g:user_emmet_leader_key='<A-w>'

" set completeopt+=menu,preview,menuone,noinsert
" set completeopt=menuone,noinsert
