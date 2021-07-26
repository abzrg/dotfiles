nnoremap <silent> ;f <Cmd>Telescope find_files<CR>
nnoremap <silent> ;r <Cmd>Telescope live_grep<CR>
nnoremap <silent> \\ <Cmd>Telescope buffers<CR>
nnoremap <silent> ;; <Cmd>Telescope help_tags<CR>

lua << EOF
local actions = require('telescope.actions')

-- Map q to close the window (in normal mode)
require('telescope').setup {
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close
			},
		},
	}
}
EOF
