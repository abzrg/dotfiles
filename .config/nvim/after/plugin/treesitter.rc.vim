if !exists('g:loaded_nvim_treesitter')
    finish
endif

lua << EOF
require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {"bash","foam", "cpp"},
    },
    indent = {
        enable = false,
        disable = {"bash","cpp", "foam"},
    },
    ensure_installed = {
        "c",
        "cpp",
        "python",
        "css",
        "lua",
        "bash",
        "latex",
        "javascript"
    }
}
EOF
