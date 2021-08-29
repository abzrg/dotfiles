-- User settings
require('user/mappings')
require('user/plugins')
require('user/hooks')
require('user/statusline')
require('user/junks')
require('user/options')

-- functionality
vim.cmd('filetype indent plugin on')
vim.cmd('syntax on')

-- Set colorscheme
vim.cmd('colo nvcode')

-- Fix formatting problem
vim.api.nvim_exec(
    'autocmd Filetype * setlocal formatoptions-=c formatoptions-=o', false)

vim.cmd([[hi TSComment gui=italic]])
vim.cmd([[hi FloatShadow guibg=none]])
