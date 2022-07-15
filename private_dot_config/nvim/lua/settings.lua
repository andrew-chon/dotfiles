local opt = vim.opt  -- set options with automatic scope awareness

-- Neovim options
opt.number = true -- set line number
opt.relativenumber = true -- show relative line numbers from main line
opt.numberwidth = 4 -- columns used for the line number
opt.syntax = 'enable' -- enable syntax highlighting
opt.tabstop = 2 -- width in "spaces" of an actual tab character
opt.softtabstop = 2 -- will make tab key insert combination of spaces to simulate tab stops
opt.shiftwidth = 2 --size of "indent". Keep same as tabstops
opt.expandtab = true -- will make tab key insert spaces instead of tab characters
opt.smartindent = true -- like 'autoindent' but recognizes C syntax for better indentation
opt.autoindent = true -- uses indent from previous line
opt.breakindent = true -- every wrapped line will be continue visually indented
opt.inccommand = 'nosplit' -- incremental live completion when substituting
opt.hlsearch = true -- enables highlight on search
opt.hidden = true -- do not save when switching buffers
opt.mouse = 'a' -- enable mouse mode
opt.swapfile = false -- disable swap files
opt.undofile = false -- disable undo files
opt.ignorecase = true -- case insensitive search UNLESS /C
opt.smartcase = true -- case insensitive search UNLESS capital in search
opt.signcolumn = 'auto' -- maybe change to yes? depends on testing
opt.scrolloff  = 2 -- start scrolling when # lines from top or bottom
opt.list = true
opt.timeoutlen = 300 -- change length neovim waits for.  Mainly for which-key
opt.completeopt = 'menuone,noselect' -- idk it was on kickstart.nvim
opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal" -- Better experience with auto-sessions

-- colors
if vim.fn.has("termguicolors") == 1 then
  vim.go.t_8f = "[[38;2;%lu;%lu;%lum"
  vim.go.t_8b = "[[48;2;%lu;%lu;%lum"
  opt.termguicolors = true
end

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Set color scheme
-- vim.g.everforest_background = 'medium'
-- vim.g.everforest_better_performance = 1
-- vim.cmd('colorscheme everforest')

vim.cmd('colorscheme kanagawa')
-- vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
-- vim.cmd[[colorscheme catppuccin]]

