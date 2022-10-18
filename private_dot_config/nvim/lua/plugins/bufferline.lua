-----------------------------------------------------------
-- Buffer manager
-----------------------------------------------------------

-- Plugin: bufferline.nvim
-- url: https://github.com/akinsho/bufferline.nvim

-- Keybindings are defined in `core/keymaps.lua`:
-- https://github.com/akinsho/bufferline.nvim/blob/main/doc/bufferline.txt

local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
  vim.notify('bufferline not ok', vim.log.levels.WARN)
  return
end

bufferline.setup({
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = function()
          return vim.fn.getcwd()
        end,
        highlight = "Directory",
        text_align = "left"
      }
    },
  },
})