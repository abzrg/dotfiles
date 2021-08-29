local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga {
  code_action_prompt = { enable = false },
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round"
}

vim.api.nvim_set_keymap('n', '<C-n>', '<Cmd>Lspsaga diagnostic_jump_next<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-p>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-k>', '<Cmd>Lspsaga hover_doc<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ca', ':Lspsaga code_action<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<leader>ca',
                        ':<C-U>Lspsaga range_code_action<CR>',
                        {noremap = true, silent = true})
-- scroll down hover doc or scroll in definition preview
vim.api.nvim_set_keymap('n', '<C-f>',
                        '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>',
                        {noremap = true, silent = true})
-- scroll up hover doc
vim.api.nvim_set_keymap('n', '<C-b>',
                        '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>',
                        {noremap = true, silent = true})
-- show signature help
vim.api.nvim_set_keymap('n', 'gs', ':Lspsaga signature_help<CR>',
                        {noremap = true, silent = true})
-- close rename win use <C-c> in insert mode or `q` in noremal mode or `:q`
vim.api.nvim_set_keymap('n', '<M-r>', ':Lspsaga rename<CR>',
                        {noremap = true, silent = true})
-- definition peek?
vim.api.nvim_set_keymap('n', '<leader>d', ':Lspsaga preview_definition<CR>',
                        {noremap = true, silent = true})
