-- local status, hop = pcall(require, "hop")

-- if not status then
--   return
-- end

require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

vim.api.nvim_set_keymap('n', 'ff', ':HopChar2<CR>', { noremap = true })
