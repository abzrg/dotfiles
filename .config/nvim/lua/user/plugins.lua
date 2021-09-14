local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path
  })
  execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use { 'windwp/nvim-autopairs', config = [[ require('plugins/autopairs') ]] }
  use { 'norcalli/nvim-colorizer.lua', config = [[ require('plugins/colorizer') ]] }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[ require('plugins/treesitter') ]]
  }
  use { 'EdenEast/nightfox.nvim' }
  use { 'nanotee/nvim-lua-guide' }
  use { 'junegunn/fzf.vim' }
  use { 'wellle/targets.vim' }
  use { 'tpope/vim-commentary', config = [[ require('plugins/vim-commentary') ]] }
  use { 'tpope/vim-fugitive', config = [[ require('plugins/vim-fugitive') ]] }
  use { 'reverseila/vim-rsi' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-surround' }
  use { 'wsdjeg/vim-fetch' }
  use { 'rhysd/committia.vim', config = [[ require('plugins/committia') ]] }
  use { 'ironhouzi/starlite-nvim' }
  -- use {'dhruvasagar/vim-table-mode'}

end)
