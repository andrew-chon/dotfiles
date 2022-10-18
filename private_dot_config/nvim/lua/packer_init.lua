-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme


-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  vim.notify('packer not installed', vim.log.levels.WARN)
  return
end

-- Install plugins
return packer.startup(function(use)
    -- Dependencies
    use 'wbthomason/packer.nvim'          -- packer can manage itself
    use 'lewis6991/impatient.nvim'        -- speed up startup
    use 'nvim-lua/plenary.nvim'           -- common dependency needed
    use 'nvim-tree/nvim-web-devicons'

    -- Color schemes
    use { 'EdenEast/nightfox.nvim', run = ':NightfoxCompile' }
    -- use 'sainnhe/everforest'
    -- use 'rebelot/kanagawa.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'jose-elias-alvarez/typescript.nvim'    -- Improve typescript lsp 

    -- Diagnostics
    use 'folke/trouble.nvim'

    -- Linting/Formatting
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'jayp0521/mason-null-ls.nvim'

    -- Autocomplete
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'p00f/nvim-ts-rainbow'

    -- File manager
    use 'nvim-tree/nvim-tree.lua'

    -- Statusline
    use 'nvim-lualine/lualine.nvim'

    -- Indent line
    use 'lukas-reineke/indent-blankline.nvim'

    -- Telescope
    use 'nvim-telescope/telescope.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

    -- Auto-pairs
    use 'windwp/nvim-autopairs'
    use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
          require("nvim-surround").setup()
      end
  })

    -- Comments
    use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
    }

    -- Git decorations
    use 'lewis6991/gitsigns.nvim'
  
    -- Windows management
    use 'beauwilliams/focus.nvim'
    use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons' }

    -- Movement
    use 'ggandor/leap.nvim'

    -- Git
    use 'sindrets/diffview.nvim'
    use 'tpope/vim-fugitive'

    -- Sessions
    use {
      'rmagatti/auto-session',
      config = function()
        require("auto-session").setup {
          log_level = "error",
          auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
        }
      end
    }
    use {
      'rmagatti/session-lens',
      requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
      config = function()
        require('session-lens').setup({--[[your custom config--]]})
      end
    }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)