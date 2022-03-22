local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)
  -- Load lua path
  local lua_path = function(name)
    return string.format("require'plugins.%s'", name)
  end

  -- Allow packer to mange itself
  use { 'wbthomason/packer.nvim' }

  -- use { 'lewis6991/impatient.nvim' } -- speeds up startup?  TODO enable later

  -- Text
  use { 'numToStr/Comment.nvim', config=lua_path"Comment" }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep', }, config = lua_path"telescope" }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = lua_path"nvim-treesitter" }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }

  -- Themes
  use { 'rebelot/kanagawa.nvim'}

  -- Add indentation guides to blank lines TODO fix indentation lines
  use { 'lukas-reineke/indent-blankline.nvim', config = lua_path"indent-blankline" }
  
  -- Lualine
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }, config = lua_path"lualine" }

  -- Gitsigns
  use { 'lewis6991/gitsigns.nvim', config = lua_path"gitsigns" } 

  -- LSP
  use { 'neovim/nvim-lspconfig', config = lua_path"nvim-lspconfig" }
  use { 'williamboman/nvim-lsp-installer' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'jose-elias-alvarez/null-ls.nvim', config = lua_path"null-ls" }
  use { 'jose-elias-alvarez/nvim-lsp-ts-utils'} -- confirm working in nvim-lspconfig

  -- Nvim-tree
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons'}, config = lua_path"nvim-tree" }
  use { 'akinsho/bufferline.nvim', config = lua_path"bufferline" }

  -- Nvim-autopairs
  use { 'windwp/nvim-autopairs', config = lua_path"nvim-autopairs" }

  -- Which-key
  use { 'folke/which-key.nvim', config = lua_path"which-key"}

  -- Toggleterm
  use { 'akinsho/toggleterm.nvim', config = lua_path"toggleterm" }

  -- TODO add
  --[[
    auto-session
    nvim-ts-autotag  -- to auto close html tag
    nvim-ts-context-commentstring -- better commenting if needed
    nvim-colorizer.lua
  --]]
end)

