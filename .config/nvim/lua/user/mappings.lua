-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Temporarily remove annoying highlighted search item
vim.api.nvim_set_keymap('n', '<BS>', ':nohl<CR>', {noremap = true})

-- Netrw
-- vim.api.nvim_set_keymap('n', '<leader>e', ':30Lexplore<CR>', {silent = true}) -- file manager toggle

-- More Convinience!
vim.api.nvim_set_keymap('n', '<leader>q', ':q!<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>w', ':w<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>z', ':wq!<cr>', {noremap = true})
vim.api.nvim_set_keymap('v', '<M-q>', '<esc>:q!<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', ';', ':', {noremap = true})
vim.api.nvim_set_keymap('v', ';', ':', {noremap = true})

-- Insert Current Time/Date (TODO)
vim.cmd([[ inoremap <M-t> <C-r>=strftime('%D %l:%M%P')<cr> ]])
vim.cmd([[ inoremap <M-T> <C-r>=strftime('%D')<cr> ]])

-- C-h as backslash
vim.api.nvim_set_keymap('i', '<C-h>', '<BS>', {})

-- Open a terminal in a tab
vim.api.nvim_set_keymap('n', ',t', ':tabnew <bar> term<CR>i', {noremap = true})

-- Escape terminal mode easier
vim.api.nvim_set_keymap('t', ',<Esc>', '<C-\\><C-n>',
                        {silent = true, noremap = true})

-- Type lang<C-l> for shebang line
vim.api.nvim_set_keymap('i', '<C-l>',
                        '<Esc>:exe ".!which <cWORD>" <bar> s/^/#!/ <bar> filetype detect <bar> nohlsearch <cr>o',
                        {noremap = true, silent = true})

-- -- New tab like in browsers
vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew<cr>', {noremap = true})

-- -- nnoremap <RightMouse> "+]p

-- Make script executable
vim.api.nvim_set_keymap('n', '<leader>\\',
                        ':silent! exe \'!chmod 755 %\' <bar> redraw <bar> echomsg "Converted to an executable"<cr>',
                        {silent = true, noremap = true})

-- toggle last buffer
vim.cmd([[ nnoremap ''  :b#<cr>zz ]])

-- Open the current directory
vim.api.nvim_set_keymap('n', '-', ':e %:h<CR>', {noremap = true})
vim.cmd([[ cabbr <expr> %% expand('%:p:h') ]])

-- CDC = Change to directory of current file
vim.api.nvim_set_keymap('n', 'cd', ':cd %:p:h<CR>:pwd<CR>', {noremap = true})

-- Easier navigaton between buffers
vim.api.nvim_set_keymap('n', '<M-b>', ':bp<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-n>', ':bn<CR>', {noremap = true})

-- Edit and source this file from anywhere
vim.api.nvim_set_keymap('n', '<leader>e', ':e $MYVIMRC<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>s', ':source $MYVIMRC<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>i', ':PlugInstall<CR>', {noremap = true})

-- Navigate between tabs easily
vim.api.nvim_set_keymap('n', '<Tab>', 'gt', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<S-Tab>', 'gT', {silent = true, noremap = true})

-- Jumplist
vim.api.nvim_set_keymap('n', '<M-o>', '<C-o>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-i>', '<C-i>', {noremap = true, silent = true})

-- if this is a normal buffer use <CR> to toggle folding
vim.api.nvim_set_keymap('n', '<CR>', 'za', {noremap = true, silent = true})

-- Add space bellow or above without leaving normal mode
vim.api.nvim_set_keymap('n', '[<space>',
                        ':<c-u>put!=repeat([\'\'],v:count)<bar>\']+1<cr>',
                        {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', ']<space>',
                        ':<c-u>put =repeat([\'\'],v:count)<bar>\'[-1<cr>',
                        {silent = true, noremap = true})

-- Better vertical line-by-line navigation
vim.api.nvim_set_keymap('n', 'j', 'gj', {silent=true})
vim.api.nvim_set_keymap('n', 'k', 'gk', {silent=true})

-- Fix the behavior of `Y`, to be similar to behavior of `C` and `D`
vim.api.nvim_set_keymap('n', 'Y', 'y$', {})

-- Make the behaviour of arrow key and C-n/p the same
vim.api.nvim_set_keymap('c', '<C-n>', 'wildmenumode() ? "\\<c-n>" : "\\<down>"', {noremap = true, expr = true})
vim.api.nvim_set_keymap('c', '<C-p>', 'wildmenumode() ? "\\<c-p>" : "\\<up>"', {noremap = true, expr = true})

-- Use <C-l/h> as ;/, (absolute direction) -- source: https://superuser.com/a/1430972
vim.api.nvim_set_keymap('n', '<C-h>', '(getcharsearch().forward ? \',\' : \';\')', {expr = true, noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '(getcharsearch().forward ? \';\' : \',\')', {expr = true, noremap = true})

-- Use somewhat unused H and L key for going to the begining/end of the line
vim.api.nvim_set_keymap('n', 'H', '^', {noremap = true})
vim.api.nvim_set_keymap('n', 'L', '$', {noremap = true})

-- Keep it centered + make n and N's direction absolute -- source: https://superuser.com/a/1430972 + primeagen
vim.api.nvim_set_keymap('n', 'n', '(v:searchforward ? \'nzzzv\' : \'Nzzzv\')', {expr = true, noremap = true})
vim.api.nvim_set_keymap('n', 'N', '(v:searchforward ? \'Nzzzv\' : \'nzzzv\')', {expr = true, noremap = true})
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', {noremap = true})

-- Quick Fix List mappings + Centered
vim.api.nvim_set_keymap('n', '<C-j>', ':cnext<CR>zzzv', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':cprevious<CR>zzzv', {noremap = true})
vim.api.nvim_set_keymap('n', '<Up>', ':cnf<CR>zzzv', {noremap = true})
vim.api.nvim_set_keymap('n', '<Down>', ':cpf<CR>zzzv', {noremap = true})

-- C style comment with pressing Ctrl-/
vim.api.nvim_set_keymap('i', '<C-_>', '/**/<Left><Left>', {noremap = true})

-- Use the far more useful visual block selection
vim.api.nvim_set_keymap('n', 'v', '<C-v>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-v>', 'v', {noremap = true})
vim.api.nvim_set_keymap('x', 'v', '<C-V>', {noremap = true})
vim.api.nvim_set_keymap('x', '<C-V>', 'v', {noremap = true})
-- Make BS/DEL work as expected in visual modes (i.e. delete the selected text)...
vim.api.nvim_set_keymap('x', '<BS>', 'x', {})
-- Make vaa select the entire file...
vim.api.nvim_set_keymap('x', 'aa', 'VGo1G', {})

-- Comment (C-style) visually selected area
-- ref: https://vi.stackexchange.com/a/18170/30665
vim.api.nvim_set_keymap('x', '#', 's/* <c-r>" */<esc>', {noremap = true})

-- Easily surround stuff in visual mode
vim.api.nvim_set_keymap('v', '*', 'S*', {})
vim.api.nvim_set_keymap('v', '_', 'S_', {})
vim.api.nvim_set_keymap('v', '\'', 'S\'', {})
vim.api.nvim_set_keymap('v', '"', 'S"', {})
vim.api.nvim_set_keymap('v', '`', 'S`', {})
vim.api.nvim_set_keymap('v', '(', 'S(', {})
vim.api.nvim_set_keymap('v', '[', 'S[', {})
vim.api.nvim_set_keymap('x', '``', ':s/\\V\\v(.*)/```\\r\\1\\r```/ | nohl<CR>', {}) -- add markdown's codeblock triple backtics

-- Undo break points
vim.api.nvim_set_keymap('i', ',', ',<C-g>U', {noremap = true})
vim.api.nvim_set_keymap('i', '.', '.<C-g>U', {noremap = true})
vim.api.nvim_set_keymap('i', '!', '!<C-g>U', {noremap = true})
vim.api.nvim_set_keymap('i', '?', '?<C-g>U', {noremap = true})

-- Moving text
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', {noremap = true})
vim.api.nvim_set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', {noremap = true})
vim.api.nvim_set_keymap('i', '<A-C-j>', '<esc>:m .+1<CR>==a', {noremap = true})
vim.api.nvim_set_keymap('i', '<A-C-k>', '<esc>:m .-2<CR>==a', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-C-k>', ':m .-2<CR>==', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-C-j>', ':m .+1<CR>==', {noremap = true})

-- Duplicate code
vim.api.nvim_set_keymap('x', 'g<A-S-j>', ':t\'> <Bar> norm \'[O<Esc>',
                        {noremap = true})
vim.api.nvim_set_keymap('x', 'g<A-S-k>', ':t\'> <Bar> norm \'[O<Esc>',
                        {noremap = true})
vim.api.nvim_set_keymap('x', '<A-S-j>', ':t\'> <Bar> norm \'[<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('x', '<A-S-k>', ':t\'> <Bar> norm \'[<CR>',
                        {noremap = true})

vim.api.nvim_set_keymap('n', 'g<A-S-j>', ':t\'> <Bar> norm \'[O<Esc>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', 'g<A-S-k>', ':t\'> <Bar> norm \'[O<Esc>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<A-S-j>', ':t\'> <Bar> norm \'[<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<A-S-k>', ':t\'> <Bar> norm \'[<CR>',
                        {noremap = true})

-- Search and replace with dot
vim.api.nvim_set_keymap('n', 'cn', '*``cgn', {noremap = true})
vim.api.nvim_set_keymap('n', 'cN', '*``cgN', {noremap = true})

-- Access to the meaning of the word via sdcv
vim.api.nvim_set_keymap('n', ',w', 'yiw <bar> :!vimdic<CR>g', {})

-- Easier regex search
-- vim.api.nvim_set_keymap('n', '/', '/\\v', {noremap = true})

-- mark position before search (Get back where you were with 's)
vim.api.nvim_set_keymap('n', '/', 'mszv/\\v', {noremap = true})

-- Throw away in to the black hole! (now, c does'nt put text into yank register)
vim.api.nvim_set_keymap('n', 'c', '"_c', {noremap = true})

-- Stay in visual mode after indenting the selected area
vim.api.nvim_set_keymap('v', '<', '<gv', {})
vim.api.nvim_set_keymap('v', '>', '>gv', {})

-- Perform dot commands over visual blocks:
vim.api.nvim_set_keymap('v', '.', ':normal .<CR>', {noremap = true})

-- Spell-check set to <leader>o, 'o' for 'orthography':
vim.api.nvim_set_keymap('n', '<leader>o',
                        ':setlocal spell! spelllang=en_us<CR>', {})

-- Save file as sudo on files that require root permission
if vim.fn.has('nvim') == 1 then
  vim.cmd(
      [[ cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit! ]])
else
  vim.cmd(
      [[ cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit! ]])
end

-- Search & Replace (\<\> is word boundary)
vim.api.nvim_set_keymap('n', 'S', 'yiw:%s///g<Left><Left><Left><C-r>"<Right>',
                        {noremap = true})

-- Search in visually selected area
vim.api.nvim_set_keymap('v', '/', '<Esc>/\\%V', {noremap = true})

-- Get rid of accidental jump to ex mode and easily wrap text
vim.api.nvim_set_keymap('', 'Q', 'gq', {})

-- Check shell scripts with shell check
vim.api.nvim_set_keymap('', ',s', ':!clear && shellcheck -x %<CR>', {})

-- Compile document, be it groff/LaTeX/markdown/etc.
vim.api.nvim_set_keymap('', ',c', ':w! \\| !compiler --<c-r>%"<CR>', {})

-- Open corresponding .pdf/.html or preview
vim.api.nvim_set_keymap('', ',p', ':!opout <c-r>%<CR><CR>', {})

-- Toggle numbering
vim.cmd([[
function! ToggleNumber()
  if &number == '1' && &relativenumber == '1'
    set rnu! nu!
    echo --Number and relative number disabled"
  elseif &number == '1' && &relativenumber == '0'
    set nu!
    echo --Number disabled"
  else
    set nu!
    echo --Number enabled"
  endif
endfunction
nnoremap <F9> :call ToggleNumber()<CR>
]])

-- Toggle syntax highlighting
vim.cmd([[
map <silent> <F7> :if exists("g:syntax_on") \| syntax off <CR> else \| syntax enable \| endif <CR>
]])

-- tab completion
-- local function t(str)
--     return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end
-- function _G.smart_tab()
--     return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
-- end
-- vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})

