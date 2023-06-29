return
{
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "jay-babu/mason-null-ls.nvim",
        "williamboman/mason.nvim"
    },
    config = function()
        local mason = require('mason')
        local null_ls = require('null-ls')
        local mason_null_ls = require('mason-null-ls')

        mason.setup()

        local lsp_formatting = function(bufnr)
            vim.lsp.buf.format({
                filter = function(client)
                    -- apply whatever logic you want (in this example, we'll only use null-ls)
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
            on_attach = on_attach,
            sources = {
                -- Rust
                null_ls.builtins.formatting.rustfmt,
                -- JavaScript
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.diagnostics.eslint_d,
                null_ls.builtins.code_actions.eslint_d,
                -- Go
                null_ls.builtins.diagnostics.golangci_lint,
                null_ls.builtins.formatting.gofmt,
                null_ls.builtins.formatting.goimports
                -- null_ls.builtins.formatting.golines
                }
        })

        mason_null_ls.setup({
            automatic_installation = true
        })


        -- -- Add null-ls sources here
        -- local sources = {
        --     'eslint_d',
        --     'gofmt',
        --     'golangci_lint',
        --     'prettierd',
        -- }

        -- null_ls.setup({
        --     on_attach = on_attach,
        -- })


        -- mason_null_ls.setup({
        --     ensure_installed = sources,
        --     automatic_installation = true,
        --     handlers = {}
        -- })
    end
}
