local status = pcall(require, "nvim-treesitter")
if (not status) then
  return
end

require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        disable = {"bash", "vim"},
    },
    indent = {
        enable = false,
        -- disable = {"c","bash","cpp"},
        disable = {"bash"},
    },
    ensure_installed = 'all',
    ignore_install = { "jsonc" }
}
