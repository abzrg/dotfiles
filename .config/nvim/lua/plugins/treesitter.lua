local status = pcall(require, "nvim-treesitter")
if (not status) then
  return
end

require('nvim-treesitter.configs').setup {
    -- ts-context-commentstring
    context_commentstring = {
        enable = true
    },
    highlight = {
        enable = true,
        disable = {"c","bash", "cpp"},
    },
    indent = {
        enable = false,
        disable = {"c","bash","cpp"},
    },
    ensure_installed = 'all',
    ignore_install = { "jsonc" }
}
