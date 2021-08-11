if !exists('g:loaded_nvim_treesitter')
    finish
endif

lua << EOF
require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {"html","css","c","bash", "cpp"},
    },
    indent = {
        enable = false,
        disable = {"css","c","bash","cpp"},
    },
    ensure_installed = {
        "c",
        "cpp",
        "python",
        "lua",
        "bash",
        "latex",
        "javascript"
    }
}
EOF
