local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')
local util = require('lspconfig/util')

---  Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {'documentation', 'detail', 'additionalTextEdits'}
}

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- local function add_lsp_buffer_keybindings(bufnr)
--   local keys = {
--     ["K"] = {"<cmd>lua vim.lsp.buf.hover()<CR>", "Show hover"},
--     ["gd"] = {"<cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition"},
--     ["gD"] = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto declaration"},
--     ["gr"] = {"<cmd>lua vim.lsp.buf.references()<CR>", "Goto references"},
--     ["gi"] = {
--       "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto implementation"
--     },
--     ["gs"] = {
--       "<cmd>lua vim.lsp.buf.signature_help()<CR>", "show signature help"
--     },
--     ["gp"] = {
--       "<cmd>lua require'lsp.peek'.Peek('definition')<CR>", "Peek definition"
--     },
--     ["gl"] = {
--       "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false, border = 'single' })<CR>",
--       "Show line diagnostics"
--     }
--   }
--   return keys
-- end

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  lsp_highlight_document(client)

  -- -- Mappings
  local opts = {noremap = true, silent = true}

  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.reference()<CR>', opts)
  buf_set_keymap('n', 'gl',
                 '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false, border = \'single\' })<CR>',
                 opts)
  buf_set_keymap('n', 'gp',
                 '<cmd>lua require\'lsp.peek\'.Peek(\'definition\')<CR>', opts)
  buf_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

  protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '' -- TypeParameter
  }
end

-- vim.cmd([[autocmd CursorHold,CursorHoldI * lua require('code_action_utils').code_action_listener()]])

-- Add diagnostics to quicklist
-- https://github.com/neovim/nvim-lspconfig/issues/69#issuecomment-789541466
-- do
--   local method = "textDocument/publishDiagnostics"
--   local default_handler = vim.lsp.handlers[method]
--   vim.lsp.handlers[method] = function(err, method, result, client_id, bufnr,
--                                       config)
--     default_handler(err, method, result, client_id, bufnr, config)
--     local diagnostics = vim.lsp.diagnostic.get_all()
--     local qflist = {}
--     for bufnr, diagnostic in pairs(diagnostics) do
--       for _, d in ipairs(diagnostic) do
--         d.bufnr = bufnr
--         d.lnum = d.range.start.line + 1
--         d.col = d.range.start.character + 1
--         d.text = d.message
--         table.insert(qflist, d)
--       end
--     end
--     vim.lsp.util.set_qflist(qflist)
--   end
-- end

--------------------{ TSSERVER LANGUAGE-SERVER }-------------------------------

-- → npm i -g typescript typescript-language-server
nvim_lsp.tsserver.setup {
  cmd = {"typescript-language-server", "--stdio"},
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "javascript", "javascriptreact", "javascript.jsx", "typescript",
    "typescriptreact", "typescript.tsx"
  },
  init_options = {hostInfo = "neovim"},
  root_dir = util.root_pattern("package.json", "tsconfig.json", ".git", ".js",
                               vim.loop.cwd())
}

------------------{ VSCODE HTML LANGUAGE-SERVER }------------------------------
local root_pattern = util.root_pattern("package.json")

require'lspconfig'.html.setup {
  cmd = {"vscode-html-language-server", "--stdio"},
  filetypes = {"html"},
  init_options = {
    configurationSection = {"html", "css", "javascript"},
    embeddedLanguages = {css = true, javascript = true}
  },
  root_dir = function(fname)
    return root_pattern(fname) or vim.loop.os_homedir()
  end,
  settings = {},
  capabilities = capabilities,
  on_attach = on_attach
}

--------------------------------{ LUA }----------------------------------------
-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
local USER = vim.fn.expand('$USER')
local DATA_HOME = vim.fn.expand('$XDG_DATA_HOME')

local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
  sumneko_root_path = "/Users/" .. USER ..
                          "/.local/share/nvim/ls/lua-language-server"
  sumneko_binary = "/Users/" .. USER ..
                       "/.local/share/ls/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
  sumneko_root_path = DATA_HOME .. "/nvim/ls/lua-language-server"
  sumneko_binary = DATA_HOME ..
                       "/nvim/ls/lua-language-server/bin/Linux/lua-language-server"
else
  print("Unsupported system for sumneko")
end

require'lspconfig'.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';')
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
        },
        preloadFileSize = 500
      }
    }
  }
}

----------------------------{ EMMET LANGUAGE SERVER }--------------------------

-- https://github.com/windwp/emmet-ls
-- # npm install -g emmet-ls

local configs = require 'lspconfig/configs'

configs.emmet_ls = {
  default_config = {
    cmd = {'emmet-ls', '--stdio'},
    filetypes = {'html', 'css'},
    root_dir = function()
      return vim.loop.cwd()
    end,
    settings = {}
  }
}

nvim_lsp.emmet_ls.setup {on_attach = on_attach}

-------------------------------{ BASH }----------------------------------------

-- https://github.com/bash-lsp/bash-language-server
-- # npm i -g bash-language-server

require'lspconfig'.bashls.setup {
  cmd = {"bash-language-server", "start"},
  cmd_env = {GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"},
  filetypes = {"sh"}
}

------------------------------{ CLANGD }---------------------------------------

-- https://clangd.llvm.org/installation.html
-- clangd relies on a JSON compilation database specified as
-- compile_commands.json or, for simpler projects, a compile_flags.txt. For
-- details on how to automatically generate one using CMake look here.
-- https://cmake.org/cmake/help/latest/variable/CMAKE_EXPORT_COMPILE_COMMANDS.html

require'lspconfig'.clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {"clangd", "--background-index"},
  filetypes = {"c", "cpp", "objc", "objcpp"},
  -- on_init = function to handle changing offsetEncoding
  root_dir = root_pattern("compile_commands.json", "compile_flags.txt", ".git") or
      function()
        return vim.loop.cwd()
      end
}

---------------------------------{ CMAKE }-------------------------------------

-- https://github.com/regen100/cmake-language-server
-- # pip3 install cmake-language-server

require'lspconfig'.cmake.setup {
  cmd = {"cmake-language-server"},
  filetypes = {"cmake"},
  init_options = {buildDirectory = "build"},
  root_dir = root_pattern(".git", "compile_commands.json", "build")
}

----------------------------------{ PYRIGHT }----------------------------------

-- https://github.com/microsoft/pyright
-- npm install -g pyright

require'lspconfig'.pyright.setup {
  -- Commands:
  -- - PyrightOrganizeImports: Organize Imports
  cmd = {"pyright-langserver", "--stdio"},
  filetypes = {"python"},
  root_dir = function(fname)
    local root_files = {
      'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile',
      'pyrightconfig.json'
    }
    return util.root_pattern(unpack(root_files))(fname) or
               util.find_git_ancestor(fname) or util.path.dirname(fname)
  end,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true
      }
    }
  }
}

--------------------------------{ Zeta-Note }----------------------------------
require'lspconfig'.zeta_note.setup {
  cmd = {'/usr/local/bin/zeta-note-language-server'},
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {"markdown"},
  root_dir = function()
    return vim.loop.cwd()
  end
}
