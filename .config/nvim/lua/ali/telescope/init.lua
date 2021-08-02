local builtin = require("telescope.builtin")
local utils = require("telescope.utils")

local M = {}

-- Repo File Finder
function M.project_files()
  local _, ret, stderr = utils.get_os_command_output({"git", "rev-parse", "--is-inside-work-tree"})
  local gitopts = {}
  local fileopts = {}

  gitopts.prompt_title = " Git Files"
  gitopts.prompt_prefix = "  "

  fileopts.hidden = true
  fileopts.file_ignore_patterns = {
    ".vim/",
    ".local/",
    ".cache/",
    "Downloads/",
    ".git/",
    "Dropbox/.*",
    "Library/.*",
    ".rustup/.*",
    "Movies/",
    ".cargo/registry/"
  }

  if ret == 0 then
    builtin.git_files(gitopts)
  else
    builtin.find_files(fileopts)
  end
end

-- Grep Notes
function M.grep_notes()
  local opts = {}
  opts.hidden = true
  -- opts.file_ignore_patterns = { 'thesaurus/'}
  opts.search_dirs = {
    "~/Notes/",
    "~/Documents/notes"
  }
  opts.prompt_prefix = "   "
  opts.prompt_title = " Grep Notes"
  opts.path_display = {"shorten"}
  builtin.live_grep(opts)
end

-- Find Note Files
function M.find_notes()
  builtin.find_files {
    prompt_title = " Find Notes",
    path_display = {"shorten"},
    cwd = "~/Notes/",
    layout_strategy = "horizontal",
    layout_config = {preview_width = 0.65, width = 0.75}
  }
end

-- -- Browse Notes
-- function M.browse_notes()
--   builtin.file_browser {
--     prompt_title = " Browse Notes",
--     prompt_prefix = " ﮷ ",
--     cwd = "~/Notes/",
--     layout_strategy = "horizontal",
--     layout_config = {preview_width = 0.65, width = 0.75}
--   }
-- end

-- Find Scripts Files
function M.find_scripts()
  local opts = {
    cwd = "~/.local/scripts",
    prompt_title = " Find Scripts",
    path_display = {"shorten"},
    layout_strategy = "horizontal",
    layout_config = {preview_width = 0.65, width = 0.75}
  }
  builtin.find_files(opts)
end

-- Neovim Config Browser
function M.find_nvim_config()
  local opts = {
    cwd = "~/.config/nvim",
    prompt_title = " Find NVim Config",
    path_display = {"shorten"},
    layout_strategy = "horizontal",
    layout_config = {preview_width = 0.65, width = 0.75}
  }
  builtin.find_files(opts)
end

return M
