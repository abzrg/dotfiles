if !exists('g:loaded_nvim_treesitter')
	finish
endif

lua << EOF
require 'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		disable = {"html", "css", "javascript"},
	},
	indent = {
		enable = false,
		disable = {},
	},
	ensure_installed = {
		"c",
		"cpp",
		"python",
		"css",
		"lua",
		"bash",
		"latex",
	}
}
EOF
