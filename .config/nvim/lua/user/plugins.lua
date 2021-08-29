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
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {'neovim/nvim-lspconfig', config = [[ require('plugins/lspconfig') ]]}
  use {'glepnir/lspsaga.nvim', config = [[ require('plugins/lspsaga') ]]}
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[ require('plugins/treesitter') ]]
  }
  -- A format runner for neovim, written in lua.
  use {
    'mhartington/formatter.nvim',
    config = [[ require('plugins/formatter') ]]
  }
  -- Use treesitter to auto close and auto rename html tag
  use {
    'windwp/nvim-ts-autotag',
    opt = true,
    event = {
      'FileType html', 'FileType javascript', 'FileType jsx', 'FileType xml'
    },
    config = [[ require('plugins/ts-autotag') ]]
  }
  -- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.
  -- use 'JoosepAlviste/nvim-ts-context-commentstring'
  -- Rainbow parentheses for neovim using tree-sitter
  use {'p00f/nvim-ts-rainbow', config = [[ require('plugins/ts-rainbow') ]]}

  -- completion
  use {
    'hrsh7th/nvim-compe',
    opt = true,
    event = 'InsertEnter *',
    config = [[ require('plugins/compe') ]]
  }
  use 'hrsh7th/vim-vsnip'
  use "rafamadriz/friendly-snippets"
  use {'windwp/nvim-autopairs', config = [[ require('plugins/autopairs') ]]}
  -- telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    config = [[ require('plugins/telescope') ]]
  }
  use 'kyazdani42/nvim-web-devicons'
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons', config = [[ require('plugins/nvim-tree')]]}

  use {'karb94/neoscroll.nvim', config = [[ require('plugins/neoscroll') ]]}

  use {'nacro90/numb.nvim', config = [[ require('plugins/numb') ]]}

  -- tabout
  use {
    'abecodes/tabout.nvim',
    config = [[ require('plugins/tabout') ]],
    wants = {'nvim-treesitter'}, -- or require if not used so far
    after = {"nvim-compe", "vim-vsnip"} -- if a completion plugin is using tabs load it before
  }

  use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim'}

  -- statusline
  use {'hoob3rt/lualine.nvim', config = [[ require('plugins/lualine') ]]}

  -- use {'lewis6991/gitsigns.nvim', config = [[ require('plugins/gitsigns') ]]}

  use {'phaazon/hop.nvim', config = [[ require('plugins/hop') ]]}
  use {
    'christianchiarulli/nvcode-color-schemes.vim',
    config = [[ require('plugins/nvcode-color-schemes') ]]
  }

  use {'ironhouzi/starlite-nvim', config = [[ require('plugins/starlite') ]]}

  -- A vim plugin to display the indention levels with thin vertical lines
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = [[ require('plugins/indent-blankline') ]]
  }
  -- use {'Yggdroot/indentLine', config = [[ require('plugins/indentLine') ]]}

  use {
    'norcalli/nvim-colorizer.lua',
    config = [[ require('plugins/colorizer') ]]
  }

  use 'nanotee/nvim-lua-guide'

  -- fzf
  -- use 'junegunn/fzf', { run = { -> vim.fn.[fzf#install()] } }
  use 'junegunn/fzf.vim'
  use 'junegunn/limelight.vim'
  use 'junegunn/goyo.vim'

  use 'wellle/targets.vim' -- " Vim plugin that provides additional text objects
  use 'chrisbra/unicode.vim' -- " A Vim plugin that provides a completion function for Unicode glyphs

  use {
    'henriquehbr/nvim-startup.lua',
    disable = true,
    config = [[ require('plugins/startup') ]]
  }

  -- tpope
  use {'tpope/vim-commentary', config = [[ require('plugins/vim-commentary') ]]}
  -- use {'tpope/vim-fugitive', config = [[ require('plugins/vim-fugitive') ]]}
  use 'reverseila/vim-rsi'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'

  use {'arp242/startscreen.vim'} -- Customize Vim's start screen.
  -- VIM Table Mode for instant table creation.
  -- use {'dhruvasagar/vim-table-mode'}
  -- -- vim .bashrc:23 -- goes to line 23 when enter the file.
  -- use {'wsdjeg/vim-fetch'}

  -- A Vim plugin for more pleasant editing on commit messages.
  -- use {'rhysd/committia.vim', config = [[ require('plugins/committia') ]]}

  -- Maximizes and restores the current window in Vim.
  -- use {'szw/vim-maximizer'}
  -- A powerful grammar checker for Vim using LanguageTool.
  -- use {'rhysd/vim-grammarous', disable = true}

end)
