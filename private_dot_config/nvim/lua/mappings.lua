local map = require('utils').map
local M = {}

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require"telescope.builtin".git_files)
  if not ok then require"telescope.builtin".find_files(opts) end
end

-- Remap space as leader key
map('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Telescope
-- -- navigation
map("n", "<Leader>ff", "<CMD>lua require'mappings'.project_files()<CR>")
map('n', '<leader>fp', ':Telescope find_files<cr>')
map('n', '<leader>fk', ':Telescope buffers<cr>')
map('n', '<leader>fs', ':Telescope live_grep<cr>')
map('n', '<leader>fw', ':Telescope grep_string<cr>')
-- -- git navigation
map('n', '<leader>ggc', ':Telescope git_commits<cr>')
map('n', '<leader>ggs', ':Telescope git_status<cr>')

-- LSP
M.on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)

  -- Disable tsserver formatting so it doesn't conflict with null-ls formatting
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end
end

-- Nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>')

-- Git signs
map('n', '<leader>hl', ':Gitsigns toggle_linehl<CR>')

-- Bufferline
map('n', '<S-h>', ':BufferLineCyclePrev<CR>')
map('n', '<S-l>', ':BufferLineCycleNext<CR>')
map('n', '<S-w>', ':bdelete<CR>')

-- Toggleterm
map('t', '<Esc>', '<C-\\><C-n>')

-- Window Management
map('n', '<C-h>', '<C-w>h') -- Move between windows
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('t', '<C-h>', '<C-\\><C-n><C-w>h') -- move when terminal windows are open
map('t', '<C-j>', '<C-\\><C-n><C-w>j')
map('t', '<C-k>', '<C-\\><C-n><C-w>k')
map('t', '<C-l>', '<C-\\><C-n><C-w>l')
map('n', '<leader>sv', '<C-w>v') -- Split vertically
map('n', '<leader>sh', '<C-w>s') -- Split vertically
map('n', '<leader>sq', '<C-w>q') -- Close window

-- Clipboard
map('n', '<leader>y', '\"*y') -- Yank selected to Clipboard
map('n', '<leader>Y', '\"+y') -- Yank line to Clipboard
return M

