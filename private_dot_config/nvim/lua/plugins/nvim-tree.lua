-----------------------------------------------------------
-- File manager configuration file
-----------------------------------------------------------

-- Plugin: nvim-tree
-- url: https://github.com/kyazdani42/nvim-tree.lua

-- Keybindings are defined in `core/keymaps.lua`:
-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt

local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  vim.notify('nvim_tree not ok', vim.log.levels.WARN)
  return
end

nvim_tree.setup()