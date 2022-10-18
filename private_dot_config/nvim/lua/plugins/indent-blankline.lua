-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------

-- Plugin: indent-blankline
-- url: https://github.com/lukas-reineke/indent-blankline.nvim


local status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then
  vim.notify('indent_blankline not ok', vim.log.levels.WARN)
  return
end

indent_blankline.setup({
    char = '┊',
    use_treesitter = true,
    show_trailing_blankline_indent = false,
    show_current_context = true,                -- highlights current indentation line
    show_current_context_start = true           -- underlines start of context
})