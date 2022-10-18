-----------------------------------------------------------
-- Git decorations
-----------------------------------------------------------

-- Plugin: gitsigns
-- url: https://github.com/lewis6991/gitsigns.nvim


local status_ok, gitsigns = pcall(require, 'gitsigns')
if not status_ok then
  vim.notify('gitsigns not ok', vim.log.levels.WARN)
  return
end

gitsigns.setup({
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  }
})