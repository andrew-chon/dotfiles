local map = require('utils').map

--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------
-- Open diagnostics
map('n', '<leader>do', vim.diagnostic.open_float)
map('n', '<leader>dp', vim.diagnostic.goto_prev)
map('n', '<leader>dn', vim.diagnostic.goto_next)

-- Clipboard
map('v', '<C-c>', '"+yi') -- Copy selected
map('v', '<C-x>', '"+c') -- Cut selected
map('v', '<C-v>', 'c<ESC>"+p') -- Paste selected
map('i', '<C-v>', '<ESC>"+pa') -- Paste selected:

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------
-- Nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>')

-- Telescope
local builtin = require('telescope.builtin')
map('n', '<leader><space>', builtin.buffers)                -- Lists open buffers in current neovim instance
map('n', '<leader>sf', function()                           -- Lists files in your current working directory, respects .gitignore
  builtin.find_files { previewer = false }
end)
map('n', '<leader>sb', builtin.current_buffer_fuzzy_find)   -- Live fuzzy search inside of the currently open buffer
map('n', '<leader>sh', builtin.help_tags)
map('n', '<leader>st', builtin.tags)
map('n', '<leader>sd', builtin.grep_string)                 -- Searches for the string under your cursor in your current working directory
map('n', '<leader>sp', builtin.live_grep)                   -- Search for a string in your current working directory and get results live as you type, respects .gitignore
map('n', '<leader>so', function()
  builtin.tags { only_current_buffer = true }
end)
map('n', '<leader>?', builtin.oldfiles)                     -- Lists previously open files

-- Focus
map('n', '<leader>h', ':FocusSplitLeft<CR>')
map('n', '<leader>j', ':FocusSplitDown<CR>')
map('n', '<leader>k', ':FocusSplitUp<CR>')
map('n', '<leader>l', ':FocusSplitRight<CR>')

-- Bufferline
map('n', '<S-h>', ':BufferLineCyclePrev<CR>')
map('n', '<S-l>', ':BufferLineCycleNext<CR>')
map('n', '<S-w>', ':bdelete<CR>')

-- Trouble
map('n', '<leader>xx', '<cmd>TroubleToggle<cr>')
map('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>')
map('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>')
