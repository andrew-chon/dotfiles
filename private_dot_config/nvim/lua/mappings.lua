local map = require('utils').map

--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>')

-- Telescope
map('n', '<leader><space>', require('telescope.builtin').buffers)
map('n', '<leader>sf', function()
  require('telescope.builtin').find_files { previewer = false }
end)
map('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
map('n', '<leader>sh', require('telescope.builtin').help_tags)
map('n', '<leader>st', require('telescope.builtin').tags)
map('n', '<leader>sd', require('telescope.builtin').grep_string) -- Search for string you are current on
map('n', '<leader>sp', require('telescope.builtin').live_grep)
map('n', '<leader>so', function()
  require('telescope.builtin').tags { only_current_buffer = true }
end)
map('n', '<leader>?', require('telescope.builtin').oldfiles)

-- Focus
map('n', '<leader>h', ':FocusSplitLeft<CR>')
map('n', '<leader>j', ':FocusSplitDown<CR>')
map('n', '<leader>k', ':FocusSplitUp<CR>')
map('n', '<leader>l', ':FocusSplitRight<CR>')

-- Bufferline
map('n', '<S-h>', ':BufferLineCyclePrev<CR>')
map('n', '<S-l>', ':BufferLineCycleNext<CR>')
map('n', '<S-w>', ':bdelete<CR>')

-- Clipboard
map('v', '<C-c>', '"+yi') -- Copy selected
map('v', '<C-x>', '"+c') -- Cut selected
map('v', '<C-v>', 'c<ESC>"+p') -- Paste selected
map('i', '<C-v>', '<ESC>"+pa') -- Paste selected

-- Session lens
map('n', '<leader>sl', ':Telescope session-lens search_session<CR>')
