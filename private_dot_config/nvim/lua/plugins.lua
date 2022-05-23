local fn = vim.fn

-- Automatically install packer on a new system
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Auto compile
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })

return require('packer').startup(function(use)
  -- Load lua path
  local lua_path = function(name)
    return string.format("require'plugins.%s'", name)
  end

  -- Allow packer to mange itself
  use { 'wbthomason/packer.nvim' }

  -- Theme
  -- use { 'sainnhe/everforest' }
  use { 'rebelot/kanagawa.nvim'}

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' },  config = lua_path"null-ls" } -- eslint/formatter
  use { 'hrsh7th/nvim-cmp', config = lua_path"nvim-cmp" } -- autocompletion library
  use { 'hrsh7th/cmp-nvim-lsp' } -- hook up cmp to neovim lsp
  use { 'jose-elias-alvarez/typescript.nvim' } -- Improve typescript lsp 

  -- Snippets
  use { 'L3MON4D3/LuaSnip', config =lua_path"LuaSnip" }
  use { 'saadparwaiz1/cmp_luasnip' } -- snippet engine required for nvim-cmp
  use { 'rafamadriz/friendly-snippets' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = lua_path"nvim-treesitter" }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }

  -- File explorer
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }, config = lua_path"nvim-tree" }

  -- Lualine
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }, config = lua_path"lualine" }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' }, config = lua_path"telescope" }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Nvim-autopairs
  use { 'windwp/nvim-autopairs', config = lua_path"nvim-autopairs" }

  -- Comments
  use { 'numToStr/Comment.nvim', config=lua_path"Comment" }

  -- Gitsigns
  use { 'lewis6991/gitsigns.nvim', config = lua_path"gitsigns" } 

  -- Indentation Guides
  use { 'lukas-reineke/indent-blankline.nvim', config = lua_path"indent-blankline" }

  -- Sessions
  use { 'rmagatti/auto-session', config = lua_path"auto-session" }
  use { 'rmagatti/session-lens', config = lua_path"session-lens" }

  -- Movement
  use { 'ggandor/lightspeed.nvim' }

  -- Window Management
  use { 'beauwilliams/focus.nvim', config = lua_path"focus" }
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons', config = lua_path"bufferline" }

  -- Key bindings
  use { 'folke/which-key.nvim', config = lua_path"which-key" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
