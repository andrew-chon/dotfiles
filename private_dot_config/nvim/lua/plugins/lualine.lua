-----------------------------------------------------------
-- Statusline
-----------------------------------------------------------

-- Plugin: Lualine
-- url: https://github.com/nvim-lualine/lualine.nvim

local lualine_ok, lualine = pcall(require, 'lualine')
if not lualine_ok then
  vim.notify('lualine not ok', vim.log.levels.WARN)
  return
end

lualine.setup({
    options = {
      globalstatus = true
    },
    extensions = {'nvim-tree'}
  })
  