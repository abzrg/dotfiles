require("indent_blankline").setup {
  char = "¦",
  buftype_exclude = {"terminal", "nofile"}
}


vim.g.indentLine_faster = 1
vim.g.indentLine_fileTypeExclude = {
  'NvimTree',
  'help',
  'markdown',
  'packer',
  'startify',
  'tex',
  'txt',
}
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_space_char_blankline = ' '
vim.g.indent_blankline_use_treesitter = true
