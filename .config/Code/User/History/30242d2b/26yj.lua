-- indent blankline settings

require("indent-blankline").setup {
    char = '┆',
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
    use_treesitter = true,
    show_current_context = true,
    show_end_of_line = true,
    space_char_blankline = ' ',
}
