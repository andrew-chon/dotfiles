-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------vim.lsp.buf.formatting------------------------------------

-- Plugin: nvim-lspconfig
-- url: https://github.com/neovim/nvim-lspconfig

-- For configuration see the Wiki: https://github.com/neovim/nvim-lspconfig/wiki

local lsp_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_status_ok then
  return
end

local cmp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_status_ok then
  return
end

local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gr', "<cmd>TroubleToggle lsp_references<cr>", opts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    -- vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
    -- vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
  end


-- Add additional capabilities supported by nvim-cmp
-- See: https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- Add more LSP servers here
local servers = {
    'gopls',
    'jsonls',
    'rust_analyzer',
    'sumneko_lua',
    'tsserver',
}

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = servers,
    automatic_installation = true
})

-- Call setup for lsp servers
for _, server in ipairs(servers) do
    require("lsp.servers." ..server).setup(on_attach, capabilities)
end

