do
    local ok, _ = pcall(require, 'impatient')
  
    if not ok then
      vim.notify('impatient.nvim not installed', vim.log.levels.WARN)
    end
end

require('packer_init')
require('core/options')
require('core/autocmds')
require('core/keymaps')
require('core/colors')
require('lsp')

-- Plugin configs
require('plugins/nvim-cmp')
require('plugins/LuaSnip')
require('plugins/nvim-tree')
require('plugins/lualine')
require('plugins/indent-blankline')
require('plugins/nvim-treesitter')
require('plugins/telescope')
require('plugins/nvim-autopairs')
require('plugins/gitsigns')
require('plugins/focus')
require('plugins/bufferline')
require('plugins/leap')
require('plugins/null-ls')
require('plugins/trouble')






