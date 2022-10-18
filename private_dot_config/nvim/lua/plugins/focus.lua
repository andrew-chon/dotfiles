-----------------------------------------------------------
-- Window manager
-----------------------------------------------------------

-- Plugin: focus.nvim
-- url: https://github.com/beauwilliams/focus.nvim

-- Keybindings are defined in `core/keymaps.lua`:
-- https://github.com/beauwilliams/focus.nvim#vim-commands

local status_ok, focus = pcall(require, 'focus')
if not status_ok then
  vim.notify('focus not ok', vim.log.levels.WARN)
  return
end

  focus.setup()