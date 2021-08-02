"  Check if vim-plug is installed
if ! filereadable(system('echo -n "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
        silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall
endif

if has("nvim")
    let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-fugitive'
Plug 'wsdjeg/vim-fetch' | " vim .bashrc:23 -- goes to line 23 when enter the file
Plug 'junegunn/goyo.vim'
Plug 'mattn/emmet-vim'
Plug 'cohama/lexima.vim'
Plug 'alvan/vim-closetag'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'junegunn/limelight.vim'
Plug 'itchyny/lightline.vim'
Plug 'rhysd/committia.vim' | " A Vim plugin for more pleasant editing on commit messages
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'pangloss/vim-javascript'
Plug 'lervag/vim-foam'
Plug 'thinca/vim-localrc' | " Enable configuration file of each directory

if !has("vscode") && has("nvim")
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
endif

if has("nvim")
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'mhartington/formatter.nvim'
endif

call plug#end()
