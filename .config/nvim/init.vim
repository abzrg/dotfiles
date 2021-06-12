" # Plugin manager {{{1
" ## Check if plugins are installed {{{2
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

" ## Install plugins with Vim-plug plugin manager {{{2
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
" ## ## Tim Pope's {{{3
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-rsi'
" ## ## Language releated {{{3
    Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' } " python
    Plug 'lervag/vimtex' " latex
    Plug 'mattn/emmet-vim' " html and css
    Plug 'bfrg/vim-cpp-modern'
" ## ## Find tools {{{3
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'wsdjeg/vim-fetch' " Make Vim handle line and column numbers in file
                            " names with a minimum of fuss
" ## ## Auto Completion {{{3
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'honza/vim-snippets'
" ## ## Git {{{3
    Plug 'tpope/vim-fugitive'
    " Plug 'airblade/vim-gitgutter'
" ## ## Colors and syntax highlighting {{{3
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    Plug 'lervag/vim-foam'
" ## ## Misc {{{3
    Plug 'junegunn/goyo.vim' " Easy reading
    Plug 'itchyny/lightline.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'junegunn/limelight.vim'
call plug#end()
"
" # Some basic settings {{{1

let mapleader = ' '
" Setting python3 path
let g:python3_host_prog = '/usr/bin/python3'
syntax on"
set nocompatible
filetype plugin on"

colo codedark
hi Folded guifg=#969896

" Add a virtual color-column at the 81th character
highlight ColorColumn ctermbg=darkmagenta ctermfg=black guibg=darkgrey guifg=black
call matchadd('ColorColumn', '\%81v', 1)

" # Options {{{1

set autoread " Always reload buffer when external changes detected
set backspace=indent,eol,start " BS past autoindents, line boundaries, and even the start of insertion
set clipboard+=unnamedplus
set cpoptions+=$
set encoding=utf-8
set fileformat=unix
set foldmethod=marker
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=0
set mouse=a
set number relativenumber
set numberwidth=5
set nobackup
set noequalalways
set nojoinspaces
set noshowmode
set noswapfile
set nowritebackup
set scrolloff=3
set shortmess=filnxtToOI
set signcolumn=auto
set smartcase
set splitbelow splitright
set termguicolors
set title
set thesaurus+=~/.config/nvim/moby-words.txt

" ## Indentation{{{2
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" ## Fix smartindent stupidities {{{2
set autoindent "Retain indentation on next line
set smartindent "Turn on autoindenting of blocks

let g:vim_indent_cont = 0 " No magic shifts on Vim line continuations

" And no shift magic on comments...
nmap <silent>  >>  <Plug>ShiftLine
nnoremap <Plug>ShiftLine :call ShiftLine()<CR>
function! ShiftLine() range
    set nosmartindent
    exec "normal! " . v:count . ">>"
    set smartindent
    silent! call repeat#set( "\<Plug>ShiftLine" )
endfunction

" ## Some completion settings in command mode {{{2

" What to ignore in completion
    set wildignore=*.git/*,*.tags,tags,*.o,*.class
" Case insensitive copmpletion
    set wildignorecase
" How completion is done
    set wildmenu
" How completion is done
    set wildmode=longest,list,full
"Adjust completions to match case
    set infercase

" ## Append directories to vim's Path {{{2
set path+=**
set path+=/home/ali/.config/nvim

" ## Show those damn hidden characters {{{2
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,tab:▸\ ,trail:•,
set list


" # Key-bindings {{{1

" Easier edition and source of the neovim config
"" M == Alt
"" <M-e> == Alt-e
"" nmap == normal mode mapping (only does what it suppose to do, when you are
""         in normal mode)
"" nnoremap == n + nore (not recurssive) + map

" Open and close folds with tab
nnoremap <Tab> zi

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

nnoremap H ^
nnoremap L g_

vnoremap K k

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Move the search item's position to the middle of the page
"" zz => move the text around the cursor to the middle of the page
"" zt =>                                        top
"" zb =>                                        bottom
nnoremap n nzzzv
nnoremap N Nzzzv

" Access to the meaning of the word via sdcv
map ,w yiw <bar> :!vimdic<CR>

" Easier regex search
" nnoremap / /\v

" Throw away in to the black hole! (now, c does'nt put text into yank register)
nnoremap c "_c

" Stay in visual mode after indenting the selected area
"" vmap == visual mode mapping
vmap < <gv
vmap > >gv

" Toggle numbering
map <F9> :set rnu! nu!<CR>

map <silent> <F7> :if exists("g:syntax_on") <Bar>
    \ syntax off <CR>
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

" Get rid of accidental jump to ex mode and easily wrap text
map Q gq

" ## Some Abbreviation for exiting vim {{{2
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

" ## Symbol Shortcuts {{{2
" Greek {{{3
map! <C-v>GA Γ
map! <C-v>DE Δ
map! <C-v>TH Θ
map! <C-v>LA Λ
map! <C-v>XI Ξ
map! <C-v>PI Π
map! <C-v>SI Σ
map! <C-v>PH Φ
map! <C-v>PS Ψ
map! <C-v>OM Ω
map! <C-v>al α
map! <C-v>be β
map! <C-v>ga γ
map! <C-v>de δ
map! <C-v>ep ε
map! <C-v>ze ζ
map! <C-v>et η
map! <C-v>th θ
map! <C-v>io ι
map! <C-v>ka κ
map! <C-v>la λ
map! <C-v>mu μ
map! <C-v>xi ξ
map! <C-v>pi π
map! <C-v>rh ρ
map! <C-v>si σ
map! <C-v>ta τ
map! <C-v>ps ψ
map! <C-v>om ω
map! <C-v>ph ϕ
" Math {{{3
map! <C-v>ll →
map! <C-v>hh ⇌
map! <C-v>kk ↑
map! <C-v>jj ↓
map! <C-v>= ∝
map! <C-v>~ ≈
map! <C-v>!= ≠
map! <C-v>!> ⇸
map! <C-v>~> ↝
map! <C-v>>= ≥
map! <C-v><= ≤
map! <C-v>0  °
map! <C-v>ce ¢
map! <C-v>*  •
map! <C-v>co #

" ## Make Visual modes work better {{{2

" Visual Block mode is far more useful that Visual mode (so swap the commands)...
nnoremap v <C-V>
nnoremap <C-V> v
xnoremap v <C-V>
xnoremap <C-V> v

"Square up visual selections...
set virtualedit=block

" Make BS/DEL work as expected in visual modes (i.e. delete the selected text)...
xmap <BS> x

" Make vaa select the entire file...
xmap aa VGo1G

" Make q extend to the surrounding string...
xmap  q   "_y:call ExtendVisualString()<CR>

let s:closematch = [ '', '', '}', ']', ')', '>', '/', "'", '"', '`' ]
let s:ldelim = '\< \%(q [qwrx]\= \| [smy] \| tr \) \s* \%( \({\) \| \(\[\) \| \((\) \| \(<\) \| \(/\) \) \| \(''\) \| \("\) \| \(`\)'
let s:ldelim = substitute(s:ldelim, '\s\+', '', 'g')

function! ExtendVisualString ()
    let [lline, lcol, lmatch] = searchpos(s:ldelim, 'bWp')
    if lline == 0
        return
    endif
    let rdelim = s:closematch[lmatch]
    normal `>
    let rmatch = searchpos(rdelim, 'W')
    normal! v
    call cursor(lline, lcol)
endfunction

" ## Better help {{{2
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

" ## Call to scripts and external programs{{{2

" Check shell scripts with shell check
map ,s :!clear && shellcheck -x %<CR>

" Compile document, be it groff/LaTeX/markdown/etc.
map ,c :w! \| !compiler "<c-r>%"<CR>

" Open corresponding .pdf/.html or preview
map ,p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files
" whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" # Auto Commands and the like {{{1

" ## Jump to the last known cursor position {{{2
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" ## Ensure files are read as what I want {{{2
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" ## xrdb update on save {{{2
autocmd BufRead,BufNewFile xresources,xdefaults set filetype=xdefaults
autocmd BufWritePost .Xresources,.Xdefaults,.xresources,.xdefaults !xrdb %

" ## Disables automatic commenting on newline {{{2
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" ## Completion during search (via Command window) {{{2

function! s:search_mode_start()
    cnoremap <tab> <c-f>:resize 1<CR>a<c-n>
    let s:old_complete_opt = &completeopt
    let s:old_last_status = &laststatus
    set completeopt-=noinsert
    set laststatus=0
endfunction

function! s:search_mode_stop()
    try
        silent cunmap <tab>
    catch
    finally
        let &completeopt = s:old_complete_opt
        let &laststatus  = s:old_last_status
    endtry
endfunction

augroup SearchCompletions
    autocmd!
    autocmd CmdlineEnter [/\?] call <SID>search_mode_start()
    autocmd CmdlineLeave [/\?] call <SID>search_mode_stop()
augroup end


" # Settings related to plugins {{{1
" ## FUGITIVE {{{2

nnoremap <leader>gs :G<CR>

" s :: stage
" U :: unstage

" :Gcommit :: commit canges
" :Gpush :: to push the unpushed changes

" Vim diff
" dv :: go to diff mode to resolve conflicts
" when cursor is on the <<<<<<< HEAD
" get diff from the right window (b)
nnoremap <leader>gl :diffget //3<CR>
" get diff from the left window (a)
nnoremap <leader>gh :diffget //2<CR>
" do 'CTRL-w O' to jump back after the diff page


" ## Netrw {{{2

let g:netrw_sort_by        = 'time'
let g:netrw_sort_direction = 'reverse'
let g:netrw_banner         = 0
let g:netrw_liststyle      = 3
let g:netrw_browse_split   = 3
let g:netrw_fastbrowse     = 1
let g:netrw_sort_by        = 'name'
let g:netrw_sort_direction = 'normal'


" ## Limelight configuration {{{2

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = '#444444'

" Default dimming: 0.5
let g:limelight_default_coefficient = 0.7

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1


" ## HEXOKINASE {{{2
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


" ## FZF {{{2
nnoremap <M-f> :Files<CR>
nnoremap <M-h> :Files ~<CR>
nnoremap <M-g> :GFiles!<CR>
nnoremap <leader>s :BLines<CR>
nnoremap <leader>l :Buffers<CR>
let g:fzf_layout = { 'down': '~30%' }
" ## Table-mode {{{2
"let g:table_mode_corner                 = '|'
"let g:table_mode_corner_corner          = '|'
"let g:table_mode_header_fillchar        = '='
"let g:table_mode_fillchar               = '-'
"let g:table_mode_align_char             = ':'
"let g:table_mode_cell_text_object_a_map = 'ac'
"let g:table_mode_cell_text_object_i_map = 'ic'
"let g:table_mode_syntax                 = 1
"let g:table_mode_delimiter              = ' \{2,}'

"nmap <TAB> :TableModeToggle<CR>
"xmap <TAB> <ESC><TAB>gv
"xmap <silent> T :<C-U>call ToggleTabularization()<CR>

"function! ToggleTabularization ()
"    let range = getpos('''<')[1] .','. getpos('''>')[1]
"    if getline("'<") =~ '\\\@!|'
"        silent TableModeEnable
"        exec 'silent! ' . range . 's/[-= ]\@<=+\|+[-= ]\@=/  /g'
"        exec 'silent! ' . range . 's/[-= ]|[-= ]\|[^\\]\zs|[-= ]\|[-= ]|/  /g'
"        exec 'silent! ' . range . 's/\s\+$//'
"        nohlsearch
"        TableModeDisable
"    else
"        TableModeEnable
"        '<,'>Tableize
"    endif
"    normal gv
"endfunction


" ## GOYO {{{2
" Goyo plugin makes text more readable when writing prose:
map ,g :Goyo \| set linebreak<CR>


" ## COMMENTARY {{{2
" Fix commentary for C and JSON files
autocmd FileType  cpp setlocal commentstring=//\ %s
autocmd FileType    c setlocal commentstring=//\ %s
autocmd FileType foam setlocal commentstring=//\ %s
autocmd FileType json setlocal commentstring=//\ %s
autocmd FileType sql  setlocal commentstring=--\ %s


" ## EASY MOTION {{{2
nmap <C-f> <Plug>(easymotion-overwin-f2)
map <Space>m <Plug>(easymotion-bd-w)
" ## LIGHTLINE {{{2
let g:lightline = {
\   'colorscheme' : 'Tomorrow_Night',
\   'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
\   },
\   'component': {
\       'charvaluehex': '0x%B'
\   },
\   'mode_map': {
\       'n' : 'N',
\       'i' : 'I',
\       'R' : 'R',
\       'v' : 'V',
\       'V' : 'VL',
\       "\<C-v>": 'VB',
\       'c' : 'C',
\       's' : 'S',
\       'S' : 'SL',
\       "\<C-s>": 'SB',
\       't': 'T',
\   },
\ }
" ## EMMET {{{2
let g:user_emmet_leader_key='<A-w>'
" ## VIMTEX {{{2
" VimtexCompile: Start compiling the LaTex Code (in continuous mode
"                since we set it above)
" VimtexView: Open the compiled pdf using the
" VimtexErrors: Display errors (if any) in the current file
let g:vimtex_view_method = 'zathura'
let g:tex_flavor  = 'xelatex'
"let g:vimtex_quickfix_enabled = '0'
let g:vimtex_compiler_progname = 'nvr'
autocmd FileType tex map <leader>c :VimtexCompile<CR>
" ## COC {{{2
" Disable COC
nnoremap <silent> <Space>c :CocDisable<CR>

" Specify the coc-plugins here to be installed upon first run
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-prettier',
    \ 'coc-jedi',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-explorer',
    \ 'coc-texlab',
    \ 'coc-markdownlint',
    \ 'coc-cmake',
    \ 'coc-sql',
    \ ]

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <M-p> :Prettier<CR>

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
"}}}
