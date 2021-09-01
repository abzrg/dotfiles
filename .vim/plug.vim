call plug#begin('~/.local/share/vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'

Plug 'wsdjeg/vim-fetch'
Plug 'lervag/vim-foam'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'lifepillar/vim-mucomplete'
Plug 'cohama/lexima.vim'

Plug 'tomasiser/vim-code-dark'
Plug 'dense-analysis/ale'

call plug#end()
