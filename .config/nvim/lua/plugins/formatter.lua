require('formatter').setup({
  logging = false,
  filetype = {
    ["*"] = {
      {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
    },
    javascript = { ----------------- { JavaScript } ---------------------------
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath", "--embedded-language-formatting=auto",
            "--config=$HOME/.config/nvim/prettier.json",
            vim.api.nvim_buf_get_name(0), '--single-quote'
          },
          stdin = true
        }
      end
    },
    html = { --------------------- { HTML } -----------------------------------
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    css = { -----------------------{ CSS }-------------------------------------
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath", "--embedded-language-formatting=auto",
            "--config=$HOME/.config/nvim/prettier.json",
            vim.api.nvim_buf_get_name(0), '--single-quote'
          },
          stdin = true
        }
      end
    },
    lua = { -------------------------{ LUA }-----------------------------------
      -- lua-format
      function()
        return {
          exe = "lua-format",
          args = {
            "-i", "--no-keep-simple-function-one-line",
            "--break-after-table-lb", "--tab-width=2", "--no-use-tab",
            "--indent-width=2"
          },
          stdin = false
        }
      end
    },
    cpp = { ------------------------- { CPP } --------------------------------
      -- clang-format
      function()
        return {
          exe = "clang-format",
          args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
          stdin = true,
          cwd = vim.fn.expand('%:p:h') -- Run clang-format in cwd of the file.
        }
      end
    },
    c = { ----------------------------- { C } ---------------------------------
      -- clang-format
      function()
        return {
          exe = "clang-format",
          args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
          stdin = true,
          cwd = vim.fn.expand('%:p:h') -- Run clang-format in cwd of the file.
        }
      end
    }
    -- ['typescript.tsx'] = ...
  }
})

vim.api.nvim_set_keymap('n', '<M-f>', ':Format<CR>',
                        {noremap = true, silent = true})

-- Format on save
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.css,*html FormatWrite
augroup END
]], true)
