-----------------------------------------------------------
-- Formatting/Linting
-----------------------------------------------------------

-- Plugin: null-ls.nvim
-- url: https://github.com/jose-elias-alvarez/null-ls.nvim
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md

local status_ok, mason = pcall(require, 'mason')
if not status_ok then
  vim.notify('mason not ok', vim.log.levels.WARN)
  return
end

local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
  vim.notify('null-ls not ok', vim.log.levels.WARN)
  return
end

local status_ok, mason_null_ls = pcall(require, 'mason-null-ls')
if not status_ok then
  vim.notify('null-ls not ok', vim.log.levels.WARN)
  return
end

-- Required to be called first
mason.setup()

-- Avoid LSP formatting conflicts
-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts#neovim-08
local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- Only use null-ls for formatting to avoid conflicts with other LSPs
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

null_ls.setup({
    --  Add sources here for new languages
    sources = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.code_actions.eslint_d,
    },
    on_attach = on_attach,
})

-- Add null-ls sources here
local sources = {
    'eslint_d',
    'prettierd',
}

mason_null_ls.setup({
    ensure_installed = sources,
    automatic_installation = true
})