local wo = vim.wo
local bo = vim.bo
local opt = vim.opt  -- set options with automatic scope awareness
        
-- global options
opt.number = true -- set line number
opt.relativenumber = true -- show relative line numbers from main line
opt.numberwidth = 4 -- columns used for the line number
opt.syntax = 'enable' -- enable syntax highlighting
-- -- number of spaces in a <Tab>
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true
--
opt.inccommand = 'nosplit' -- incremental live completion when substituting
opt.hlsearch = true -- sets highlight on search
opt.hidden = true -- do not save when switching buffers
opt.mouse = 'a' -- enable mouse mode
opt.swapfile = false -- disable swap files
opt.undofile = false -- disable undo files
opt.ignorecase = true -- case insensitive search UNLESS /C
opt.smartcase = true -- case insensitive search UNLESS capital in search
opt.signcolumn = 'auto' -- maybe change to yes? depends on testing
opt.scrolloff  = 4 -- start scrolling when 4 lines from top or bottom
opt.list = true
opt.timeoutlen = 500 -- change length neovim waits for.  Mainly for which-key

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- Colors
if vim.fn.has("termguicolors") == 1 then
  vim.go.t_8f = "[[38;2;%lu;%lu;%lum"
  vim.go.t_8b = "[[48;2;%lu;%lu;%lum"
  vim.opt.termguicolors = true
end
vim.cmd[[colorscheme kanagawa]]
