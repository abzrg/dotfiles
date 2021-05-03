" Set the leader key to be space (default: \)
let mapleader = ' '


"====[ Plugin manager ]========================================================

" Check if plugins are installed
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

" Install plugins with Vim-plug plugin manager
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
" {{ Tim Pope's }}
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-rsi'
" {{ Language releated }}
    Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' } " python
    Plug 'lervag/vimtex' " latex
    Plug 'mattn/emmet-vim' " html and css
" {{ Snippets }}
    Plug 'honza/vim-snippets'

" {{ Find tools }}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
" {{ Auto Completion }}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
" {{ Git }}
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
" {{ Colors and syntax highlighting }}
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    Plug 'lervag/vim-foam'
    Plug 'chriskempson/base16-vim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
        " To isntall the highlghting features for a language (say python):
        " `: TSInstall python`
    Plug 'nvim-treesitter/playground'
        " Install tree-sitter on system via package manager and update vim-plug
" {{ Misc }}
    Plug 'junegunn/goyo.vim' " Easy reading
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'easymotion/vim-easymotion'
call plug#end()


"====[ Some basic settings ]===================================================

syntax on
set nocompatible
filetype plugin on

" Base16 colors
let base16colorspace=256
let g:base16_shell_path="~/.config/base16-shell/scripts/"
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set background=dark
highlight Normal guibg=NONE
highlight Comment guifg=gray
"highlight MatchParen guibg=darkgray

" Add a virtual color-column at the 81th character
highlight ColorColumn guibg=darkmagenta guifg=black ctermbg=darkmagenta ctermfg=black
call matchadd('ColorColumn', '\%81v', 1)

" Vim options
set clipboard+=unnamedplus
set cpoptions+=$
set encoding=utf-8
set fileformat=unix
set foldmethod=marker
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set number relativenumber
set nobackup
set noshowmode
set noswapfile
set nowritebackup
set scrolloff=5
set shortmess+=I
set signcolumn=auto
set smartcase
set splitbelow splitright
set termguicolors
set title
set thesaurus+=~/.config/nvim/moby-words.txt

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Some completion settings in command mode
set wildignore=*.git/*,*.tags,tags,*.o,*.class  " What to ignore in completion
set wildignorecase                              " Case insensitive copmpletion
set wildmenu                                    " How completion is done
set wildmode=longest,list,full                  " How completion is done

" Append directories to vim's Path
set path+=**
set path+=/home/ali/.config/nvim

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,trail:•
set list


"====[ Key-bindings ]==========================================================

" Easier edition and source of the neovim config
"" M == Alt
"" <M-e> == Alt-e
"" nmap == normal mode mapping (only does what it suppose to do, when you are
""         in normal mode)
"" nnoremap == n + nore (not recurssive) + map
nnoremap <M-e> :e $MYVIMRC<CR>
nnoremap <M-s> :source $MYVIMRC<CR>

" Easier jump between two files
nnoremap <silent> <M-Tab> :b#<CR>

" Even more convinience (use ; to go to the command mode)
nnoremap ; :

" Better vertical line-by-line navigation
nmap j gj
nmap k gk

" Fix the behaviour of `Y`, to be similar to behaviour of `C` and `D`
nmap Y y$

" Move the search item's position to the middle of the page
"" zz => move the text around the cursor to the middle of the page
"" zt =>                                        top
"" zb =>                                        bottom
nnoremap n nzzzv
nnoremap N Nzzzv

" Access to the meaning of the word via sdcv
map ,w yiw <bar> :!vimdic<CR>

" Easier regex search
nnoremap / /\v

" Throw away in to the black hole! (now, c does'nt put text into yank register)
nnoremap c "_c

" Stay in visual mode after indenting the selected area
"" vmap == visual mode mapping
vmap < <gv
vmap > >gv

" Toggle numbering
map <F9> :set rnu! nu!<CR>

" Toggle syntax highlighting (+ TreeSitter)
map <silent> <F7> :if exists("g:syntax_on") <Bar>
    \ syntax off <Bar> TSToggleAll highlight <CR>
    \ else <Bar>
    \ syntax enable <Bar>
    \ endif <CR>

" Function for toggling the bottom statusbar:
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>b :call ToggleHiddenAll()<CR>

" Temporarily remove annoying highlighted search item
nmap <silent> <BS> :nohlsearch<CR>

" Perform dot commands over visual blocks:
vnoremap . :normal .<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>


" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Replace all instance of the word under the cursor with S
nnoremap S yiw:%s///g<Left><Left><Left><C-r>"

" Some Abbreviation for exiting vim
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall qall
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q

"---- Call to scripts and external programs -------------------------
" Check shell scripts with shell check
map ,s :!clear && shellcheck -x %<CR>

" Compile document, be it groff/LaTeX/markdown/etc.
map ,c :w! \| !compiler "<c-r>%"<CR>

" Open corresponding .pdf/.html or preview
map ,p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files
" whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %


"====[ Auto Commands other stuff ]=============================================
" This will jump to the last known cursor position
" source: https://askubuntu.com/a/202077
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Ensure files are read as what I want:
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufRead,BufNewFile xresources,xdefaults set filetype=xdefaults
autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %

" Recompile dwmblocks on config edit.
autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Setting python3 path
let g:python3_host_prog = '/usr/bin/python3'

"---- Better help ------------------------------------------------------------
"" Navigate through helpgrep's result with arrow keys
nmap <silent> <RIGHT>           :cnext<CR>
nmap <silent> <RIGHT><RIGHT>    :cnfile<CR><C-G>
nmap <silent> <LEFT>            :cprev<CR>
nmap <silent> <LEFT><LEFT>      :cnfile<CR><C-G>

"" Open help in a new tab instead of a split
augroup HelpInTabs
    autocmd!
    autocmd BufEnter *.txt call HelpInNewTab()
augroup END

function! HelpInNewTab()
    if &buftype == 'help'
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction


"====[ Settings related to plugins ]===========================================

"---- HEXOKINASE --------------------------------------------------------------
let g:Hexokinase_refreshEvents = ['InsertLeave']
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]
let g:Hexokinase_highlighters = ['backgroundfull']
" Reenable hexokinase on enter
" autocmd VimEnter * HexokinaseTurnOn
let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript']


"---- FZF ---------------------------------------------------------------------
nnoremap <M-f> :Files<CR>
nnoremap <M-h> :Files ~<CR>
nnoremap <M-g> :GFiles!<CR>
nnoremap <C-f> :BLines<CR>
nnoremap <C-l> :Buffers<CR>
let g:fzf_layout = { 'down': '~30%' }


"---- AIRLINE -----------------------------------------------------------------
" Disable vim-airline integration with coc:
    let g:airline#extensions#coc#enabled = 0
" Change error symbol:
    let airline#extensions#coc#error_symbol = 'Error:'
" Change warning symbol:
    let airline#extensions#coc#warning_symbol = 'Warning:'
" Change error format:
    let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
" Change warning format:
    let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
"  Tabs
    let airline#extensions#tabline#enabled=1
    let airline#extensions#tabline#fnamemode=':t'

    let g:airline#extensions#hunks#non_zero_only = 1
    let g:airline#extensions#hunks#non_zero_only = 1


"---- TREESITTER --------------------------------------------------------------
" Trisitter: better syntax highlighting
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
au FileType foam TSToggleAll highlight


"---- GOYO --------------------------------------------------------------------
" Goyo plugin makes text more readable when writing prose:
map <leader>g :Goyo \| set linebreak<CR>


"---- COMMENTARY --------------------------------------------------------------
" Fix commentary for C and JSON files
autocmd FileType  cpp setlocal commentstring=//\ %s
autocmd FileType    c setlocal commentstring=//\ %s
autocmd FileType foam setlocal commentstring=//\ %s
autocmd FileType json setlocal commentstring=//\ %s


"---- EASY MOTION -------------------------------------------------------------
nmap f <Plug>(easymotion-overwin-f2)
map <Space>m <Plug>(easymotion-bd-w)


"---- EMMET -------------------------------------------------------------------
let g:user_emmet_leader_key='<A-w>'


"---- VIMTEX ------------------------------------------------------------------
" VimtexCompile: Start compiling the LaTex Code (in continuous mode
"                since we set it above)
" VimtexView: Open the compiled pdf using the
" VimtexErrors: Display errors (if any) in the current file
let g:vimtex_view_method = 'zathura'
let g:tex_flavor  = 'latex'
"let g:vimtex_quickfix_enabled = '0'
let g:vimtex_compiler_progname = 'nvr'
autocmd FileType tex map <leader>c :VimtexCompile<CR>


"---- COC ---------------------------------------------------------------------
" Disable COC
nnoremap <silent> <Space>c :CocDisable<CR>

" Specify the coc-plugins here to be installed upon first run
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-prettier',
    \ 'coc-jedi',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-json',
    \ 'coc-explorer',
    \ 'coc-vimtex',
    \ 'coc-sh',
    \ 'coc-markdownlint',
    \ 'coc-cmake',
    \ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming. (apparently only works for )
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>cd  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>cp  :<C-u>CocListResume<CR>

" coc-snippets
" Use <leader>j for both expand and jump (make expand higher priority.)
    imap <M-j> <Plug>(coc-snippets-expand-jump)

" Correct C-style json commenting
    autocmd FileType json syntax match Comment +\/\/.\+$+

" Explorer (file tree pane on the left similar to that in vscode)
nnoremap <leader>f :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
