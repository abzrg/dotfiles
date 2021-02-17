call plug#begin('~/.config/nvim/plugged')
" Colorscheme
    Plug 'srcery-colors/srcery-vim'
    Plug 'romainl/Apprentice'
    Plug 'lifepillar/vim-solarized8'
    Plug 'chriskempson/vim-tomorrow-theme'
    " Plug 'flazz/vim-colorschemes'
" Commenting
    Plug 'tpope/vim-commentary'
" OpenFOAM
    Plug 'lervag/vim-foam'
" Motions
    Plug 'easymotion/vim-easymotion'
" Git
"   Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim' " <Spc>./, ; ;Files!
    " Plug 'jremmen/vim-ripgrep'
" Misc
    " Plug 'avakarev/vim-watchdog'
    Plug 'tomasiser/vim-code-dark'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/goyo.vim'
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    " Plug 'vimwiki/vimwiki'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-rsi'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'preservim/nerdtree'
    Plug 'lervag/vimtex'
    " Plug 'trapd00r/vim-syntax-vidir-ls'
    " Plug 'trapd00r/vidir'
" Syntax highlighting
    Plug 'sheerun/vim-polyglot'
" Snippets + Autocompletion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'honza/vim-snippets'
    Plug 'tpope/vim-surround'
    Plug 'alvan/vim-closetag'
    Plug 'mattn/emmet-vim'
call plug#end()

"" Mapping
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
