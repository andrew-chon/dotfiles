-----------------------------------------------------------
-- Telescope configuration file
----------------------------------------------------------

-- Plugin: telescope
-- url: https://github.com/nvim-telescope/telescope.nvim

-- Keybindings are defined in `core/keymaps.lua`:
-- https://github.com/nvim-telescope/telescope.nvim#pickers


local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  vim.notify('telescope not ok', vim.log.levels.WARN)
  return
end

telescope.load_extension('fzf')
