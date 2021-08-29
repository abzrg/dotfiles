-- Disable the plugin while in dashboard
vim.g.indentLine_fileTypeExclude = { 'dashboard', 'text', 'packer' }
vim.g.indentLine_bufTypeExclude  = { 'help', 'terminal', 'packer' }

-- Back to default value. value of 2 hides the quotes in json files
vim.g.indentLine_setConceal = 0

-- Disable indentline for terminal buffers
vim.cmd([[autocmd TermOpen * IndentLinesDisable]])
