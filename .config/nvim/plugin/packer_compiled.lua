-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/ali/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/ali/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/ali/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/ali/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ali/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["formatter.nvim"] = {
    config = { " require('plugins/formatter') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/goyo.vim"
  },
  ["hop.nvim"] = {
    config = { " require('plugins/hop') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { " require('plugins/indent-blankline') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["limelight.vim"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/limelight.vim"
  },
  ["lspsaga.nvim"] = {
    config = { " require('plugins/lspsaga') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { " require('plugins/lualine') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  neogit = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["neoscroll.nvim"] = {
    config = { " require('plugins/neoscroll') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["numb.nvim"] = {
    config = { " require('plugins/numb') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/numb.nvim"
  },
  ["nvcode-color-schemes.vim"] = {
    config = { " require('plugins/nvcode-color-schemes') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/nvcode-color-schemes.vim"
  },
  ["nvim-autopairs"] = {
    config = { " require('plugins/autopairs') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    config = { " require('plugins/colorizer') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    after = { "tabout.nvim" },
    after_files = { "/home/ali/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { " require('plugins/compe') " },
    loaded = false,
    needs_bufread = false,
    path = "/home/ali/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { " require('plugins/lspconfig') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lua-guide"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/nvim-lua-guide"
  },
  ["nvim-tree.lua"] = {
    config = { " require('plugins/nvim-tree')" },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { " require('plugins/treesitter') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { " require('plugins/ts-autotag') " },
    loaded = false,
    needs_bufread = false,
    path = "/home/ali/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    config = { " require('plugins/ts-rainbow') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["starlite-nvim"] = {
    config = { " require('plugins/starlite') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/starlite-nvim"
  },
  ["startscreen.vim"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/startscreen.vim"
  },
  ["tabout.nvim"] = {
    config = { " require('plugins/tabout') " },
    load_after = {
      ["nvim-compe"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ali/.local/share/nvim/site/pack/packer/opt/tabout.nvim",
    wants = { "nvim-treesitter" }
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope.nvim"] = {
    config = { " require('plugins/telescope') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["unicode.vim"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/unicode.vim"
  },
  ["vim-commentary"] = {
    config = { " require('plugins/vim-commentary') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rsi"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/vim-rsi"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
 require('plugins/hop') 
time([[Config for hop.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
 require('plugins/treesitter') 
time([[Config for nvim-treesitter]], false)
-- Config for: starlite-nvim
time([[Config for starlite-nvim]], true)
 require('plugins/starlite') 
time([[Config for starlite-nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
 require('plugins/indent-blankline') 
time([[Config for indent-blankline.nvim]], false)
-- Config for: numb.nvim
time([[Config for numb.nvim]], true)
 require('plugins/numb') 
time([[Config for numb.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
 require('plugins/lualine') 
time([[Config for lualine.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
 require('plugins/lspsaga') 
time([[Config for lspsaga.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
 require('plugins/autopairs') 
time([[Config for nvim-autopairs]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
 require('plugins/telescope') 
time([[Config for telescope.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
 require('plugins/colorizer') 
time([[Config for nvim-colorizer.lua]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
 require('plugins/neoscroll') 
time([[Config for neoscroll.nvim]], false)
-- Config for: vim-commentary
time([[Config for vim-commentary]], true)
 require('plugins/vim-commentary') 
time([[Config for vim-commentary]], false)
-- Config for: nvcode-color-schemes.vim
time([[Config for nvcode-color-schemes.vim]], true)
 require('plugins/nvcode-color-schemes') 
time([[Config for nvcode-color-schemes.vim]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
 require('plugins/formatter') 
time([[Config for formatter.nvim]], false)
-- Config for: nvim-ts-rainbow
time([[Config for nvim-ts-rainbow]], true)
 require('plugins/ts-rainbow') 
time([[Config for nvim-ts-rainbow]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
 require('plugins/lspconfig') 
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
 require('plugins/nvim-tree')
time([[Config for nvim-tree.lua]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag'}, { event = "FileType html" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsx ++once lua require("packer.load")({'nvim-ts-autotag'}, { event = "FileType jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-ts-autotag'}, { event = "FileType javascript" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-compe'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au FileType xml ++once lua require("packer.load")({'nvim-ts-autotag'}, { event = "FileType xml" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
