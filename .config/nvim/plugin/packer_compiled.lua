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
  ["committia.vim"] = {
    config = { " require('plugins/committia') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/committia.vim"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/nightfox.nvim"
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
  ["nvim-lua-guide"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/nvim-lua-guide"
  },
  ["nvim-treesitter"] = {
    config = { " require('plugins/treesitter') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["vim-commentary"] = {
    config = { " require('plugins/vim-commentary') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fetch"] = {
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/vim-fetch"
  },
  ["vim-fugitive"] = {
    config = { " require('plugins/vim-fugitive') " },
    loaded = true,
    path = "/home/ali/.local/share/nvim/site/pack/packer/start/vim-fugitive"
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
  }
}

time([[Defining packer_plugins]], false)
-- Config for: committia.vim
time([[Config for committia.vim]], true)
 require('plugins/committia') 
time([[Config for committia.vim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
 require('plugins/treesitter') 
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
 require('plugins/colorizer') 
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
 require('plugins/autopairs') 
time([[Config for nvim-autopairs]], false)
-- Config for: vim-commentary
time([[Config for vim-commentary]], true)
 require('plugins/vim-commentary') 
time([[Config for vim-commentary]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
 require('plugins/vim-fugitive') 
time([[Config for vim-fugitive]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end