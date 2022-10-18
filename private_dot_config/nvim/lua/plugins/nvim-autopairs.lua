-----------------------------------------------------------
-- Autopairs configuration file
----------------------------------------------------------

-- Plugin: nvim-autopairs
-- url: https://github.com/windwp/nvim-autopairs

-- Keybindings are defined in `core/keymaps.lua`:
-- https://github.com/nvim-telescope/telescope.nvim#pickers


local status_ok, npairs = pcall(require, 'nvim-autopairs')
if not status_ok then
  vim.notify('nvim-autopairs not ok', vim.log.levels.WARN)
  return
end

npairs.setup({
  check_ts = true,
  enable_check_bracket_line = false
})


-- nvim-cmp mappings
-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)