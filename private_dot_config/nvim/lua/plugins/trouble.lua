-----------------------------------------------------------
-- Diagnostics manager
-----------------------------------------------------------

-- Plugin: trouble.nvim
-- url: https://github.com/folke/trouble.nvim

local status_ok, trouble = pcall(require, 'trouble')
if not status_ok then
  vim.notify('trouble not ok', vim.log.levels.WARN)
  return
end

trouble.setup()