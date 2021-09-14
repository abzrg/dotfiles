-- User settings
require('user/mappings')
require('user/plugins')
require('user/hooks')
require('user/junks')
require('user/options')

-- functionality
vim.cmd('filetype indent plugin on')
vim.cmd('syntax on')

-- Set colorscheme
vim.cmd('colo base16-tomorrow-night')

-- Fix formatting problem
vim.api.nvim_exec(
    'autocmd Filetype * setlocal formatoptions-=c formatoptions-=o formatoptions+=l formatoptions+=j', false)
