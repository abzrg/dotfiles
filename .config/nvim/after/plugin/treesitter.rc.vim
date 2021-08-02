if !exists('g:loaded_nvim_treesitter')
    finish
endif

lua << EOF
require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {"html", "css", "foam", "cpp"},
    },
    indent = {
        enable = false,
        disable = {"cpp", "foam"},
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
