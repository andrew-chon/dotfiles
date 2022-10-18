-----------------------------------------------------------
-- Movement
-----------------------------------------------------------

-- Plugin: leap.nvim
-- url: https://github.com/ggandor/leap.nvim

local status_ok, leap = pcall(require, 'leap')
if not status_ok then
  vim.notify('leap not ok', vim.log.levels.WARN)
  return
end

leap.add_default_mappings()