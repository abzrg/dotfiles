" nnoremap <silent> ;f <Cmd>Telescope find_files<CR>
nnoremap <silent> ;r <Cmd>Telescope live_grep<CR>
nnoremap <silent> \\ <Cmd>Telescope buffers<CR>
nnoremap <silent> ;; <Cmd>Telescope help_tags<CR>
nnoremap <silent> ;h <Cmd>Telescope man_pages<CR>
nnoremap <silent> ;o <Cmd>Telescope oldfiles<CR>

lua << EOF
local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local utils = require('telescope.utils')

-- Map q to close the window (in normal mode)
telescope.setup {
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    },
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
        },
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        sorting_strategy = "ascending",
        color_devicons = true,
        layout_config = {
            prompt_position = "bottom",
            horizontal = {
                width_padding = 0.04,
                height_padding = 0.1,
                preview_width = 0.6,
            },
            vertical = {
                width_padding = 0.05,
                height_padding = 1,
                preview_height = 0.5,
                },
        },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
            n = {
                ["q"] = actions.close
            },
        },
    }
}

require('telescope').load_extension('fzy_native')

-- Custom functions (in lua/ali/telescope)
custom_functions = require('ali.telescope')

-- git_branches
vim.api.nvim_set_keymap(
  "n",
  "<leader>gb",
  [[<Cmd>lua require'telescope.builtin'.git_branches()<CR>]],
  { noremap = true, silent = true }
)

-- git_status - <tab> to toggle staging
--vim.api.nvim_set_keymap(
--  "n",
--  "gs",
--  [[<Cmd>lua require'telescope.builtin'.git_status()<CR>]],
--  { noremap = true, silent = true }
--)

-- keymaps
vim.api.nvim_set_keymap(
  "n",
  ";k",
  [[<Cmd>lua require'telescope.builtin'.keymaps()<CR>]],
  { noremap = true, silent = true }
)

-- marks
vim.api.nvim_set_keymap(
  "n",
  ";m",
  [[<Cmd>lua require'telescope.builtin'.marks()<CR>]],
  { noremap = true, silent = true }
)

-- Find files (including hidden) with gitfiles & fallback on find_files
vim.api.nvim_set_keymap(
  "n",
  ";f",
  [[<Cmd>lua custom_functions.project_files()<CR>]],
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>nb",
  [[<Cmd>lua custom_functions.browse_notes()<CR>]],
  { noremap = true, silent = true }
)

-- Find notes files
vim.api.nvim_set_keymap(
  "n",
  "<leader>nf",
  [[<Cmd>lua custom_functions.find_notes()<CR>]],
  { noremap = true, silent = true }
)

-- Search through notes
vim.api.nvim_set_keymap(
  "n",
  "<leader>ng",
  [[<Cmd>lua custom_functions.grep_notes()<CR>]],
  { noremap = true, silent = true }
)

-- Find neovim configs
vim.api.nvim_set_keymap(
  "n",
  "<leader>vf",
  [[<Cmd>lua custom_functions.find_nvim_config()<CR>]],
  { noremap = true, silent = true }
)

-- Grep neovim configs
vim.api.nvim_set_keymap(
  "n",
  "<leader>vg",
  [[<Cmd>lua custom_functions.grep_nvim_config()<CR>]],
  { noremap = true, silent = true }
)

-- Find script files
vim.api.nvim_set_keymap(
  'n',
  ';s',
  [[<Cmd>lua custom_functions.find_scripts()<CR>]],
  {noremap = true, silent = true}
)
EOF
